
unit MainUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Spin, ComCtrls, SmartListView, ExtCtrls, Menus,
    bsSkinCtrls, Clipbrd, IdHTTP, IdSSLOpenSSL, IdComponent, IdTCPConnection,
    IdTCPClient, SetUnit, jpeg, YQAPI, ExtDlgs,IniFiles,MSHtml,SHDocVw;

type
    TBizInfo = record
        Name: string;         //姓名
        IDNo: string;         //身份证号
        BankAccount: string;  //银行账号
        BankName: string;     //开户行
        LianHangHao: string;   //联行号
        PhoneNumber: string;   //联系方式
        Rate: string;          //费率
        BizName: string;       //商户名
        LicenseNo: string;     //营业执照
        LicenseKind: string;   //执照类型
        ManageAddress: string;  //经营地址
        Manager: string;        //经营者
        LawmanID: string;       //法人身份证
        RegisterDate: string; //注册日期
        ManageScope: string;  //经营范围
        CheckDate: string;    //核准日期
        Registration: string;  //登记机关
        MCC:string;                //MCC
        Provice: string;       //省份
        City: string;          //城市
        Town: string;          //区县
        PostCode: string;      //邮编
        Email: string;         //电子邮件
        PayPlatform: string;   //支付平台
        ProxyAgent: string;    //代理商
        MachineMode: string;   //机型
        Remark: string;        //备注
    end;
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
    lbl1: TLabel;
    stat1: TStatusBar;
    edtBN: TEdit;
    lbl2: TLabel;
    edtBSN: TEdit;
    chkInc: TCheckBox;
    edtInc: TEdit;
    lbl3: TLabel;
    edtCreditNo: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    cbbCategory: TComboBox;
    lbl9: TLabel;
    dtpRegDate: TDateTimePicker;
    lbl10: TLabel;
    edtRegCapital: TEdit;
    lbl11: TLabel;
    cbbRegAgent: TComboBox;
    lbl12: TLabel;
    dtpCheckDate: TDateTimePicker;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    lbl13: TLabel;
    edtRegAddr: TEdit;
    lbl14: TLabel;
    edtInstallAddr: TEdit;
    lbl15: TLabel;
    edtLawman: TEdit;
    lbl16: TLabel;
    edtIdNo: TEdit;
    lbl17: TLabel;
    lbl18: TLabel;
    edtTrueManage: TEdit;
    lbl19: TLabel;
    edtManageTime: TEdit;
    lbl20: TLabel;
    edtSettleName: TEdit;
    lbl21: TLabel;
    edtPhone: TEdit;
    lbl22: TLabel;
    edtOpenBank: TEdit;
    lbl23: TLabel;
    edtIdNo1: TEdit;
    lbl24: TLabel;
    edtSettleAccount: TEdit;
    lbl25: TLabel;
    cbbInstallPlace: TComboBox;
    lbl26: TLabel;
    cbbTerminalStyle: TComboBox;
    lbl27: TLabel;
    edtPostCode: TEdit;
    lbl28: TLabel;
    edtDeveloper: TEdit;
    lbl29: TLabel;
    edtTerminalAmount: TEdit;
    lbl30: TLabel;
    edtBindPhone: TEdit;
    lblProgramFee: TLabel;
    edtProgramFee: TEdit;
    lbl31: TLabel;
    edtLender: TEdit;
    lbl32: TLabel;
    edtLendArea: TEdit;
    lbl33: TLabel;
    edtLendFee: TEdit;
    lbl34: TLabel;
    dtpLendDate: TDateTimePicker;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    edtTool: TEdit;
    cbbManageScope: TComboBox;
    dtpFillDate: TDateTimePicker;
    cbbMachineMode: TComboBox;
    imgIDPos: TImage;
    imgIDNag: TImage;
    imgBankPos: TImage;
    imgBankNag: TImage;
    dlgOpenPic1: TOpenPictureDialog;
    procedure N1Click(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure imgIDPosClick(Sender: TObject);
    procedure imgIDNagClick(Sender: TObject);
    procedure imgBankPosClick(Sender: TObject);
    procedure imgBankNagClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtLendAreaKeyPress(Sender: TObject; var Key: Char);
    procedure edtLendFeeKeyPress(Sender: TObject; var Key: Char);
    procedure edtProgramFeeKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveClick(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
    private
    { Private declarations }
        FBusinessInfo: TBizInfo;
        FSrcPic1: string;
        FSrcPic2: string;
        FSrcPic3: string;
        FSrcPic4: string;
        procedure LoadBusinessInfo(FileName: string);
        procedure FillForm;
        procedure ResetForm;

        procedure DrawText_(ACanvas: TCanvas;FN_:TFontName;Angle, x, y,H_,W_,WT: Integer; AStr: String);
        procedure MergePictures(SrcPic1,SrcPic2,DestPic: string);
        procedure FilloutYYZZ(DestPic: string); //营业执照
        procedure FilloutSHXY(DestPic: string); //商户协议
        procedure FilloutSQJSS(DestPic: string); //授权结算书
        procedure FilloutZLHT(DestPic: string);   //租赁合同
        procedure MyTextOut(Canvas: TCanvas;X,Y: Integer; const Text: wideString;FontName: string; FontSize: Integer);
    public
    { Public declarations }
    end;

var
    MainForm: TMainForm;

implementation

{$R *.dfm}

function MoneyConvert(mmje: real): string;
const
    s1: string = '零壹贰叁肆伍陆柒捌玖';
    s2: string = '分角元拾佰仟万拾佰仟亿拾佰仟万';

    function StrTran(const S, s1, s2: string): string;
    begin
        Result := StringReplace(S, s1, s2, [rfReplaceAll]);
    end;

var
    S, dx: string;
    i, Len: Integer;
begin
    if mmje < 0 then
    begin
        dx := '负';
        mmje := -mmje;
    end;
    S := Format('%.0f', [mmje * 100]);
    Len := Length(S);
    for i := 1 to Len do
        dx := dx + Copy(s1, (Ord(S[i]) - Ord('0')) * 2 + 1, 2) + Copy(s2, (Len - i) * 2 + 1, 2);
    dx := StrTran(StrTran(StrTran(StrTran(StrTran(dx, '零仟', '零'), '零佰', '零'), '零拾', '零'), '零角', '零'), '零分', '整');
    dx := StrTran(StrTran(StrTran(StrTran(StrTran(dx, '零零', '零'), '零零', '零'), '零亿', '亿'), '零万', '万'), '零元', '元');
    if dx = '整' then
        Result := '零元整'
    else
        Result := StrTran(StrTran(dx, '亿万', '亿零'), '零整', '整');
end;

procedure DrawStar(const Ox, Oy, r, Width, Style: Integer; const Color: TColor; Canvas: TCanvas);
const
    _18Degree = 0.1 * Pi;
    _54Degree = 0.3 * Pi;
var
    d: Double;
    Vertices: array[0..9] of TPoint;
    OldPenClr, OldBrshClr: TColor;
    OldPenWth: Integer;
begin
    d := r * Sin(_18Degree) / Sin(_54Degree);
    Vertices[0].X := Round(Ox - r * Cos(_18Degree));
    Vertices[0].Y := Round(Oy - r * Sin(_18Degree));
    Vertices[1].X := Round(Ox - d * Cos(_54Degree));
    Vertices[1].Y := Vertices[0].Y;
    Vertices[2].X := Ox;
    Vertices[2].Y := Oy - r;
    Vertices[3].X := 2 * Ox - Vertices[1].X;
    Vertices[3].Y := Vertices[1].Y;
    Vertices[4].X := 2 * Ox - Vertices[0].X;
    Vertices[4].Y := Vertices[0].Y;
    Vertices[5].X := Round(Ox + d * Cos(_18Degree));
    Vertices[5].Y := Round(Oy + d * Sin(_18Degree));
    Vertices[6].X := Round(Ox + r * Cos(_54Degree));
    Vertices[6].Y := Round(Oy + r * Sin(_54Degree));
    Vertices[7].X := Ox;
    Vertices[7].Y := Round(Oy + d);
    Vertices[8].X := 2 * Ox - Vertices[6].X;
    Vertices[8].Y := Vertices[6].Y;
    Vertices[9].X := 2 * Ox - Vertices[5].X;
    Vertices[9].Y := Vertices[5].Y;
    with Canvas do
    begin
        OldPenClr := Pen.Color;
        OldPenWth := Pen.Width;
        OldBrshClr := Brush.Color;
        Pen.Color := Color;
        Pen.Mode := pmMask;
        Pen.Width := Width;
        Brush.Color := Color;
        if Style = 0 then
            Brush.Style := bsClear;
        Polygon(Vertices);
        Pen.Color := OldPenClr;
        Pen.Width := OldPenWth;
        Brush.Color := OldBrshClr;
    end;
end;

Function ToChineseChar(Str_:WideString):WideString;
Var
    SC_:WideString;
    i:integer;
begin
    Result:='';
    SC_:=Str_;
    For i:=1 to Length(SC_) do
    begin
        If Ord(SC_[I])<=128 then
            Result:=Result+WideChar(65248 + Ord(SC_[I]))
        Else
            Result:=Result+SC_[I];
    End;
END;

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
        LoadBusinessInfo(dlgOpen1.FileName);
        ResetForm;
        FillForm;
    end;
end;



procedure TMainForm.ResetForm;
var
    i: Integer;
begin
    for i := 0 to ComponentCount - 1 do
    begin
        if Components[i] is TEdit then
            TEdit(Components[i]).Clear
        else if Components[i] is TComboBox then
            TComboBox(Components[i]).Text := ''
        else if Components[i] is TDateTimePicker then
        begin
            TDateTimePicker(Components[i]).DateTime := Now();
        end;
    end;

    edtLendArea.Text := '234';
    edtLendFee.Text := '21600';
end;

procedure TMainForm.FillForm;
begin
    edtBN.Text := FBusinessInfo.BizName;
    edtBSN.Text := FBusinessInfo.BizName;
    edtRegAddr.Text := FBusinessInfo.ManageAddress;
    edtInstallAddr.Text := FBusinessInfo.ManageAddress;
    edtSettleAccount.Text := FBusinessInfo.BankAccount;
    edtOpenBank.Text := FBusinessInfo.BankName;
    edtIdNo.Text := FBusinessInfo.LawmanID;
    edtLawman.Text := FBusinessInfo.Manager;
    edtIdNo1.Text := FBusinessInfo.IDNo;
    edtSettleName.Text := FBusinessInfo.Name;
    cbbManageScope.Text := FBusinessInfo.ManageScope;
    edtPhone.Text := FBusinessInfo.PhoneNumber;
    edtProgramFee.Text := FBusinessInfo.Rate;
    edtCreditNo.Text := FBusinessInfo.LicenseNo;
    cbbCategory.Text := FBusinessInfo.LicenseKind;
    cbbRegAgent.text := FBusinessInfo.Registration;
end;

procedure TMainForm.LoadBusinessInfo(FileName: string);
var
    BizInfoList: TStringList;
    i: Integer;
    FieldName,FieldVal: string;
begin
    BizInfoList := TStringList.Create;
    try
        BizInfoList.LoadFromFile(FileName);
        if Trim(BizInfoList.Text) <> '' then
        begin
            for i := 0 to BizInfoList.Count - 1 do
            begin
                FieldName := FieldValue('：', BizInfoList[i], 0);
                FieldVal := FieldValue('：', BizInfoList[i], 1);
                if FieldName = '商户名' then
                begin
                    FBusinessInfo.BizName := FieldVal;
                end
                else if FieldName = '经营地址' then
                begin
                    FBusinessInfo.ManageAddress := FieldVal;
                end
                else if FieldName = '身份证号' then
                begin
                    FBusinessInfo.IDNo := FieldVal;
                end
                else if FieldName = '银行账号' then
                begin
                    FBusinessInfo.BankAccount := FieldVal;
                end
                else if FieldName = '开户行' then
                begin
                    FBusinessInfo.BankName := FieldVal;
                end
                else if FieldName = '法人身份证' then
                begin
                    FBusinessInfo.LawmanID := FieldVal;
                end
                else if FieldName = '经营者' then
                begin
                    FBusinessInfo.manager := FieldVal;
                end
                else if FieldName = '经营范围' then
                begin
                    FBusinessInfo.ManageScope := FieldVal;
                end
                else if FieldName = '联系方式' then
                begin
                    FBusinessInfo.PhoneNumber := FieldVal;
                end
                else if FieldName = '费率' then
                begin
                    FBusinessInfo.Rate := FieldVal;
                end
                else if FieldName = '姓名' then
                begin
                    FBusinessInfo.Name := FieldVal;
                end
                else if FieldName = '联行号' then
                begin
                    FBusinessInfo.LianHangHao := FieldVal;
                end
                else if FieldName = '营业执照' then
                begin
                    FBusinessInfo.LicenseNo := FieldVal;
                end
                else if FieldName = '执照类型' then
                begin
                    FBusinessInfo.LicenseKind := FieldVal;
                end
                else if FieldName = '注册日期' then
                begin
                    FBusinessInfo.RegisterDate := FieldVal;
                end
                else if FieldName = '核准日期' then
                begin
                    FBusinessInfo.CheckDate := FieldVal;
                end
                else if FieldName = '登记机关' then
                begin
                    FBusinessInfo.Registration := FieldVal;
                end
                else if FieldName = 'MCC' then
                begin
                    FBusinessInfo.MCC := FieldVal;
                end
                else if FieldName = '省份' then
                begin
                    FBusinessInfo.Provice := FieldVal;
                end
                else if FieldName = '城市' then
                begin
                    FBusinessInfo.City := FieldVal;
                end
                else if FieldName = '区县' then
                begin
                    FBusinessInfo.Town := FieldVal;
                end
                else if FieldName = '邮编' then
                begin
                    FBusinessInfo.PostCode := FieldVal;
                end
                else if FieldName = '电子邮件' then
                begin
                    FBusinessInfo.Email := FieldVal;
                end
                else if FieldName = '支付平台' then
                begin
                    FBusinessInfo.PayPlatform := FieldVal;
                end
                else if FieldName = '代理商' then
                begin
                    FBusinessInfo.ProxyAgent := FieldVal;
                end
                else if FieldName = '机型' then
                begin
                    FBusinessInfo.MachineMode := FieldVal;
                end
                else if FieldName = '备注' then
                begin
                    FBusinessInfo.Remark := FieldVal;
                end;
            end;
        end;
    finally
        BizInfoList.Free;
    end;
end;

procedure TMainForm.imgIDPosClick(Sender: TObject);
var
    jpg: TJPEGImage; // 要use Jpeg单元
begin
    if dlgOpenPic1.Execute then
    begin
        // 显示jpg大图片的方式
        jpg := TJPEGImage.Create;
        try
            jpg.LoadFromFile(dlgOpenPic1.FileName);
            imgIDPos.Picture.Bitmap.Assign(jpg); // 因为 img 控件是基于bmp的
            FSrcPic1 := dlgOpenPic1.FileName;
        finally
            jpg.Free;
        end;
    end;
end;

procedure TMainForm.imgIDNagClick(Sender: TObject);
var
    jpg: TJPEGImage; // 要use Jpeg单元
begin
    if dlgOpenPic1.Execute then
    begin
        // 显示jpg大图片的方式
        jpg := TJPEGImage.Create;
        try
            jpg.LoadFromFile(dlgOpenPic1.FileName);
            imgIDNag.Picture.Bitmap.Assign(jpg); // 因为 img 控件是基于bmp的
            FSrcPic2 := dlgOpenPic1.FileName;
        finally
            jpg.Free;
        end;
    end;
end;

procedure TMainForm.imgBankPosClick(Sender: TObject);
var
    jpg: TJPEGImage; // 要use Jpeg单元
begin
    if dlgOpenPic1.Execute then
    begin
        // 显示jpg大图片的方式
        jpg := TJPEGImage.Create;
        try
            jpg.LoadFromFile(dlgOpenPic1.FileName);
            imgBankpos.Picture.Bitmap.Assign(jpg); // 因为 img 控件是基于bmp的
            FSrcPic3 := dlgOpenPic1.FileName;
        finally
            jpg.Free;
        end;
    end;
end;

procedure TMainForm.imgBankNagClick(Sender: TObject);
var
    jpg: TJPEGImage; // 要use Jpeg单元
begin
    if dlgOpenPic1.Execute then
    begin
        // 显示jpg大图片的方式
        jpg := TJPEGImage.Create;
        try
            jpg.LoadFromFile(dlgOpenPic1.FileName);
            imgBankNag.Picture.Bitmap.Assign(jpg); // 因为 img 控件是基于bmp的
            FsrcPic4 := dlgOpenPic1.FileName;
        finally
            jpg.Free;
        end;
    end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
    ResetForm;
end;

procedure TMainForm.edtLendAreaKeyPress(Sender: TObject; var Key: Char);
begin
    if not(key in['0'..'9',#8])then
    begin
        key:=#0;
        MessageBeep(1);
    end;
end;

procedure TMainForm.edtLendFeeKeyPress(Sender: TObject; var Key: Char);
begin
    if not(key in['0'..'9',#8])then
    begin
        key:=#0;
        MessageBeep(1);
    end;
end;

procedure TMainForm.edtProgramFeeKeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9', '.', #8]) then
    begin
        key := #0;
        MessageBeep(1);
    end;
    if (key = '.') and (Pos('.', Trim(edtProgramFee.Text)) > 0) then
    begin
        key := #0;
        MessageBeep(1);
    end;
end;

procedure TMainForm.MergePictures(SrcPic1, SrcPic2, DestPic: string);
var
    jp1, jp2, jp: TJPEGImage;
    bmp_t, bmp: TBitmap;
begin
    jp1 := TJPEGImage.Create;
    jp2 := TJPEGImage.Create;
    jp := TJPEGImage.Create;
    try
        jp1.LoadFromFile(SrcPic1);
        jp2.LoadFromFile(SrcPic2);
        bmp := TBitmap.Create;
        bmp_t := TBitmap.Create;
        try
            bmp.Width := jp1.Width;
            bmp.Height := jp1.Height + jp2.Height;

            bmp_t.Assign(jp1);
            bmp.Canvas.Draw(0, 0, bmp_t);
            bmp_t.Assign(jp2);
            bmp.Canvas.Draw(0, jp1.Height, jp2);

            jp.Assign(bmp);
            jp.SaveToFile(DestPic);
        finally
            bmp.Free;
            bmp_t.Free;
        end;
    finally
        jp1.Free;
        jp2.Free;
        jp.Free;
    end;
end;

procedure TMainForm.btnSaveClick(Sender: TObject);
var
    IniFile: TIniFile;
    SavePath: string;
begin
    IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
    try
        SavePath := IniFile.ReadString('set','savepath', ExtractFilePath(Application.ExeName));
        SavePath := SavePath + '\' + Trim(edtSettleName.Text)+ '-' + Trim(edtBSN.Text);
        if not DirectoryExists(SavePath) then
        begin
            ForceDirectories(SavePath);
        end;
    finally
        IniFile.Free;
    end;
    if (FSrcPic1 <> '') and (FSrcPic2 <> '') then
    begin
        MergePictures(FSrcPic1,FSrcPic2, SavePath + '\法人身份证_副本.jpg');
    end;
    if (FSrcPic3 <> '') and (FSrcPic4 <> '') then
    begin
        MergePictures(FSrcPic3,FSrcPic4, SavePath + '\银行卡_副本.jpg');
    end;
    FilloutYYZZ(SavePath);
    FilloutZLHT(SavePath);
    FilloutSHXY(SavePath);
    FilloutSQJSS(SavePath);

    Application.MessageBox('保存成功！', '提示', MB_OK + MB_ICONINFORMATION);
end;

procedure TMainForm.FilloutSHXY(DestPic: string);
var
    jp1, jp: TJPEGImage;
    bmp_t, bmp: TBitmap;
    Perx,TmpAngle,Angle:double;
    WStr_: WideString;
    n,i: Integer;
    YX: TPoint;
    SPE_F_W, SPE_F_H,SPE_F_R: double;
    x,y,F1_L,F1_T,SPE_F_B,SPE_JD: Integer;
begin
    jp1 := TJPEGImage.Create;
    jp := TJPEGImage.Create;
    try
        jp1.LoadFromFile(ExtractFilePath(Application.ExeName) + '商户协议.jpg');
        bmp := TBitmap.Create;
        bmp_t := TBitmap.Create;
        try
            bmp.Width := jp1.Width;
            bmp.Height := jp1.Height;

            bmp_t.Assign(jp1);
            bmp.Canvas.Draw(0, 0, bmp_t);
            bmp.Canvas.Font.name := '宋体';
            bmp.Canvas.Font.Size := 14;
            bmp.Canvas.Font.style := [];
            bmp.Canvas.Brush.Style:=bsClear;
            bmp.Canvas.TextOut(101,185,edtBN.Text);
            bmp.Canvas.TextOut(660,1510,edtBN.Text);
            bmp.Canvas.TextOut(660,1545,edtlawMan.Text);
            //bmp.Canvas.Font.style := [fsbold];
            bmp.Canvas.Font.name := 'Arial';
            bmp.Canvas.TextOut(660,1570,FormatDateTime('YYYY.mm.dd',now));
            bmp.Canvas.TextOut(1360,165,FormatDateTime('YYYY',now));
            bmp.Canvas.TextOut(1475,165,FormatDateTime('mm',now));
            bmp.Canvas.TextOut(1570,165,FormatDateTime('dd',now));

            bmp.Canvas.Font.name := '宋体';
            bmp.Canvas.Font.Size := 14;
            bmp.Canvas.TextOut(1495,280,edtBN.Text);
            bmp.Canvas.TextOut(1910,280,edtBsN.Text);
            MyTextOut(bmp.Canvas,1900,325,edtregaddr.Text,'宋体',14);
            //bmp.Canvas.TextOut(1900,325,edtregaddr.Text);
            bmp.Canvas.TextOut(1495,368,edtlawman.Text);
            bmp.Canvas.TextOut(1495,418,cbbManageScope.Text);
            bmp.Canvas.TextOut(1500,490,edtSettleName.Text);
            bmp.Canvas.TextOut(1478,634,edtOpenBank.Text);
            bmp.Canvas.TextOut(1478,674,edtSettleName.Text);
            MyTextOut(bmp.Canvas,1500,890,edtInstallAddr.Text,'宋体',14);
            //bmp.Canvas.TextOut(1500,890,edtInstallAddr.Text);
            
            bmp.Canvas.Font.name := 'Arial';
            bmp.Canvas.TextOut(1495,328,edtCreditNo.Text);
            bmp.Canvas.TextOut(1900,368,edtIdNo.Text);
            bmp.Canvas.TextOut(1899,465,edtPhone.Text);
            bmp.Canvas.TextOut(1478,704,edtSettleAccount.Text);
            bmp.Canvas.TextOut(465,620,edtProgramFee.Text);

            //盖公章
           // DrawSeal(bmp.Canvas,746,1153, 50, edtBN.Text);

            Perx:=25.4/PixelsPerInch;
            YX:=Point(768,1510);
            //YX:=Point(765,1100);
            x:=0;
            y:=0;
            F1_L:=10;
            F1_T:=10;
            SPE_F_W:= 0.6; //字宽
            SPE_F_H:= 1.2; //字高
            SPE_F_R:=2.7;  //半径
            SPE_F_B:=25;   //加粗
            SPE_JD:=360;   //角度
            TmpAngle:=0;
            WStr_:=ToChineseChar(Trim(edtBN.Text));                                    //绘制文本1
            n := Length(WStr_); //汉字个数
            if n = 1 then
            begin
                x := Round(F1_L / Perx * 10) + YX.X - Round(SPE_F_W / Perx * 10);
                Y := Round(F1_T / Perx * 10) + YX.Y - Round(SPE_F_R / Perx * 10);
                DrawText_(bmp.Canvas, '宋体', 0, x, y, Round(SPE_F_H / Perx * 10), Round(SPE_F_W / Perx * 10), SPE_F_B, WStr_);
            end
            else if n > 1 then
            begin
                //TmpAngle := SPE_JD / (n - 1);
                TmpAngle := 39;                                         //平均夹角=环排角度/字数
                for i := 0 to n - 1 do
                begin
                    Angle := 142 + (SPE_JD / 2) + SPE_F_W * 10 / 2 -4- TmpAngle * i;
                    x := YX.X + Round(cos(Pi * Angle / 180) * SPE_F_R / Perx * 10);
                    y := YX.Y - Round(sin(Pi * Angle / 180) * SPE_F_R / Perx * 10);
                    DrawText_(bmp.Canvas, '宋体', round(464 - Angle) mod 360, x, y, Round(SPE_F_H / Perx * 10), Round(SPE_F_W / Perx * 10), SPE_F_B, WStr_[i + 1]);
                end;

            end;

            jp.Assign(bmp);
            jp.SaveToFile(DestPic + '\商户协议_副本.jpg');
        finally
            bmp.Free;
            bmp_t.Free;
        end;
    finally
        jp1.Free;
        jp.Free;
    end;
end;

procedure TMainForm.FilloutSQJSS(DestPic: string);
var
    jp1, jp: TJPEGImage;
    bmp_t, bmp: TBitmap;
    Perx,TmpAngle,Angle:double;
    WStr_: WideString;
    n,i: Integer;
    YX: TPoint;
    SPE_F_W, SPE_F_H,SPE_F_R: double;
    x,y,F1_L,F1_T,SPE_F_B,SPE_JD: Integer;
begin
    jp1 := TJPEGImage.Create;
    jp := TJPEGImage.Create;
    try
        jp1.LoadFromFile(ExtractFilePath(Application.ExeName) + '授权结算书.jpg');
        bmp := TBitmap.Create;
        bmp_t := TBitmap.Create;
        try
            bmp.Width := jp1.Width;
            bmp.Height := jp1.Height;

            bmp_t.Assign(jp1);
            bmp.Canvas.Draw(0, 0, bmp_t);
            bmp.Canvas.Font.name := '宋体';
            bmp.Canvas.Font.Size := 20;
           // bmp.Canvas.Font.style := [fsBold];
            bmp.Canvas.Brush.Style:=bsClear;
            bmp.Canvas.TextOut(268,206,edtBN.Text);
            bmp.Canvas.TextOut(800,206,edtlawMan.Text);
            bmp.Canvas.TextOut(876,277,edtSettleName.Text);
            bmp.Canvas.TextOut(830,883,edtlawMan.Text);
            
            bmp.Canvas.Font.Name := 'Arial';
            bmp.Canvas.TextOut(170,277,edtIDNo.Text);
            bmp.Canvas.TextOut(205,345,edtIDNO1.Text);
            bmp.Canvas.TextOut(270,482,edtIDNO1.Text);
            bmp.Canvas.TextOut(626,490,edtSettleAccount.Text);
            bmp.Canvas.TextOut(830,950,FormatDateTime('YYYY.mm.dd',now));

            Perx:=25.4/PixelsPerInch;
            YX:=Point(922,1050);
            //YX:=Point(765,1100);
            x:=0;
            y:=0;
            F1_L:=10;
            F1_T:=10;
            SPE_F_W:= 0.6; //字宽
            SPE_F_H:= 1.2; //字高
            SPE_F_R:=2.7;  //半径
            SPE_F_B:=25;   //加粗
            SPE_JD:=360;   //角度
            TmpAngle:=0;
            WStr_:=ToChineseChar(Trim(edtBN.Text));                                    //绘制文本1
            n := Length(WStr_); //汉字个数
            if n = 1 then
            begin
                x := Round(F1_L / Perx * 10) + YX.X - Round(SPE_F_W / Perx * 10);
                Y := Round(F1_T / Perx * 10) + YX.Y - Round(SPE_F_R / Perx * 10);
                DrawText_(bmp.Canvas, '宋体', 0, x, y, Round(SPE_F_H / Perx * 10), Round(SPE_F_W / Perx * 10), SPE_F_B, WStr_);
            end
            else if n > 1 then
            begin
                //TmpAngle := SPE_JD / (n - 1);
                TmpAngle := 39;                                         //平均夹角=环排角度/字数
                for i := 0 to n - 1 do
                begin
                    Angle := 142 + (SPE_JD / 2) + SPE_F_W * 10 / 2 -4- TmpAngle * i;
                    x := YX.X + Round(cos(Pi * Angle / 180) * SPE_F_R / Perx * 10);
                    y := YX.Y - Round(sin(Pi * Angle / 180) * SPE_F_R / Perx * 10);
                    DrawText_(bmp.Canvas, '宋体', round(464 - Angle) mod 360, x, y, Round(SPE_F_H / Perx * 10), Round(SPE_F_W / Perx * 10), SPE_F_B, WStr_[i + 1]);
                end;

            end;

            jp.Assign(bmp);
            jp.SaveToFile(DestPic + '\授权结算书_副本.jpg');
        finally
            bmp.Free;
            bmp_t.Free;
        end;
    finally
        jp1.Free;
        jp.Free;
    end;
end;

procedure TMainForm.FilloutYYZZ(DestPic: string);
var
    jp1, jp: TJPEGImage;
    bmp_t, bmp: TBitmap;
    Perx,TmpAngle,Angle:double;
    WStr_: WideString;
    n,i: Integer;
    YX: TPoint;
    SPE_F_W, SPE_F_H,SPE_F_R: double;
    x,y,F1_L,F1_T,SPE_F_B,SPE_JD: Integer;
begin
    jp1 := TJPEGImage.Create;
    jp := TJPEGImage.Create;
    try
        jp1.LoadFromFile(ExtractFilePath(Application.ExeName) + '营业执照.jpg');
        bmp := TBitmap.Create;
        bmp_t := TBitmap.Create;
        try
            bmp.Width := jp1.Width;
            bmp.Height := jp1.Height;

            bmp_t.Assign(jp1);
            bmp.Canvas.Draw(0, 0, bmp_t);
            bmp.Canvas.Font.name := '宋体';
            bmp.Canvas.Font.Size := 14;
            bmp.Canvas.Font.style := [fsBold];
            bmp.Canvas.Brush.Style:=bsClear;
            bmp.Canvas.TextOut(740,578,edtCreditNO.Text);
            bmp.Canvas.TextOut(380,632,edtBN.Text);
            bmp.Canvas.TextOut(380,732,edtRegaddr.Text);
            bmp.Canvas.TextOut(380,782,edtlawMan.Text);
            bmp.Canvas.TextOut(374,877,FormatDateTime('YYYY年mm月dd日',now));
            //bmp.Canvas.TextOut(446,877,FormatDateTime('mm',now));
            //bmp.Canvas.TextOut(492,877,FormatDateTime('dd',now));
            bmp.Canvas.TextOut(384,935,cbbManageScope.Text);
            bmp.Canvas.TextOut(384,682,cbbCategory.Text);            

            bmp.Canvas.Font.Size := 16;
            bmp.Canvas.TextOut(705,1395,FormatDateTime('YYYY',now));
            bmp.Canvas.TextOut(814,1395,FormatDateTime('mm',now));
            bmp.Canvas.TextOut(902,1395,FormatDateTime('dd',now));

            Perx:=25.4/PixelsPerInch;
            YX:=Point(743,1316);
            //YX:=Point(765,1100);
            x:=0;
            y:=0;
            F1_L:=10;
            F1_T:=10;
            SPE_F_W:= 0.6; //字宽
            SPE_F_H:= 1.2; //字高
            SPE_F_R:=2.7;  //半径
            SPE_F_B:=25;   //加粗
            SPE_JD:=360;   //角度
            TmpAngle:=0;
            WStr_:=ToChineseChar(Trim(edtBN.Text));                                    //绘制文本1
            n := Length(WStr_); //汉字个数
            if n = 1 then
            begin
                x := Round(F1_L / Perx * 10) + YX.X - Round(SPE_F_W / Perx * 10);
                Y := Round(F1_T / Perx * 10) + YX.Y - Round(SPE_F_R / Perx * 10);
                DrawText_(bmp.Canvas, '宋体', 0, x, y, Round(SPE_F_H / Perx * 10), Round(SPE_F_W / Perx * 10), SPE_F_B, WStr_);
            end
            else if n > 1 then
            begin
                //TmpAngle := SPE_JD / (n - 1);
                TmpAngle := 39;                                         //平均夹角=环排角度/字数
                for i := 0 to n - 1 do
                begin
                    Angle := 142 + (SPE_JD / 2) + SPE_F_W * 10 / 2 -4- TmpAngle * i;
                    x := YX.X + Round(cos(Pi * Angle / 180) * SPE_F_R / Perx * 10);
                    y := YX.Y - Round(sin(Pi * Angle / 180) * SPE_F_R / Perx * 10);
                    DrawText_(bmp.Canvas, '宋体', round(464 - Angle) mod 360, x, y, Round(SPE_F_H / Perx * 10), Round(SPE_F_W / Perx * 10), SPE_F_B, WStr_[i + 1]);
                end;

            end;

            jp.Assign(bmp);
            jp.SaveToFile(DestPic + '\营业执照_副本.jpg');
        finally
            bmp.Free;
            bmp_t.Free;
        end;
    finally
        jp1.Free;
        jp.Free;
    end;
end;

procedure TMainForm.FilloutZLHT(DestPic: string);
var
    jp1, jp: TJPEGImage;
    bmp_t, bmp: TBitmap;
    Y: Integer;
    DX: string;
begin
    jp1 := TJPEGImage.Create;
    jp := TJPEGImage.Create;
    try
        jp1.LoadFromFile(ExtractFilePath(Application.ExeName) + '租赁合同.jpg');
        bmp := TBitmap.Create;
        bmp_t := TBitmap.Create;
        try
            bmp.Width := jp1.Width;
            bmp.Height := jp1.Height;

            bmp_t.Assign(jp1);
            bmp.Canvas.Draw(0, 0, bmp_t);
            bmp.Canvas.Font.name := '宋体';
            bmp.Canvas.Font.Size := 14;
            bmp.Canvas.Font.style := [fsBold];
            bmp.Canvas.Brush.Style:=bsClear;
            bmp.Canvas.TextOut(300,100,'上海德颐网络技术有限公司');
            bmp.Canvas.TextOut(300,150,edtlawMan.Text);
            bmp.Canvas.Font.style := [];
            bmp.Canvas.Brush.Style:=bsClear;
            bmp.Canvas.TextOut(152,418,edtLendarea.Text);
            bmp.Canvas.TextOut(277,693,FormatDateTime('YYYY',now));
            Y := StrToInt(FormatDateTime('YYYY',now)) +4;
            bmp.Canvas.TextOut(478,691,INttoStr(Y));
            bmp.Canvas.TextOut(350,691,FormatDateTime('mm',now));
            bmp.Canvas.TextOut(540,691,FormatDateTime('mm',now));
            bmp.Canvas.TextOut(390,691,FormatDateTime('dd',now));
            bmp.Canvas.TextOut(581,691,FormatDateTime('dd',now));
            bmp.Canvas.TextOut(182,783,Trim(edtLendFee.Text));
            DX := MoneyConvert(StrtoFloat(Trim(edtLendFee.Text)));
            if Pos('元整', DX) > 0 then
            begin
                DX := StringReplace(DX,'元整','',[rfReplaceAll]);
            end;
            bmp.Canvas.TextOut(384,783,DX);

            bmp.Canvas.Font.style := [];
            bmp.Canvas.Font.Size := 25;
            bmp.Canvas.TextOut(220,1240,'上海德颐网络技术有限公司');
            bmp.Canvas.TextOut(850,1240,edtlawMan.Text);
            bmp.Canvas.Font.name := '黑体';
            bmp.Canvas.Font.Size := 20;
            bmp.Canvas.TextOut(165,1325,FormatDateTime('YYYY.mm.dd',now));
            bmp.Canvas.TextOut(815,1325,FormatDateTime('YYYY.mm.dd',now));            
            jp.Assign(bmp);
            jp.SaveToFile(DestPic + '\租赁合同_副本.jpg');
        finally
            bmp.Free;
            bmp_t.Free;
        end;
    finally
        jp1.Free;
        jp.Free;
    end;
end;

function IsHZ(ch: WideChar): boolean;
var
    i: integer;
begin
    i := ord(ch);
    if (i < 19968) or (i > 40869) then
        result := false
    else
        result := true;
end;
procedure TMainForm.MyTextOut(Canvas: TCanvas; X, Y: Integer; const Text: Widestring; FontName: string; FontSize: Integer);
var
    i: Integer;
begin
    for i := 1 to Length(Text) do
    begin
        if isHz(Text[i]) then
        begin
            Canvas.Font.Name := FontName;
            Canvas.Font.Size := FontSize;

        end
        else
        begin
            Canvas.Font.Name := 'Arial';
        end;

        Canvas.TextOut(X,Y,Text[i]);
        X := X + Canvas.TextWidth(Text[i]);

    end;
end;


procedure TMainForm.DrawText_(ACanvas: TCanvas; FN_: TFontName; Angle, x, y, H_, W_, WT: Integer; AStr: string);
var
    AFont: TFont;
    LogFont: TLogFont;
begin
    SetBkMode(ACanvas.Handle, TRANSPARENT);
    AFont := TFont.Create;
    AFont.Name := FN_;

    AFont.Color := clRed;
    try
        GetObject(AFont.Handle, SizeOf(LogFont), @LogFont);
        LogFont.lfEscapement := -Angle * 10;      //设置顺时针方向与X轴的夹角
        LogFont.lfOrientation := -Angle * 10;
        LogFont.lfWeight := WT * 100;
        LogFont.lfHeight := H_;        //设置字高
        LogFont.lfWidth := W_;        //设置字宽
        AFont.Handle := CreateFontIndirect(LogFont);
        ACanvas.Font.Assign(AFont);
    finally
        AFont.Free;
    end;
    ACanvas.TextOut(x, y, AStr);
end;

procedure TMainForm.btnLogClick(Sender: TObject);
    procedure DoWithHtmlElement(aElementCollection: IHTMLElementCollection);
    var
        k: integer;
        vk: oleVariant;
        Dispatch: IDispatch;
        //声明接口;
        HTMLInputElement: IHTMLInputElement;
        HTMLSelectElement: IHTMLSelectElement;
        HTMLOptionElement: IHTMLOptionElement;
        HTMLTextAreaElement: IHTMLTextAreaElement;
        HTMLFormElement: IHTMLFormElement;
        HTMLOptionButtonElement: IHTMLOptionButtonElement;
    begin
        for k := 0 to aElementCollection.length - 1 do//对当前页的所有对象进行循环断定;
        begin
            vk := k;
            Application.ProcessMessages;
            Dispatch := aElementCollection.item(vk, 0);

            //如果是输入框;
            if Succeeded(Dispatch.QueryInterface(IHTMLInputElement, HTMLInputElement)) then
            begin
                with HTMLInputElement do//单行文本
                begin
                    if (UpperCase(Type_) = 'TEXT') or (UpperCase(Type_) = 'PASSWORD') then//判断输入框类型;
                    begin
                        value := '';
                        if Name = 'merinfo.nameBusi' then
                            Value := edtBsn.Text;

                        if Name = 'merinfo.name' then
                            Value := edtBN.Text;
                        if Name = 'merinfo.regAddr' then
                            Value := edtRegAddr.Text;
                        if Name = 'merinfo.certif' then
                            value := edtlawMan.Text;
                        if Name = 'merinfo.busiLiceNo' then
                            Value := edtCreditNo.Text;
                        if Name = 'merinfo.certifNo' then
                            Value := edtIDno.Text;
                        if Name = 'merinfo.contactName' then
                            Value := edtSettleName.Text;
                        if Name = 'merinfo.contactPhoneNo' then
                            Value := edtPhone.Text;
                        if Name = 'merinfo.terminfoRisk.AccpetStartTime' then
                            Value := '0080';
                        if Name = 'merinfo.terminfoRisk.AccpetEndTime' then
                            Value := '2200';
                        if Name = 'merinfo.busiMain' then
                            Value := cbbmanagescope.Text;
                        if Name = 'merinfo.stlmWayDesc' then
                            Value := edtIDNo1.Text;
                        if Name = 'merinfo.bankAccount.name' then
                            Value := edtSettleName.Text;
                        if Name = 'merinfo.isGroup' then
                            Value := 'F';
                        if Name = 'merinfo.terminfoList[0].Installlocation' then
                            Value := edtInstallAddr.Text;

                    end
                end;
            end
            else if Succeeded(Dispatch.QueryInterface(IHTMLTEXTAreaElement, HTMLTextAreaElement)) then
            begin
                with HTMLTextAreaElement do//多行文本
                begin
                    value := '';
                end;
            end
            else if Succeeded(Dispatch.QueryInterface(IHTMLOptionElement, HTMLOptionElement)) then
            begin
                with HTMLOptionElement do//下拉选项
                begin
                 //处理
                end;
            end
            else if SUCCEEDED(Dispatch.QueryInterface(IHTMLOptionButtonElement, HTMLOptionButtonElement)) then
            begin
            //不明
            //处理
            end
            else
                ;
        end;
    end;
var
    Dispatch,Dispatch1: IDispatch;
    i, j: integer;
    FrameWindow,FrameWindow1: IHTMLWindow2; //框架窗口;
    Vi, Vj: OLEVariant;

    ShellWindow: IShellWindows;
    nCount: Integer;
    spDisp: IDispatch;
    IE1: IWebBrowser2;
    IDoc1,IDoc2: IHTMLDocument2;
    HaveOpened: Boolean; //判断网页是否打开
begin
    HaveOpened := False;
    ShellWindow := CoShellWindows.Create;
    nCount := ShellWindow.Count;

    for i := 0 to nCount -1 do
    begin
        vi := i;

        spDisp := ShellWindow.item(vi);
        if spDisp = nil then continue;
        spDisp.QueryInterface(iWebBrowser2,IE1);
        if IE1 <> nil then
        begin
            if (Pos('/fmposm/login.ct',iE1.LocationURL) > 0) and (iE1.LocationName='POS收单运营管理平台') then
            begin
                IE1.Document.QueryInterface(IHTMLDocument2,iDoc1);
                if iDoc1 <> nil then
                begin
                    if iDoc1.frames.length > 2 then//如果是无框架
                    begin
                        Vj:=2;
                        Dispatch := iDoc1.frames.item(Vj);
                        if Succeeded(Dispatch.QueryInterface(IHTMLWindow2,FrameWindow)) then
                        begin
                            IDoc2 := IHTMLDocument2(FrameWindow.document);
                            if IDoc2.frames.length > 0 then
                            begin
                                for j := 0 to IDoc2.frames.length - 1 do
                                begin
                                    Vj:=j;
                                    Dispatch1 := iDoc2.frames.item(Vj);
                                    if Succeeded(Dispatch1.QueryInterface(IHTMLWindow2,FrameWindow1)) then
                                    begin
                                        if FrameWindow1.location.toString = 'https://shoudan.freemypay.com:18081/fmposm/mer/addMerJsp.ct' then
                                        begin
                                            HaveOpened := True; //网页已打开
                                            DoWithHtmlElement(FrameWindow1.document.all);//调用自动填写过程;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;

    if not HaveOpened then
    begin
        Application.MessageBox('请您先打开网页再录入！', '提示', MB_OK +MB_Iconinformation);
    end
    else
    begin
        Application.MessageBox('录入后台完成！', '提示', MB_OK +MB_Iconinformation);
    end;
end;

end.

