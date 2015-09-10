unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl, FMX.Objects,
  FMX.StdCtrls, FMX.Layouts, FMX.Memo, FMX.ListBox, FMX.ScrollBox,
  FMX.Controls.Presentation;

type
  TFormMain = class(TForm)
    TabControlMain: TTabControl;
    TabItemSymbolsReplace: TTabItem;
    TabItemTextDecorate: TTabItem;
    TabItemFixedASCIIart: TTabItem;
    PanelHeadControls: TPanel;
    PanelActions: TPanel;
    PanelViewFontSettings: TPanel;
    PanelControlButtons: TPanel;
    ButtonAbout: TButton;
    ImageAboutGlyph: TImage;
    ButtonClear: TButton;
    ImageClearGlyph: TImage;
    ButtonGo: TButton;
    ImageGoGlyph: TImage;
    GroupBoxViewFontName: TGroupBox;
    RadioButtonVFTahoma: TRadioButton;
    GroupBoxViewFontSize: TGroupBox;
    RadioButtonVFSegoeUI: TRadioButton;
    RadioButtonVFLucidaConsole: TRadioButton;
    ComboBoxVFSize: TComboBox;
    GroupBoxReplaceMethod: TGroupBox;
    PanelSR1: TPanel;
    PanelSR2: TPanel;
    PanelSR3: TPanel;
    RadioButtonASCIIcomp: TRadioButton;
    RadioButtonUnicodeBestW7: TRadioButton;
    RadioButtonUnicodePW: TRadioButton;
    RadioButtonWIN1252: TRadioButton;
    RadioButtonASCIIcyr: TRadioButton;
    RadioButtonUnicodeRandW7: TRadioButton;
    RadioButtonUnicodeInvis2: TRadioButton;
    RadioButtonUnicodeInvis1: TRadioButton;
    RadioButtonUnicodeFlip: TRadioButton;
    RadioButtonRandXP: TRadioButton;
    RadioButtonUnicodeOldStyle: TRadioButton;
    RadioButtonDecode: TRadioButton;
    RadioButtonReverse: TRadioButton;
    RadioButtonBEZNOGIM: TRadioButton;
    RadioButtonUnicodeSup: TRadioButton;
    GroupBoxUnderline: TGroupBox;
    GroupBoxOverline: TGroupBox;
    GroupBoxDoubleU: TGroupBox;
    GroupBoxStrikethrough: TGroupBox;
    ButtonUnderline1: TButton;
    ButtonUnderline2: TButton;
    ButtonUnderline3: TButton;
    ButtonStrikethrough1: TButton;
    ButtonStrikethrough2: TButton;
    ButtonOverline1: TButton;
    ButtonOverline2: TButton;
    ButtonDoubleU1: TButton;
    ButtonDoubleU2: TButton;
    GroupBoxFixedFontSettings: TGroupBox;
    ComboBoxFFName: TComboBox;
    CheckBoxFFInvertColors: TCheckBox;
    GridPanelLayout: TGridPanelLayout;
    MemoInput: TMemo;
    MemoOutput: TMemo;
    procedure ButtonGoClick(Sender: TObject);
    procedure ButtonSymbolsReplaceClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonAboutClick(Sender: TObject);
    procedure TextDecorate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ReplaceMethodItemIndexChange(Sender: TObject);
    procedure ButtonFixedGraphicFontClick(Sender: TObject);
    procedure ViewFontNameChange(Sender: TObject);
    procedure ViewFontSizeChange(Sender: TObject);
  private
    FReplaceMethodItemIndex: integer;
    FViewFontItemIndex: integer;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses uTextConverter, uFixedASCIIartMaker, uAbout;

procedure TFormMain.ReplaceMethodItemIndexChange(Sender: TObject);
begin
  FReplaceMethodItemIndex := (Sender as TRadioButton).Tag;
  ButtonGoClick(Sender);
end;

procedure TFormMain.ViewFontNameChange(Sender: TObject);
// переделать на динамический поиск по тегу ViewFontItemIndex у дочерних ком-в GroupBoxViewFontName
begin
  FViewFontItemIndex := (Sender as TRadioButton).Tag;
  case FViewFontItemIndex of
    0:
      begin
        MemoInput.TextSettings.Font.Family := RadioButtonVFTahoma.Text;
        MemoOutput.TextSettings.Font.Family := RadioButtonVFTahoma.Text;
      end;
    1:
      begin
        MemoInput.TextSettings.Font.Family := RadioButtonVFSegoeUI.Text;
        MemoOutput.TextSettings.Font.Family := RadioButtonVFSegoeUI.Text;
      end;
    2:
      begin
        MemoInput.TextSettings.Font.Family := RadioButtonVFLucidaConsole.Text;
        MemoOutput.TextSettings.Font.Family := RadioButtonVFLucidaConsole.Text;
      end;
  end;

end;

