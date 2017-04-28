unit RegUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,nb30;

type
  TRegForm = class(TForm)
    grp1: TGroupBox;
    mmo1: TMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtMachineCode: TEdit;
    edtFileCode: TEdit;
    edtPassword: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    function Decrypt(const s: string; key: word): string;
  public
    { Public declarations }

  end;
  function GetCPUSerialNumber:String;
  //function GetCPUSerialNumber:pchar;stdcall;external 'ComputerId.dll' name 'GetCPUSerialNumber';
var
  RegForm: TRegForm;

implementation

{$R *.dfm}
type
  TCPUID = array[1..4] of Longint;

//CPU系列号:
FUNCTION GetCPUID : TCPUID; assembler; register;
asm
  PUSH    EBX         {Save affected register}
  PUSH    EDI
  MOV     EDI,EAX     {@Resukt}
  MOV     EAX,1
  DW      $A20F       {CPUID Command}
  STOSD      {CPUID[1]}
  MOV     EAX,EBX
  STOSD               {CPUID[2]}
  MOV     EAX,ECX
  STOSD               {CPUID[3]}
  MOV     EAX,EDX
  STOSD               {CPUID[4]}
  POP     EDI      {Restore registers}
  POP     EBX
END;

function GetCPUSerialNumber:String;
var
  CPUID:TCPUID;
begin
  CPUID:=GetCPUID;
  Result:=IntToHex(CPUID[1],8)+'-' + IntToHex(CPUID[2],8)+ '-' + IntToHex(CPUID[3],8)+ '-' + IntToHex(CPUID[4],8);
end;

procedure TRegForm.btnOKClick(Sender: TObject);
begin
    if edtPassword.Text = Decrypt(edtMachineCode.Text, 100) then
        ModalResult := mrOk
    else
        MessageBox(Handle, pchar('对不起，开启密码不正确，请把机器标识发给联系客服，以获得注册码'), pchar('系统提示'), mb_ok or mb_iconwarning);
end;

function TRegForm.Decrypt(const s: string; key: word): string;
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

end.
