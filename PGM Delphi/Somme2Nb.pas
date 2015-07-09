unit Somme2Nb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
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
var
A,B,C: Extended;
begin
  A:=StrToFloat(Edit1.Text);
  B:=StrToFloat(Edit2.Text);
  Asm
  fld A
  fld B
  fadd
  fstp C
  End;
  Label1.Caption:=FloatToStr(C)
end;

end.
