unit MainUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Spin, ComCtrls, SmartListView, ExtCtrls, Menus,
    bsSkinCtrls, Clipbrd, IdHTTP, IdSSLOpenSSL,
    GenDomainUnit,
    IdComponent, IdTCPConnection, IdTCPClient
    ;

const
    WM_ADDDOMAIN = WM_USER + 100;
    WM_GEN_FINISH = WM_USER + 101;

type
    TMainForm = class(TForm)

    private
    { Private declarations }

    public
    { Public declarations }
    end;

var
    MainForm: TMainForm;

implementation

{$R *.dfm}



end.

