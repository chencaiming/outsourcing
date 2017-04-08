program ra;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '付临门收单助手';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
