object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1041#1091#1082#1074#1086#1077#1078#1082#1072
  ClientHeight = 625
  ClientWidth = 703
  Color = clBtnFace
  Constraints.MinWidth = 719
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object PanelInOut: TPanel
    Left = 0
    Top = 140
    Width = 703
    Height = 485
    Align = alClient
    Caption = 'PanelInOut'
    TabOrder = 0
    object SplitterInOut: TSplitter
      Left = 1
      Top = 248
      Width = 701
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitLeft = -9
      ExplicitTop = 251
    end
    object PanelInput: TPanel
      Left = 1
      Top = 1
      Width = 701
      Height = 247
      Align = alTop
      Caption = 'PanelOutput'
      TabOrder = 0
      object MemoInput: TMemo
        Left = 1
        Top = 1
        Width = 699
        Height = 245
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object PanelOutput: TPanel
      Left = 1
      Top = 251
      Width = 701
      Height = 233
      Align = alClient
      Caption = 'PanelOutput'
      TabOrder = 1
      object MemoOutput: TMemo
        Left = 1
        Top = 1
        Width = 699
        Height = 231
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object PanelControl: TPanel
    Left = 0
    Top = 0
    Width = 703
    Height = 110
    Align = alTop
    Caption = 'PanelControl'
    Ctl3D = False
    ParentCtl3D = False
    ShowCaption = False
    TabOrder = 1
    object PanelButons: TPanel
      Left = 629
      Top = 1
      Width = 73
      Height = 108
      Align = alRight
      Caption = 'PanelButons'
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ShowCaption = False
      TabOrder = 0
      object ButtonClear: TButton
        Left = 1
        Top = 1
        Width = 71
        Height = 32
        Align = alTop
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 0
        OnClick = ButtonClearClick
      end
      object ButtonGo: TButton
        Left = 1
        Top = 33
        Width = 71
        Height = 74
        Align = alClient
        Caption = #1047#1072#1084#1077#1085#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        TabOrder = 1
        OnClick = ButtonGoClick
      end
    end
    object ScrollBoxGroupMethod: TScrollBox
      Left = 1
      Top = 1
      Width = 533
      Height = 108
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      object RadioGroupMethod: TRadioGroup
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 527
        Height = 102
        Align = alClient
        Caption = #1052#1077#1090#1086#1076' '#1079#1072#1084#1077#1085#1099
        Columns = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 6
        Items.Strings = (
          'ASCII-'#1089#1086#1074#1084#1077#1089#1090#1080#1084#1099#1081
          'ASCII + '#1082#1080#1088#1080#1083#1083#1080#1094#1072
          'Win-1252'
          'Unicode - PW-'#1089#1086#1074#1084#1077#1089#1090#1080#1084#1099#1081
          'Unicode - '#1083#1091#1095#1096#1080#1081' (Win7+)'
          'Unicode - '#1088#1072#1085#1076#1086#1084' (Win7+)'
          'Unicode - '#1088#1072#1085#1076#1086#1084' (XP+)'
          'Unicode - '#1087#1077#1088#1077#1074#1077#1088#1085#1091#1090#1100
          'Unicode - '#1085#1077#1074#1080#1076'. '#1084#1091#1089#1086#1088' v1'
          'Unicode - '#1085#1077#1074#1080#1076'. '#1084#1091#1089#1086#1088' v2'
          'Unicode - '#1094#1077#1088#1082#1086#1074#1085#1086#1089#1083#1072#1074'.'
          'Unicode - '#1085#1072#1076#1089#1090#1088#1086#1095#1085#1099#1081
          #1041#1045#1047#1053#1054#1043'N'#1052
          #1047#1072#1076#1086#1084' '#1085#1072#1087#1077#1088#1105#1076
          #1054#1073#1099#1095#1085#1099#1081)
        ParentFont = False
        TabOrder = 0
        OnClick = ButtonGoClick
      end
    end
    object PanelFontSettings: TPanel
      Left = 534
      Top = 1
      Width = 95
      Height = 108
      Align = alRight
      ShowCaption = False
      TabOrder = 2
      object RadioGroupFont: TRadioGroup
        AlignWithMargins = True
        Left = 4
        Top = 2
        Width = 87
        Height = 64
        Margins.Top = 1
        Margins.Bottom = 1
        Align = alClient
        Caption = #1064#1088#1080#1092#1090
        ItemIndex = 2
        Items.Strings = (
          'Tahoma'
          'Segoe UI'
          'Lucida Cons.')
        TabOrder = 0
        OnClick = RadioGroupFontClick
      end
      object GroupBoxFontSize: TGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 68
        Width = 87
        Height = 38
        Margins.Top = 1
        Margins.Bottom = 1
        Align = alBottom
        Caption = #1056#1072#1079#1084#1077#1088
        TabOrder = 1
        object ComboBoxFontSize: TComboBox
          AlignWithMargins = True
          Left = 4
          Top = 14
          Width = 79
          Height = 21
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alClient
          AutoDropDown = True
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
          Text = '8'
          OnChange = ComboBoxFontSizeChange
          Items.Strings = (
            '8'
            '10'
            '12'
            '14'
            '16'
            '18'
            '20'
            '22'
            '24'
            '26'
            '30'
            '40'
            '70'
            '120')
        end
      end
    end
  end
  object PanelControlButtons: TPanel
    Left = 0
    Top = 110
    Width = 703
    Height = 30
    Align = alTop
    Caption = 'PanelControlButtons'
    ShowCaption = False
    TabOrder = 2
    object ButtonAbout: TButton
      AlignWithMargins = True
      Left = 624
      Top = 2
      Width = 75
      Height = 26
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alRight
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      TabOrder = 0
      OnClick = ButtonAboutClick
    end
    object PanelASCIIart: TPanel
      Left = 249
      Top = 1
      Width = 372
      Height = 28
      Align = alClient
      ShowCaption = False
      TabOrder = 1
      object ButtonASCIIart: TButton
        AlignWithMargins = True
        Left = 11
        Top = 2
        Width = 60
        Height = 24
        Margins.Left = 10
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alLeft
        Caption = 'ASCII-art'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ButtonASCIIartClick
      end
      object ComboBoxASZoom: TComboBox
        AlignWithMargins = True
        Left = 75
        Top = 4
        Width = 30
        Height = 21
        Align = alLeft
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
        Text = '1'
        OnChange = ButtonASCIIartClick
        Items.Strings = (
          '1'
          '2'
          '3'
          '4')
      end
      object ComboBoxASFontName: TComboBox
        AlignWithMargins = True
        Left = 162
        Top = 4
        Width = 80
        Height = 21
        Align = alLeft
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 2
        Text = 'Lucida Console'
        OnChange = ButtonASCIIartClick
        Items.Strings = (
          'Courier New'
          'Lucida Console'
          'Consolas'
          'Calibri'
          'Times New Roman'
          'Segoe UI'
          'Verdana'
          'Arial Unicode MS'
          'Tahoma')
      end
      object CheckBoxASNegative: TCheckBox
        AlignWithMargins = True
        Left = 304
        Top = 4
        Width = 52
        Height = 20
        Align = alLeft
        Caption = #1053#1077#1075#1072#1090'.'
        TabOrder = 3
        OnClick = ButtonASCIIartClick
      end
      object ComboBoxASCharacterSet: TComboBox
        AlignWithMargins = True
        Left = 248
        Top = 4
        Width = 50
        Height = 21
        Align = alLeft
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 4
        Text = 'fF#'
        OnChange = ButtonASCIIartClick
        Items.Strings = (
          'fF#'
          #9617#9618#9619
          #1078#1046'#'
          #20128#19976#20096
          #19969#19976#20007)
      end
      object ComboBoxASFontSize: TComboBox
        AlignWithMargins = True
        Left = 111
        Top = 4
        Width = 45
        Height = 21
        Align = alLeft
        Style = csDropDownList
        ItemIndex = 3
        TabOrder = 5
        Text = '120'
        OnChange = ButtonASCIIartClick
        Items.Strings = (
          '60'
          '80'
          '100'
          '120'
          '140'
          '160')
      end
    end
    object PanelDecorationBtns: TPanel
      Left = 1
      Top = 1
      Width = 248
      Height = 28
      Align = alLeft
      ShowCaption = False
      TabOrder = 2
      object ButtonDoubleU1: TButton
        Tag = 6
        AlignWithMargins = True
        Left = 139
        Top = 2
        Width = 25
        Height = 24
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alLeft
        Caption = 'D'#819' 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Transform
      end
      object ButtonDoubleU2: TButton
        Tag = 7
        AlignWithMargins = True
        Left = 166
        Top = 2
        Width = 25
        Height = 24
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alLeft
        Caption = 'D'#839' 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Transform
      end
      object ButtonOverlines1: TButton
        Tag = 8
        AlignWithMargins = True
        Left = 193
        Top = 2
        Width = 25
        Height = 24
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alLeft
        Caption = 'O'#773' 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = Transform
      end
      object ButtonOverlines2: TButton
        Tag = 9
        AlignWithMargins = True
        Left = 220
        Top = 2
        Width = 25
        Height = 24
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alLeft
        Caption = 'O'#862' 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = Transform
      end
      object ButtonStrikethrough1: TButton
        Tag = 1
        AlignWithMargins = True
        Left = 112
        Top = 2
        Width = 25
        Height = 24
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alLeft
        Caption = ' '#822'S'#822' 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = Transform
      end
      object ButtonStrikethrough2: TButton
        Tag = 2
        AlignWithMargins = True
        Left = 83
        Top = 2
        Width = 25
        Height = 24
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alLeft
        Caption = ' '#821'S'#821' 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = Transform
      end
      object ButtonUnderlines1: TButton
        Tag = 3
        AlignWithMargins = True
        Left = 56
        Top = 2
        Width = 25
        Height = 24
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alLeft
        Caption = 'U'#817' 1 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = Transform
      end
      object ButtonUnderlines2: TButton
        Tag = 4
        AlignWithMargins = True
        Left = 29
        Top = 2
        Width = 25
        Height = 24
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alLeft
        Caption = 'U'#818' 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnClick = Transform
      end
      object ButtonUnderlines3: TButton
        Tag = 5
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 25
        Height = 24
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alLeft
        Caption = 'U'#863' 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = Transform
      end
    end
  end
end
