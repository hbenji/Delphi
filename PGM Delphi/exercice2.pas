unit exercice2;

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
var eeO, eh, ee,  em, efact, eZ, eN, eres, eres2:Extended;
    pi,num,denum, multipli:double;

begin
  eeO:=8.85418782e-12;
  eh:=6.626176e-34;
  ee:=1.6021892e-19;
  em:=9.109534e-31;
  efact:=1.01e9;
  pi:=3.1415;

  eZ:=StrToFloat(Edit1.Text);
  eN:=StrToFloat(Edit2.Text);

  Asm
    finit     {réinialise la fpu }

    fld ee
    fmul st,st
    fld em
    fmul
    fld pi
    fmul
    fstp denum
    fld eh
    fmul st,st
    fld eeO
    fmul
    fstp num

    fld num
    fld denum
    fdiv

    fstp eres
  end;
  Label5.Caption:=FloatToStr(eres);

   Asm
    finit


    fld eN
    fmul st,st
    fld eZ
    fdiv
    fstp multipli
    fld eres
    fld multipli
    fmul

    fstp eres2
   end;
   Label6.Caption:=FloatToStr(eres2);
  end;

end.
