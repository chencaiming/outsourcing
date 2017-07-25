unit GetCPUSerialNumberUnit;

interface

uses
    Windows, SysUtils;

type
    TCPUIDResult = packed record
        EAX: Cardinal;
        EBX: Cardinal;
        ECX: Cardinal;
        EDX: Cardinal;
    end;

    TCPUType = (ctPrimary, ctOverDrive, ctSecondary, ctUnknown);

function GetCPUSerialNumber: string;

const
    CPUID_CPUSIGNATURE: DWORD = $1;

var
    CPUID_Level: DWORD;

implementation


function ExecuteCPUID: TCPUIDResult; assembler;
asm
        PUSH    EBX
        PUSH    EDI
        MOV     EDI, EAX
        MOV     EAX, CPUID_LEVEL
        DW      $A20F
        STOSD
        MOV     EAX, EBX
        STOSD
        MOV     EAX, ECX
        STOSD
        MOV     EAX, EDX
        STOSD
        POP     EDI
        POP     EBX
end;

function GetCPUSerialNumber: string;

    function SplitToNibble(ANumber: string): string;
    var
        rs, cs: string;
        b: boolean;
    begin
        rs := Copy(ANumber, 0, 4) + '-' + Copy(ANumber, 5, 4);
        {
        b := False;
        try
            b := Form1.FindComponent('Button33333') <> nil;
        except
        end;}
        Result := rs;
    end;

var
    SerialNumber: TCPUIDResult;
begin
    Result := '';
    CPUID_Level := CPUID_CPUSIGNATURE;
    SerialNumber := ExecuteCPUID;
    Result := SplitToNibble(IntToHex(SerialNumber.EAX, 8)) + '-';
    CPUID_Level := CPUID_CPUSIGNATURE;
    SerialNumber := ExecuteCPUID;
    Result := Result + SplitToNibble(IntToHex(SerialNumber.EDX, 8)) + '-';
    Result := Result + SplitToNibble(IntToHex(SerialNumber.ECX, 8));
end;

end.

