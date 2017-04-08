unit SetUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSetForm = class(TForm)
    lbl1: TLabel;
    edtFilePath: TEdit;
    btnSelect: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
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

end.
