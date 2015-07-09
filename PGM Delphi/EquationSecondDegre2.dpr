unit EquationSecondDegre2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
var
A,B,C: Extended;
  Delta,x,x1,x2: double;
begin
A:=StrToFloat(Edit1.Text);
B:=StrToFloat(Edit2.Text);
C:=StrToFloat(Edit3.Text);
Asm
fld B
fmul st,st
fld A
fld C
fmul
fadd st,st
fadd st,st
fsub
fstp Delta
End;
Label1.Visible:=true;
Label1.Caption:=FloatToStr(Delta);
if Delta<0 then
  begin
  Form1.Height:=230;
  Label6.Visible:=true;
  Label6.Caption:='Pas de racine reelle';
  end
else if Delta=0 then
  begin Form1.Height:=230;
  Label6.Visible:=True;
  Label6.Caption:='Racine double';

  Asm
  fld b
  fchs
  fld a
  fadd st, st
  fdiv
  fstp x
End;
Label7.Visible:=true;
Label7.Caption:=FloatToStr(x);
end
else
  begin
    Form1.Height:=266;
    Label6.Visible:=true;
    Label6.Caption:='Racine X1:';
    Asm
      fld b
      fchs
      fld Delta
      fsqrt
      fadd
      fld A
      fadd st, st
      fdiv
      fstp x1
    End;
    Label7.Visible:=true;
    Label7.Caption:=FloatToStr(x1);

    Label8.Visible:=true;
    Label8.Caption:='Racine X2';
    Asm
      fld b
      fchs
      fld Delta
      fsqrt
      fsub
      fld A
      fadd st, st
      fdiv
      fstp x2
    End;
    Label9.Visible:=true;
    Label9.Caption:=FloatToStr(x2);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Height:=185;
  Edit1.Text:='1';
  Edit2.Text:='2';
  Edit3.Text:='3';
  Label5.Visible:=false;
  Label6.Visible:=false;
  Label7.Visible:=false;
  Label8.Visible:=false;
  Label9.Visible:=false;
end;

procedure TForm1.OKClick(Sender: TObject);
begin
  Form1.Height:=185;
  Edit1.Text:='1';
  Edit2.Text:='2';
  Edit3.Text:='3';
  Label5.Visible:=false;
  Label6.Visible:=false;
  Label7.Visible:=false;
  Label8.Visible:=false;
  Label9.Visible:=false;
end;

end;

end.
