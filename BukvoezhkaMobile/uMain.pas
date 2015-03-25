unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Memo,
  FMX.StdCtrls, FMX.ListBox, FMX.Controls.Presentation, FMX.Edit;

type
  TFormMain = class(TForm)
    PanelControl: TPanel;
    ComboBoxMethod: TComboBox;
    ButtonClear: TButton;
    ButtonGo: TButton;
    EditInput: TEdit;
    MemoOutput: TMemo;
    VertScrollBox1: TVertScrollBox;
    MainLayout1: TLayout;
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonGoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject; KeyboardVisible: Boolean;
      const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject; KeyboardVisible: Boolean;
      const Bounds: TRect);
    procedure FormFocusChanged(Sender: TObject);
  private
    { Private declarations }
    FKBBounds: TRectF;
    FNeedOffset: Boolean;
    procedure CalcContentBoundsProc(Sender: TObject; var ContentBounds: TRectF);
    procedure RestorePosition;
    procedure UpdateKBBounds;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.Windows.fmx MSWINDOWS}

uses uTextConverter, System.Math;

procedure TFormMain.ButtonClearClick(Sender: TObject);
begin
  MemoOutput.Text := '';
  EditInput.Text := '';
end;

procedure TFormMain.ButtonGoClick(Sender: TObject);
  procedure TextConvert(ConvertMethod: Integer);
  begin
    case ConvertMethod of
      0:
        MemoOutput.Text := TTextConverter.MakeASCII(EditInput.Text);
      1:
        MemoOutput.Text := TTextConverter.MakeLatinCyrillic(EditInput.Text);
      2:
        MemoOutput.Text := TTextConverter.MakeANSIwin1252(EditInput.Text);
      3:
        MemoOutput.Text := TTextConverter.MakeUnicodePW(EditInput.Text);
      4:
        MemoOutput.Text := TTextConverter.MakeUnicodeW7Best(EditInput.Text);
      5:
        MemoOutput.Text := TTextConverter.MakeUnicodeW7(EditInput.Text);
      6:
        MemoOutput.Text := TTextConverter.MakeUnicodeWXP(EditInput.Text);
      7:
        MemoOutput.Text := TTextConverter.MakeInverted(EditInput.Text);
      8:
        MemoOutput.Text := TTextConverter.AddInvisibleNoise1(EditInput.Text);
      9:
        MemoOutput.Text := TTextConverter.AddInvisibleNoise2(EditInput.Text);
      10:
        MemoOutput.Text := TTextConverter.MakeOldStyle(EditInput.Text);
      11:
        MemoOutput.Text := TTextConverter.MakeSupscript(EditInput.Text);
      12:
        MemoOutput.Text := TTextConverter.MakeBeznogim(EditInput.Text);
      13:
        MemoOutput.Text := TTextConverter.MakeBackwards(EditInput.Text);
      14:
        MemoOutput.Text := TTextConverter.Decode(EditInput.Text);
    end;
  end;

begin
  TextConvert(ComboBoxMethod.ItemIndex);
  MemoOutput.SelectAll;
  MemoOutput.CopyToClipboard;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  VertScrollBox1.OnCalcContentBounds := CalcContentBoundsProc;
end;

procedure TFormMain.CalcContentBoundsProc(Sender: TObject; var ContentBounds: TRectF);
begin
  if FNeedOffset and (FKBBounds.Top > 0) then
  begin
    ContentBounds.Bottom := Max(ContentBounds.Bottom, 2 * ClientHeight - FKBBounds.Top);
  end;
end;

procedure TFormMain.RestorePosition;
begin
  VertScrollBox1.ViewportPosition := PointF(VertScrollBox1.ViewportPosition.X, 0);
  MainLayout1.Align := TAlignLayout.Client;
  VertScrollBox1.RealignContent;
end;

procedure TFormMain.UpdateKBBounds;
var
  LFocused: TControl;
  LFocusRect: TRectF;
begin
  FNeedOffset := False;
  if Assigned(Focused) then
  begin
    LFocused := TControl(Focused.GetObject);
    LFocusRect := LFocused.AbsoluteRect;
    LFocusRect.Offset(VertScrollBox1.ViewportPosition);
    if (LFocusRect.IntersectsWith(TRectF.Create(FKBBounds))) and (LFocusRect.Bottom > FKBBounds.Top)
    then
    begin
      FNeedOffset := True;
      MainLayout1.Align := TAlignLayout.Horizontal;
      VertScrollBox1.RealignContent;
      Application.ProcessMessages;
      VertScrollBox1.ViewportPosition := PointF(VertScrollBox1.ViewportPosition.X,
        LFocusRect.Bottom - FKBBounds.Top);
    end;
  end;
  if not FNeedOffset then
    RestorePosition;
end;

procedure TFormMain.FormFocusChanged(Sender: TObject);
begin
  UpdateKBBounds;
end;

procedure TFormMain.FormVirtualKeyboardHidden(Sender: TObject; KeyboardVisible: Boolean;
  const Bounds: TRect);
begin
  FKBBounds.Create(0, 0, 0, 0);
  FNeedOffset := False;
  RestorePosition;
end;

procedure TFormMain.FormVirtualKeyboardShown(Sender: TObject; KeyboardVisible: Boolean;
  const Bounds: TRect);
begin
  FKBBounds := TRectF.Create(Bounds);
  FKBBounds.TopLeft := ScreenToClient(FKBBounds.TopLeft);
  FKBBounds.BottomRight := ScreenToClient(FKBBounds.BottomRight);
  UpdateKBBounds;
end;

end.
