unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

{$IFDEF DEBUG}
// При дебаге ничего не выкидываем.
{$ELSE}
// Директивы для уменьшения размера *.exe:
{$SETPEFLAGS IMAGE_FILE_RELOCS_STRIPPED or IMAGE_FILE_DEBUG_STRIPPED or
  IMAGE_FILE_LINE_NUMS_STRIPPED or IMAGE_FILE_LOCAL_SYMS_STRIPPED or
  IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP or IMAGE_FILE_NET_RUN_FROM_SWAP}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$ENDIF}

type
  TFormMain = class(TForm)
    MemoInput: TMemo;
    RadioGroupMethod: TRadioGroup;
    ButtonGo: TButton;
    ButtonClear: TButton;
    PanelOutput: TPanel;
    MemoOutput: TMemo;
    PanelInput: TPanel;
    PanelInOut: TPanel;
    PanelControl: TPanel;
    SplitterInOut: TSplitter;
    PanelButons: TPanel;
    ScrollBoxGroupMethod: TScrollBox;
    RadioGroupFont: TRadioGroup;
    PanelFontSettings: TPanel;
    ComboBoxFontSize: TComboBox;
    GroupBoxFontSize: TGroupBox;
    ButtonStrikethrough1: TButton;
    ButtonStrikethrough2: TButton;
    ButtonUnderlines1: TButton;
    ButtonUnderlines2: TButton;
    ButtonUnderlines3: TButton;
    ButtonDoubleU2: TButton;
    PanelControlButtons: TPanel;
    ButtonDoubleU1: TButton;
    ButtonOverlines2: TButton;
    ButtonOverlines1: TButton;
    ButtonAbout: TButton;
    PanelASCIIart: TPanel;
    ButtonASCIIart: TButton;
    ComboBoxASZoom: TComboBox;
    ComboBoxASFontName: TComboBox;
    PanelDecorationBtns: TPanel;
    CheckBoxASNegative: TCheckBox;
    ComboBoxASCharacterSet: TComboBox;
    ComboBoxASFontSize: TComboBox;
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonGoClick(Sender: TObject);
    procedure RadioGroupFontClick(Sender: TObject);
    procedure ComboBoxFontSizeChange(Sender: TObject);
    procedure Transform(Sender: TObject);
    procedure ButtonAboutClick(Sender: TObject);
    procedure ButtonASCIIartClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

const
  FontNames: array of string = ['Tahoma', 'Segoe UI', 'Lucida Console' { ,'Universalia' } ];

implementation

uses uTextConverter, uAbout, uStringsConverter, uASCIIdecorator;

{$R *.dfm}

procedure TFormMain.ButtonASCIIartClick(Sender: TObject);
var
  ASCIIdecorator: TASCIIdecorator;
begin
  ASCIIdecorator := TASCIIdecorator.Create(nil);
  //
  MemoOutput.WordWrap := False;
  MemoOutput.ScrollBars := ssBoth;
  //
  MemoOutput.Text := ASCIIdecorator.MakeASCIIfromText(MemoInput.Text,
    ComboBoxASFontName.Items[ComboBoxASFontName.ItemIndex], 255,
    StrToInt(ComboBoxASZoom.Items[ComboBoxASZoom.ItemIndex]), CheckBoxASNegative.Checked,
    ComboBoxASCharacterSet.ItemIndex,
    StrToInt(ComboBoxASFontSize.Items[ComboBoxASFontSize.ItemIndex]));
  //
  FreeAndNil(ASCIIdecorator);
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
  procedure GoTransform(TransformMethod: Integer);
  begin
    case TransformMethod of
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
  GoTransform(RadioGroupMethod.ItemIndex);
  MemoOutput.SelectAll;
  MemoOutput.CopyToClipboard;
end;

procedure TFormMain.ComboBoxFontSizeChange(Sender: TObject);
begin
  MemoInput.Font.Size := ComboBoxFontSize.Items[ComboBoxFontSize.ItemIndex].ToInteger();
  MemoOutput.Font.Size := ComboBoxFontSize.Items[ComboBoxFontSize.ItemIndex].ToInteger();
end;

procedure TFormMain.RadioGroupFontClick(Sender: TObject);
begin
  MemoInput.Font.Name := FontNames[RadioGroupFont.ItemIndex];
  MemoOutput.Font.Name := FontNames[RadioGroupFont.ItemIndex];
end;

procedure TFormMain.Transform(Sender: TObject);
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
