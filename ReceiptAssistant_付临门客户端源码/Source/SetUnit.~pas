unit SetUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, IniFiles;

type
  TSetForm = class(TForm)
    lbl1: TLabel;
    edtFilePath: TEdit;
    btnSelect: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSelectClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SaveConfig(const Value: string);
    procedure LoadConfig;
  public
    { Public declarations }
  end;

var
  SetForm: TSetForm;

implementation

{$R *.dfm}

procedure TSetForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = ord(VK_ESCAPE) then
        ModalResult := mrCancel;
end;

procedure TSetForm.btnSelectClick(Sender: TObject);
var
  S: string;
begin
  S := '';
  if SelectDirectory('Select Directory', '', S) then
      edtFilePath.Text := S;
end;


procedure TSetForm.LoadConfig;
var
    IniFile: TIniFile;
    SavePath: string;
begin
    IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
    try
        SavePath := IniFile.ReadString('set','savepath', ExtractFilePath(Application.ExeName));
        edtFilePath.Text := SavePath;
    finally
        IniFile.Free;
    end;
end;

procedure TSetForm.SaveConfig(const Value: string);
var
    IniFile: TIniFile;
    SavePath: string;
begin
    IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
    try
        IniFile.writeString('set','savepath', Value);
    finally
        IniFile.Free;
    end;
end;

procedure TSetForm.btnOKClick(Sender: TObject);
begin
    if DirectoryExists(edtFilePath.Text) then
    begin
        SaveConfig(edtFilePath.Text);
        ModalResult := mrOk;
    end
    else
    begin
        Application.MessageBox('您设置目录不存，请确认！', '提示', MB_OK + MB_ICONINFORMATION);
    end;
end;

procedure TSetForm.FormShow(Sender: TObject);
begin
    LoadConfig;
end;

end.