procedure TFormMain.ViewFontSizeChange(Sender: TObject);
begin
  MemoInput.TextSettings.Font.Size := ComboBoxVFSize.Items[ComboBoxVFSize.ItemIndex].ToInteger;
  MemoOutput.TextSettings.Font.Size := ComboBoxVFSize.Items[ComboBoxVFSize.ItemIndex].ToInteger;
end;

procedure TFormMain.ButtonFixedGraphicFontClick(Sender: TObject);
begin
  MemoOutput.WordWrap := False;
  // MemoOutput.ScrollBars := ssBoth;
  case ComboBoxFFName.ItemIndex of
    0:
      MemoOutput.Text := TFixedASCIIdecorator.MakeFixedASCIIFirstFont(MemoInput.Text,
        CheckBoxFFInvertColors.IsChecked);
    1:
      MemoOutput.Text := TFixedASCIIdecorator.MakeFixedASCII2chToolsFont(MemoInput.Text,
        CheckBoxFFInvertColors.IsChecked);
  end;
  MemoOutput.SelectAll;
  MemoOutput.CopyToClipboard;
end;

procedure TFormMain.TextDecorate(Sender: TObject);
begin
  MemoOutput.WordWrap := True;
  // MemoOutput.ScrollBars := ssVertical;
  //
  case (Sender as TButton).Tag of
    1:
      MemoOutput.Text := TTextConverter.AddStrikethrough1(MemoInput.Text);
    2:
      MemoOutput.Text := TTextConverter.AddStrikethrough2(MemoInput.Text);
    3:
      MemoOutput.Text := TTextConverter.AddUnderlines1(MemoInput.Text);
    4:
      MemoOutput.Text := TTextConverter.AddUnderlines2(MemoInput.Text);
    5:
      MemoOutput.Text := TTextConverter.AddUnderlines3(MemoInput.Text);
    6:
      MemoOutput.Text := TTextConverter.AddDoubleUnderlines1(MemoInput.Text);
    7:
      MemoOutput.Text := TTextConverter.AddDoubleUnderlines2(MemoInput.Text);
    8:
      MemoOutput.Text := TTextConverter.AddOverlines1(MemoInput.Text);
    9:
      MemoOutput.Text := TTextConverter.AddOverlines2(MemoInput.Text);
  end;
  MemoOutput.SelectAll;
  MemoOutput.CopyToClipboard;
end;

procedure TFormMain.ButtonSymbolsReplaceClick(Sender: TObject);
  procedure TextConvert(ConvertMethod: integer);
  begin
    case ConvertMethod of
      0:
        MemoOutput.Text := TTextConverter.MakeASCII(MemoInput.Text);
      1:
        MemoOutput.Text := TTextConverter.MakeLatinCyrillic(MemoInput.Text);
      2:
        MemoOutput.Text := TTextConverter.MakeANSIwin1252(MemoInput.Text);
      3:
        MemoOutput.Text := TTextConverter.MakeUnicodePW(MemoInput.Text);
      4:
        MemoOutput.Text := TTextConverter.MakeUnicodeW7Best(MemoInput.Text);
      5:
        MemoOutput.Text := TTextConverter.MakeUnicodeW7(MemoInput.Text);
      6:
        MemoOutput.Text := TTextConverter.MakeUnicodeWXP(MemoInput.Text);
      7:
        MemoOutput.Text := TTextConverter.MakeInverted(MemoInput.Text);
      8:
        MemoOutput.Text := TTextConverter.AddInvisibleNoise1(MemoInput.Text);
      9:
        MemoOutput.Text := TTextConverter.AddInvisibleNoise2(MemoInput.Text);
      10:
        MemoOutput.Text := TTextConverter.MakeOldStyle(MemoInput.Text);
      11:
        MemoOutput.Text := TTextConverter.MakeSupscript(MemoInput.Text);
      12:
        MemoOutput.Text := TTextConverter.MakeBeznogim(MemoInput.Text);
      13:
        MemoOutput.Text := TTextConverter.MakeBackwards(MemoInput.Text);
      14:
        MemoOutput.Text := TTextConverter.Decode(MemoInput.Text);
    end;
  end;

begin
  MemoOutput.WordWrap := True;
  // MemoOutput.ScrollBars := ssVertical;
  //
  TextConvert(FReplaceMethodItemIndex);
  MemoOutput.SelectAll;
  MemoOutput.CopyToClipboard;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FReplaceMethodItemIndex := 6;
  FViewFontItemIndex := 2;
end;

procedure TFormMain.ButtonAboutClick(Sender: TObject);
begin
  FormAbout.ShowModal;
end;

procedure TFormMain.ButtonClearClick(Sender: TObject);
begin
  FormMain.MemoInput.Text := '';
  FormMain.MemoOutput.Text := '';
end;

procedure TFormMain.ButtonGoClick(Sender: TObject);
begin
  case TabControlMain.ActiveTab.Index of
    0:
      ButtonSymbolsReplaceClick(Sender);
    2:
      ButtonFixedGraphicFontClick(Sender);
  end;
end;

end.
