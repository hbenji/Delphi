program Project1;

uses
  Forms,
  Somme2Nb in 'Somme2Nb.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
