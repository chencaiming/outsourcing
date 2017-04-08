unit MainUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Spin, ComCtrls, SmartListView, ExtCtrls, Menus,
    bsSkinCtrls, Clipbrd, IdHTTP, IdSSLOpenSSL, IdComponent, IdTCPConnection,
    IdTCPClient, SetUnit;

const
    WM_ADDDOMAIN = WM_USER + 100;
    WM_GEN_FINISH = WM_USER + 101;

type
    TMainForm = class(TForm)
    mmMain: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    grpRegInfo: TGroupBox;
    grpContractNo: TGroupBox;
    grpLicense: TGroupBox;
    grpPhoto: TGroupBox;
    btnImport: TButton;
    btnLog: TButton;
    btnSave: TButton;
    dlgOpen1: TOpenDialog;
    procedure N1Click(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    private
    { Private declarations }

    public
    { Public declarations }
    end;

var
    MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.N1Click(Sender: TObject);
var
    SetForm: TSetForm;
begin
    SetForm := TSetForm.Create(nil);
    try
        SetForm.ShowModal;
    finally
        SetForm.Free;
    end;
end;

procedure TMainForm.btnImportClick(Sender: TObject);
begin
    if dlgOpen1.Execute then
    begin

    end;
end;

end.

