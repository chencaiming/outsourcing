program ra;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  SetUnit in 'SetUnit.pas' {SetForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '�������յ�����';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
