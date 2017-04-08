object MainForm: TMainForm
  Left = 176
  Top = 14
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20184#20020#38376#25910#21333#21161#25163
  ClientHeight = 638
  ClientWidth = 1049
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grpRegInfo: TGroupBox
    Left = 8
    Top = 8
    Width = 433
    Height = 545
    Caption = #21830#25143#27880#20876#20449#24687
    TabOrder = 0
    object lbl1: TLabel
      Left = 24
      Top = 40
      Width = 60
      Height = 13
      Caption = #21830#25143#21517#31216#65306
    end
    object lbl2: TLabel
      Left = 224
      Top = 40
      Width = 60
      Height = 13
      Caption = #21830#25143#24215#21517#65306
    end
    object edtBN: TEdit
      Left = 88
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'edtBN'
    end
    object edtBSN: TEdit
      Left = 288
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'edtBSN'
    end
  end
  object grpContractNo: TGroupBox
    Left = 456
    Top = 8
    Width = 281
    Height = 57
    Caption = #21512#21516#32534#21495
    TabOrder = 1
    object chkInc: TCheckBox
      Left = 16
      Top = 24
      Width = 57
      Height = 17
      Caption = #36882#22686#65306
      TabOrder = 0
    end
    object edtInc: TEdit
      Left = 80
      Top = 24
      Width = 185
      Height = 21
      TabOrder = 1
      Text = 'edtInc'
    end
  end
  object grpLicense: TGroupBox
    Left = 456
    Top = 72
    Width = 281
    Height = 169
    Caption = #33829#19994#25191#29031
    TabOrder = 2
    object lbl3: TLabel
      Left = 16
      Top = 16
      Width = 60
      Height = 13
      Caption = #20449#29992#20195#30721#65306
    end
    object lbl8: TLabel
      Left = 16
      Top = 40
      Width = 60
      Height = 13
      Caption = #31867'        '#22411#65306
    end
    object lbl9: TLabel
      Left = 16
      Top = 64
      Width = 60
      Height = 13
      Caption = #27880#20876#26085#26399#65306
    end
    object lbl10: TLabel
      Left = 16
      Top = 88
      Width = 60
      Height = 13
      Caption = #27880#20876#36164#26412#65306
    end
    object lbl11: TLabel
      Left = 16
      Top = 112
      Width = 60
      Height = 13
      Caption = #30331#35760#26426#20851#65306
    end
    object lbl12: TLabel
      Left = 16
      Top = 136
      Width = 60
      Height = 13
      Caption = #26680#20934#26085#26399#65306
    end
    object edtCreditNo: TEdit
      Left = 80
      Top = 16
      Width = 185
      Height = 21
      TabOrder = 0
      Text = 'edtCreditNo'
    end
    object cbbCategory: TComboBox
      Left = 80
      Top = 40
      Width = 185
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'cbbCategory'
    end
    object dtpRegDate: TDateTimePicker
      Left = 80
      Top = 64
      Width = 186
      Height = 21
      Date = 42833.794358935190000000
      Time = 42833.794358935190000000
      TabOrder = 2
    end
    object edtRegCapital: TEdit
      Left = 80
      Top = 88
      Width = 185
      Height = 21
      TabOrder = 3
      Text = 'edtRegCapital'
    end
    object cbbRegAgent: TComboBox
      Left = 80
      Top = 112
      Width = 185
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Text = 'cbbRegAgent'
    end
    object dtpCheckDate: TDateTimePicker
      Left = 80
      Top = 136
      Width = 186
      Height = 21
      Date = 42833.797335694440000000
      Time = 42833.797335694440000000
      TabOrder = 5
    end
  end
  object grpPhoto: TGroupBox
    Left = 456
    Top = 248
    Width = 369
    Height = 273
    Caption = #35777#20214#29031
    TabOrder = 3
    object lbl4: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #36523#20221#35777#27491#38754
    end
    object lbl5: TLabel
      Left = 192
      Top = 16
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #36523#20221#35777#21453#38754
    end
    object lbl6: TLabel
      Left = 8
      Top = 144
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #38134#34892#21345#27491#38754
    end
    object lbl7: TLabel
      Left = 192
      Top = 144
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #38134#34892#21345#21453#38754
    end
    object pnl1: TPanel
      Left = 8
      Top = 32
      Width = 177
      Height = 105
      Caption = 'pnl1'
      TabOrder = 0
    end
    object pnl2: TPanel
      Left = 192
      Top = 32
      Width = 169
      Height = 105
      Caption = 'pnl1'
      TabOrder = 1
    end
    object pnl3: TPanel
      Left = 8
      Top = 160
      Width = 177
      Height = 105
      Caption = 'pnl1'
      TabOrder = 2
    end
    object pnl4: TPanel
      Left = 192
      Top = 160
      Width = 169
      Height = 105
      Caption = 'pnl1'
      TabOrder = 3
    end
  end
  object btnImport: TButton
    Left = 464
    Top = 528
    Width = 75
    Height = 25
    Caption = #23548#20837
    TabOrder = 4
    OnClick = btnImportClick
  end
  object btnLog: TButton
    Left = 588
    Top = 536
    Width = 75
    Height = 25
    Caption = #24405#20837
    TabOrder = 5
  end
  object btnSave: TButton
    Left = 696
    Top = 528
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 6
  end
  object stat1: TStatusBar
    Left = 0
    Top = 617
    Width = 1049
    Height = 21
    Panels = <>
  end
  object mmMain: TMainMenu
    Left = 232
    object N1: TMenuItem
      Caption = #35774#32622'(&S)'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #24110#21161'(&H)'
    end
  end
  object dlgOpen1: TOpenDialog
    Filter = #25991#26412#25991#26723'(*.txt)|*.txt|'#25152#26377#25991#20214'(*.*)|*.*'
    Left = 440
    Top = 344
  end
end
