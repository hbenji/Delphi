unit ex1lerayonnementducorpsnoir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var dek, dee, dezeroabs, deh, dec, delgo, det, denm, detkelvin, denum, deden, dex, dey, deexp, deM : Extended;
    dqintgr, dqfrctn, dqz : double;
    dwCtrl : word;
begin
  dek       :=1.3806503e-23;  {constante de Boltzmann}
  dee       :=1.6021892e-19;  {charge de l'électron}
  dezeroabs :=273.15;         {zéro absolu}
  deh       :=6.62606876e-34; {constante de Planck}
  dec       :=299792458;      {vitesse de la lumière}
  dex       :=2.71828182846;  {nombre e ou nombre d'Euler}
  denm      :=1.0e-9;         {transformation des  nm  en  m}
{ detkelvin ?                  température en Kelvin}
{ devg ?                       tension de gap}
{ det ?                        température en Celsius}
{ deT3s2  ?                    1er résultat intermédiaire}
{ deexp  ?                     2ème résultat intermédiaire}
{ deS  ?                       courant d'obscurité}

  delgo:=StrToFloat(Edit1.Text);
  det:=StrToFloat(Edit2.Text);
  Asm
       finit                    { réinitialise la FPU }

       fld delgo                { st=lgo }
       fld denm                 { st=1.0e-9  st1=lgo }
       fmul                     { st=lgo }
       fstp delgo

       fld det                  { st=t }
       fld dezeroabs            { st=273.15  st1=t }
       fadd                     { st=T=t+273.15 }
       fstp detkelvin


       fld1
       fadd st, st
       fldpi
       fmul
       fld deh
       fmul
       fld dec
       fmul
       fld dec
       fmul
       fstp denum


       fld deh
       fld dec
       fmul
       fld delgo
       fdiv
       fld dek
       fdiv
       fld detkelvin
       fdiv
       fstp dey
  End;
  Label3.Caption:=FloatToStr(denum);
  Label4.Caption:=FloatToStr(dey);


  Asm
       finit                    { réinitialise la FPU }
{///////////////////////////////////////////////////////}
{//// Calcul de  X**Y  (X à l'exposant Y) //////////////}
{///////////////////////////////////////////////////////}
{///////////////////////////////////////////////////////}
{////  Etape 1 :   fixer la technique d'arrondi  ///////}
{///////////////////////////////////////////////////////}
       fstcw dwCtrl             { décharge le CtrlW dans DX }
       mov dx, dwCtrl
       and dx, not 0C00h        { RAZ bits 10 et 11 }
       or dx, 0400h             { b10=0  et  b11=1  : round down }
       xchg dx, dwCtrl          { XCHG => DX sauvegarde old CtrlW }
       push dx
       fldcw dwCtrl             { LOAD new CtrlW }
{///////////////////////////////////////////////////////}
{////  Etape 2 :   Z = Y*LOG2(X)    par  FYL2X  ////////}
{///////////////////////////////////////////////////////}
       fld  dey                 { empile dey -> ST }
       fld  dex                 { empile dex -> ST }
     fyl2x                           { réduction TOS }
{///////////////////////////////////////////////////////}
{////  Etape 3 :   séparer Z en ses parties     ////////}
{///////////////////////////////////////////////////////}
       fst dqz                  { sauver Z }
       fld dqz                  { pile :  st=Z  st(1)=Z }
     frndint                    { arrondir TOS :  st=I  st(1)=Z }
       fst dqintgr              { sauver I }
     fsub                       { faire Z-I -> F=st  (réduction TOS) }
       fstp dqfrctn             { sauver F }
{///////////////////////////////////////////////////////}
{////  Etape 4 :   calculer  2**Z = 2**(I+F)    ////////}
{///////////////////////////////////////////////////////}
       fld dqintgr              { st=I }
       fld dqfrctn              { st=F  st1=I }
     f2xm1                      { calcul de  2**F-1 -> st }
       fld1                     { st=1  st1=2**F-1  st2=I }
       fadd                     { st=2**F  st1=I }
     fscale                     { I décalages; st=2**Z }
{///////////////////////////////////////////////////////}
{////  Etape 5 :   L'état du registre de contrôle   ////}
{///////////////////////////////////////////////////////}
       pop dx
       mov dwCtrl, dx           { récupère old CtrlW }
       fldcw dwCtrl             { recharge old CtrlW }
{///////////////////////////////////////////////////////}
{////////////           Fin         ////////////////////}
{///////////////////////////////////////////////////////}

      fstp deexp
   end;


   Asm
       finit                    { réinitialise la FPU }

       fld deexp                { st=a }
       fld1               { st=rac(T**3)  st=a }
       fsub                { st=deexp  st1=rac(T**3)  st2=a }

       fld delgo
       fmul st, st
       fmul st, st
       fld delgo
       fmul

       fmul
       fstp deden


       finit


       fld denum
       fld deden
       fdiv
       fstp dem
   end;

  Label6.Caption:=FloatToStr(dem);

end;


end.
