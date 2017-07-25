object RegForm: TRegForm
  Left = 362
  Top = 137
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #35831#36755#20837#36719#20214#21551#21160#23494#30721
  ClientHeight = 402
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 248
    Width = 73
    Height = 13
    AutoSize = False
    Caption = #24744#30340#26426#22120#30721
  end
  object lbl2: TLabel
    Left = 280
    Top = 248
    Width = 57
    Height = 13
    AutoSize = False
    Caption = #25991#20214#32534#21495
  end
  object lbl3: TLabel
    Left = 32
    Top = 288
    Width = 57
    Height = 13
    AutoSize = False
    Caption = #24320#21551#23494#30721
  end
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 497
    Height = 225
    Caption = #20184#20020#38376#23448#26041#25910#21333#21161#25163#35828#26126
    TabOrder = 0
    object mmo1: TMemo
      Left = 16
      Top = 24
      Width = 465
      Height = 193
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      Lines.Strings = (
        
          'This software may be in to 360 such as antivirus software allow ' +
          'or add trust, computer '
        
          'technology is not high comrades can be directly used after exit ' +
          'the antivirus software '
        ''
        #26412#36719#20214#26377#21487#33021#35201#22312'360'#31561#26432#27602#36719#20214#20013#20801#35768#25110#28155#21152#20449#20219','#30005#33041#25216#26415#19981#39640#30340#21516#24535#21487#20197#30452#25509#36864
        #20986#26432#27602#36719#20214#21518#20351#29992'.'
        ''
        ''
        #35831#32852#31995#23458#26381#36141#20080#21551#21160#23494#30721#65281
        #32852#31995#24494#20449#65306'15505926667')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object edtMachineCode: TEdit
    Left = 88
    Top = 248
    Width = 185
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object edtFileCode: TEdit
    Left = 336
    Top = 248
    Width = 161
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edtPassword: TEdit
    Left = 88
    Top = 288
    Width = 409
    Height = 21
    TabOrder = 3
  end
  object btnOK: TButton
    Left = 112
    Top = 336
    Width = 89
    Height = 41
    Caption = #30830#23450
    TabOrder = 4
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 320
    Top = 336
    Width = 89
    Height = 41
    Caption = #36864#20986
    ModalResult = 2
    TabOrder = 5
  end
end
