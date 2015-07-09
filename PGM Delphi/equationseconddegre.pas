unit equationseconddegre;

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
  Delta: double;
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
Label1.Caption:=FloatToStr(Delta)


end;

end.
