unit uFormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, Vcl.ComCtrls, Vcl.ImgList, Vcl.Buttons, System.ImageList;

type
  TFormMain = class(TForm)
    MemoInput: TMemo;
    PanelOutput: TPanel;
    MemoOutput: TMemo;
    PanelInput: TPanel;
    PanelInOut: TPanel;
    SplitterInOut: TSplitter;
    RadioGroupFont: TRadioGroup;
    PanelViewFontSettings: TPanel;
    ComboBoxFontSize: TComboBox;
    GroupBoxViewFontSize: TGroupBox;
    ButtonStrikethrough1: TButton;
    ButtonStrikethrough2: TButton;
    ButtonUnderline1: TButton;
    ButtonUnderline2: TButton;
    ButtonUnderline3: TButton;
    ButtonDoubleU2: TButton;
    PanelControlButtons: TPanel;
    ButtonDoubleU1: TButton;
    ButtonOverline2: TButton;
    ButtonOverline1: TButton;
    ComboBoxASZoom: TComboBox;
    ComboBoxASFontName: TComboBox;
    CheckBoxASNegative: TCheckBox;
    ComboBoxASCharacterSet: TComboBox;
    ComboBoxASFontSize: TComboBox;
    ComboBoxFixedGraphicFont: TComboBox;
    PageControlMain: TPageControl;
    TabSheetSymbolsReplace: TTabSheet;
    TabSheetTextDecorate: TTabSheet;
    TabSheetGenericASCIIart: TTabSheet;
    TabSheetFixedASCIIart: TTabSheet;
    RadioGroupMethod: TRadioGroup;
    PanelHeadControls: TPanel;
    PanelActions: TPanel;
    GroupBoxUnderline: TGroupBox;
    GroupBoxStrikethrough: TGroupBox;
    GroupBoxDoubleU: TGroupBox;
    GroupBoxOverline: TGroupBox;
    LabelASZoom: TLabel;
    LabelSourceFontName: TLabel;
    LabelSourceFontSize: TLabel;
    GroupBoxSourceFont: TGroupBox;
    GroupBoxRendering: TGroupBox;
    LabelASCharacterSet: TLabel;
    GroupBoxFixedFontSettings: TGroupBox;
    LabelFixedFontName: TLabel;
    CheckBoxFFInvertColors: TCheckBox;
    ButtonAbout: TButton;
    ButtonClear: TButton;
    ButtonGo: TButton;
    ImageList: TImageList;
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonSymbolsReplaceClick(Sender: TObject);
    procedure ButtonGoClick(Sender: TObject);
    procedure RadioGroupFontClick(Sender: TObject);
    procedure ComboBoxFontSizeChange(Sender: TObject);
    procedure MemoAddNoise(Sender: TObject);
    procedure ButtonAboutClick(Sender: TObject);
    procedure ButtonASCIIartClick(Sender: TObject);
    procedure ButtonFixedASCIIartClick(Sender: TObject);
  private
  //
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses uTextConverter, uASCIIartMaker, uFixedASCIIartMaker, uFormAbout;

{$R *.dfm}

procedure TFormMain.ButtonASCIIartClick(Sender: TObject);
var
  ASCIIartMaker: TASCIIartMaker;
begin
  ASCIIartMaker := TASCIIartMaker.Create(nil);
  //
  MemoOutput.WordWrap := False;
  MemoOutput.ScrollBars := ssBoth;
  RadioGroupFont.ItemIndex := 2;
  RadioGroupFontClick(RadioGroupFont);
  //
  MemoOutput.Text := ASCIIartMaker.MakeASCIIfromText(MemoInput.Text,
    ComboBoxASFontName.Items[ComboBoxASFontName.ItemIndex], 255,
    StrToInt(ComboBoxASZoom.Items[ComboBoxASZoom.ItemIndex]), CheckBoxASNegative.Checked,
    ComboBoxASCharacterSet.ItemIndex,
    StrToInt(ComboBoxASFontSize.Items[ComboBoxASFontSize.ItemIndex]));
  //
  FreeAndNil(ASCIIartMaker);
  //
  MemoOutput.SelectAll;
  MemoOutput.CopyToClipboard;
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

procedure TFormMain.ButtonFixedASCIIartClick(Sender: TObject);
begin
  MemoOutput.WordWrap := False;
  MemoOutput.ScrollBars := ssBoth;
  RadioGroupFont.ItemIndex := 2;
  RadioGroupFontClick(RadioGroupFont);
  case ComboBoxFixedGraphicFont.ItemIndex of
    0:
      MemoOutput.Text := TFixedASCIIdecorator.MakeFixedASCIIFirstFont(MemoInput.Text,
        CheckBoxFFInvertColors.Checked);
    1:
      MemoOutput.Text := TFixedASCIIdecorator.MakeFixedASCII2chToolsFont(MemoInput.Text,
        CheckBoxFFInvertColors.Checked);
  end;
  MemoOutput.SelectAll;
  MemoOutput.CopyToClipboard;
end;

procedure TFormMain.ButtonSymbolsReplaceClick(Sender: TObject);
  procedure TextConvert(ConvertMethod: Integer);
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
  MemoOutput.ScrollBars := ssVertical;
  //
  TextConvert(RadioGroupMethod.ItemIndex);
  MemoOutput.SelectAll;
  MemoOutput.CopyToClipboard;
end;

procedure TFormMain.ButtonGoClick(Sender: TObject);
begin
  case PageControlMain.ActivePageIndex of
    0:
      ButtonSymbolsReplaceClick(Sender);
    2:
      ButtonASCIIartClick(Sender);
    3:
      ButtonFixedASCIIartClick(Sender);
  end;
end;

procedure TFormMain.ComboBoxFontSizeChange(Sender: TObject);
begin
  MemoInput.Font.Size := ComboBoxFontSize.Items[ComboBoxFontSize.ItemIndex].ToInteger();
  MemoOutput.Font.Size := ComboBoxFontSize.Items[ComboBoxFontSize.ItemIndex].ToInteger();
end;

procedure TFormMain.RadioGroupFontClick(Sender: TObject);
begin
  MemoInput.Font.Name := RadioGroupFont.Items[RadioGroupFont.ItemIndex];
  MemoOutput.Font.Name := RadioGroupFont.Items[RadioGroupFont.ItemIndex];
end;

procedure TFormMain.MemoAddNoise(Sender: TObject);
begin
  MemoOutput.WordWrap := True;
  MemoOutput.ScrollBars := ssVertical;
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

end.
