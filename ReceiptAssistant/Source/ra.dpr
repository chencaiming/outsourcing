program ra;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '�������յ�����';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
