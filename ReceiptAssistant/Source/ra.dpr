program ra;

uses
  Forms,
  Registry,
  windows,
  MainUnit in 'MainUnit.pas' {MainForm},
  SetUnit in 'SetUnit.pas' {SetForm},
  YQAPI in '..\..\..\..\..\myproject\base\YQAPI.pas',
  RegExpr in '..\..\..\..\..\myproject\base\RegExpr.pas',
  RegUnit in 'RegUnit.pas' {RegForm},
  GetCPUSerialNumberUnit in 'GetCPUSerialNumberUnit.pas';

{$R *.res}

function Decrypt(const s: string; key: word): string;
var
    i: byte;
    R: string;
const
    C1 = 50;
    C2 = 50;
begin
    SetLength(R, Length(s));
    for i := 1 to Length(s) do
    begin
        R[i] := char(byte(s[i]) xor (key shr 8));
        key := (byte(s[i]) + key) + C1 + C2
    end;
    Result := R;
end;

var
    ARegistry: TRegistry;
    RegisterCode: string;
    HasReg: boolean;
    CPUSerialNumber: string;

begin
    Application.Initialize;
    Application.Title := '�������յ�����';

    //�ж��Ƿ�ע��
    ARegistry := TRegistry.Create;
    with ARegistry do
    begin
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey('Software\ReceiptAssistant', false) then
            RegisterCode := ReadString('RegisterCode');
        ARegistry.Free;
    end;
    //���ݻ�����ʶ���ע���룬���ѱ����ע����Ƚϣ����Ƿ���ע��
    CPUSerialNumber := GetCPUSerialNumber;
    HasReg := RegisterCode = Decrypt(CPUSerialNumber, 100);
    if not HasReg then
    begin
        RegForm := TRegForm.Create(Application);
        try
            RegForm.edtMachineCode.Text := CPUSerialNumber;
            RegForm.edtFileCode.Text := '�������';
            RegForm.ShowModal;
            if RegForm.ModalResult = 1 then
            begin
                ARegistry := TRegistry.Create;
                with ARegistry do
                begin
                    RootKey := HKEY_LOCAL_MACHINE;
                    if OpenKey('Software\ReceiptAssistant', True) then
                        WriteString('RegisterCode', RegForm.edtPassword.text);
                    Free;
                end;
                HasReg := True;
                Application.CreateForm(TMainForm, MainForm);
  Application.Run;
            end;
        finally
            RegForm.Free;
        end;
    end
    else
    begin
        Application.CreateForm(TMainForm, MainForm);
        Application.Run;
    end;
end.

