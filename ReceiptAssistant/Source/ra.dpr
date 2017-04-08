program ra;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  SetUnit in 'SetUnit.pas' {SetForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '付临门收单助手';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
