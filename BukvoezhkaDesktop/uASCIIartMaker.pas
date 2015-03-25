unit uASCIIartMaker;

// Автор оригинального алгоритма преобразования картинки в текст - fabiin
// (2003, http://codes-sources.commentcamarche.net/source/12384-ascii-t-petit-soft-d-ascii-art)

interface

uses Windows, Graphics, Classes;

type
  TCharDensity = record // тип символа по цветовому тону
    FChar: Char; // символ
    FDensity: integer; // тон
  end;

type
  TASCIIartMaker = class(TComponent)
  private
  var
    Densite: array of TCharDensity; // Массив символов со значениями их яркости
    procedure QuickSort(iLo, iHi: integer);
    function MakeASCIIfromBitmap(SrcBitmap: TBitmap; DonorFont: string = 'Lucida Console';
      contrast: integer = 255; zoom: integer = 0; IsNegative: boolean = false;
      CharacterSet: Byte = 0): string;
  public
    // contrast 247-255
    function MakeASCIIfromText(SrcText: string; DonorFont: string = 'Lucida Console';
      contrast: integer = 255; zoom: integer = 0; IsNegative: boolean = false; CharacterSet: Byte = 0;
      RenderFontSize: integer = 100): string;
  end;

implementation

uses SysUtils;

procedure TASCIIartMaker.QuickSort(iLo, iHi: integer);
var
  Lo, Hi: integer;
  Mid: single;
  T: TCharDensity;
begin
  Lo := iLo;
  Hi := iHi;
  if (Hi + Lo) <= 0 then
    exit;
  Mid := Densite[(Hi + Lo) div 2].FDensity;
  repeat
    while Densite[Lo].FDensity < Mid do
      Inc(Lo);
    while Densite[Hi].FDensity > Mid do
      Dec(Hi);
    if Lo <= Hi then
    begin
      // VisualSwap(A[Lo], A[Hi], Lo, Hi);
      T := Densite[Lo];
      Densite[Lo] := Densite[Hi];
      Densite[Hi] := T;
      Inc(Lo);
      Dec(Hi);
    end;
  until Lo > Hi;
  if Hi > iLo then
    QuickSort(iLo, Hi);
  if Lo < iHi then
    QuickSort(Lo, iHi);
  // if Terminated then Exit;
end;

function TASCIIartMaker.MakeASCIIfromBitmap(SrcBitmap: TBitmap;
  DonorFont: string = 'Lucida Console'; contrast: integer = 255; zoom: integer = 0;
  IsNegative: boolean = false; CharacterSet: Byte = 0): string;

  procedure FaireTblDensite; // Создаем таблицу Плотности
  var
    a, b, c: integer;
    TmpB: TBitmap;
    charactersArr: array of Char;
    startChar: integer;
  begin
    TmpB := TBitmap.Create; // Создать временный растр
    TmpB.Height := 50;
    TmpB.Width := 50;
    TmpB.Canvas.Brush.Color := clwhite;
    TmpB.Canvas.Pen.Color := clwhite;
    TmpB.Canvas.Font.Color := clblack;
    TmpB.Canvas.Font.Name := DonorFont;
    charactersArr := [];
    // Подбираем набор символов, которыми будем рисовать
    case CharacterSet of
      1:
        // Кириллица 0400—04FF
        begin
          charactersArr := ['@', '#', '*', '+', ':', '.', ',', ' '];
          startChar := 1040;
          SetLength(Densite, 63 + Length(charactersArr));
        end;
      2:
        // Китайский/Унифицированные иероглифы ККЯ 4E00—9FCC
        begin
          charactersArr := ['@', '#', '*', '+', ':', '.', ',', ' ']; // EM пробел
          startChar := 19968;
          SetLength(Densite, 1039 + Length(charactersArr));
        end;
      3:
        // Китайский/Унифицированные иероглифы ККЯ 4E00—9FCC
        begin
          charactersArr := ['@', '#', '*', '+', ':', '.', ','];
          startChar := 19968;
          SetLength(Densite, 1039 + Length(charactersArr));
        end;
      4:
        // Символы заполнения/Block Elements 2580—259F
        begin
          charactersArr := ['░', '▒', '▓', '█'];
          startChar := -1;
          SetLength(Densite, Length(charactersArr));
        end;
      5:
        // Символы заполнения/Block Elements 2580—259F
        begin
          charactersArr := ['░', '█'];
          startChar := -1;
          SetLength(Densite, Length(charactersArr));
        end;
      6:
        // Символы заполнения/Block Elements 2580—259F
        begin
          charactersArr := [' ', '█'];   // EM пробел
          startChar := -1;
          SetLength(Densite, Length(charactersArr));
        end;
    else
      // Каноничный ASCII арт 32-126
      begin
        charactersArr := [];
        startChar := 32;
        SetLength(Densite, 94);
      end;
    end;
    // Дозаполняем charactersArr
    if (startChar > 0) and (Length(Densite) > Length(charactersArr)) then
      for c := startChar to startChar + (Length(Densite) - Length(charactersArr)) do
        charactersArr := charactersArr + [chr(c)];
    // Составляем массив символов
    for c := low(Densite) to high(Densite) do
    begin
      Densite[c - low(Densite)].FChar := charactersArr[c]; // записываем символ в массив "шрифта"
      Densite[c - low(Densite)].FDensity := 0;
      // рисуем символ
      TmpB.Canvas.Rectangle(0, 0, TmpB.Width, TmpB.Height);
      TmpB.Canvas.TextOut(0, 0, charactersArr[c]);
      // баланс белого (?)
      for a := 1 to 20 do
      begin
        for b := 1 to 20 do
        begin
          if TmpB.Canvas.Pixels[a, b] = clwhite then
            Densite[c - low(Densite)].FDensity := Densite[c - low(Densite)].FDensity + 1;
        end;
      end;
    end;
    //
    FreeAndNil(TmpB);
    QuickSort(low(Densite), high(Densite));
  end;

var
  a, b, c, D: integer;
  MoyR, MoyG, MoyB, MoyCol: integer; // для средних тонов
  Couleur: LongInt;
  TmpB: TBitmap; // рабочий битмап
  TmpRec: TRect;
  TmpStr: string;

begin
  Result := '';
  FaireTblDensite;
  // копируем изображение
  TmpB := TBitmap.Create;
  if zoom in [0, 1] then
  begin // обычный размер
    TmpB.Height := SrcBitmap.Height;
    TmpB.Width := SrcBitmap.Width;
    TmpB.pixelformat := pf24bit;
    TmpB.Canvas.Draw(0, 0, SrcBitmap);
  end
  else
  begin // увеличение
    TmpRec.Left := 0;
    TmpRec.Top := 0;
    TmpRec.Right := SrcBitmap.Width * zoom;
    TmpRec.Bottom := SrcBitmap.Height * zoom;

    TmpB.Height := SrcBitmap.Height * zoom;
    TmpB.Width := SrcBitmap.Width * zoom;
    TmpB.pixelformat := pf24bit;
    TmpB.Canvas.StretchDraw(TmpRec, SrcBitmap);
  end;

  TmpStr := '';

  b := 0; // область изображения 8 * 16 точек
  while b < TmpB.Height - 16 - 1 do
  begin
    a := 0;
    while a < TmpB.Width - 8 - 1 do
    begin
      MoyCol := 0;
      MoyR := 0;
      MoyG := 0;
      MoyB := 0;
      // Найти средний цвет области
      c := a;
      while (c <= a + 8) and (c < TmpB.Width) do
      begin // покрыть площадь поверхности 8 * 16
        D := b;
        while (D <= b + 16) and (D < TmpB.Height) do
        begin
          Couleur := ColorToRGB(TmpB.Canvas.Pixels[c, D]);
          MoyR := MoyR + GetRValue(Couleur);
          MoyG := MoyG + GetGValue(Couleur);
          MoyB := MoyB + GetBValue(Couleur);
          Inc(D, 1);
        end;
        Inc(c, 1);
      end;

      MoyR := MoyR div 152;
      MoyG := MoyG div 152;
      MoyB := MoyB div 152;

      // Применить контрастность / яркость
      MoyR := round(MoyR * (1 + (128 - 128) / 100));
      MoyG := round(MoyG * (1 + (128 - 128) / 100));
      MoyB := round(MoyB * (1 + (128 - 128) / 100));

      MoyR := round(MoyR + (contrast - 128) / 100 * (MoyR - 127));
      MoyG := round(MoyG + (contrast - 128) / 100 * (MoyG - 127));
      MoyB := round(MoyB + (contrast - 128) / 100 * (MoyB - 127));

      MoyCol := (MoyR + MoyG + MoyB) div 3; // интенсивность цвета
      if MoyCol > 255 then
        MoyCol := 255;
      if MoyCol < 0 then
        MoyCol := 0;
      // Негатив (инвертировать цвета):
      if IsNegative then
        MoyCol := 255 - MoyCol;

      // Вычислить конечную плотность (отношение 255 к 95)
      MoyCol := round(MoyCol * ((Length(Densite) - 1) / 255));

      TmpStr := TmpStr + Densite[MoyCol].FChar; // добавить следующий символ (?)

      Inc(a, 8);
    end;
    TmpStr := TmpStr + sLineBreak; // перевод строки
    Inc(b, 16);
  end;
  // fin
  FreeAndNil(TmpB);
  Result := TmpStr;
end;

function TASCIIartMaker.MakeASCIIfromText(SrcText: string; DonorFont: string = 'Lucida Console';
  contrast: integer = 255; zoom: integer = 0; IsNegative: boolean = false; CharacterSet: Byte = 0;
  RenderFontSize: integer = 100): string;
var
  TmpBitmap: TBitmap;
  wh: TSize;
  TmpRect: TRect; // для DrawText
  Strs: TStrings;
  i, TmpWidth: integer;
begin
  Result := '';
  if SrcText.Length > 0 then
  begin
    TmpBitmap := TBitmap.Create;
    Strs := TStringList.Create;
    // Задаём параметры шрифта
    TmpBitmap.Canvas.Font.Style := [fsBold];
    TmpBitmap.Canvas.Font.Size := RenderFontSize;
    TmpBitmap.Canvas.Font.Name := DonorFont;
    TmpBitmap.Canvas.Brush.Style := bsSolid;
    // Задаём размер надписи
    // wh := TmpBitmap.Canvas.TextExtent(SrcText); // рассчитываем ширину однострочного текста
    ExtractStrings([], [], PChar(SrcText), Strs);
    wh.Width := 0;
    // ширина битмапа будет равна ширине самой широкой строки
    for i := 0 to Strs.Count - 1 do
    begin
      TmpWidth := TmpBitmap.Canvas.TextWidth(Strs.Strings[i]);
      if wh.Width < TmpWidth then
        wh.Width := TmpWidth;
    end;
    //
    TmpBitmap.Width := wh.Width;
    TmpRect := TmpBitmap.Canvas.ClipRect;
    // теперь рассчитываем высоту выводимого текста
    wh.Height := DrawText(TmpBitmap.Canvas.Handle, PChar(SrcText), -1, TmpRect,
      DT_LEFT or DT_CALCRECT); // рассчитываем высоту текста (для многострочного вывода)
    TmpBitmap.Height := wh.Height;
    TmpBitmap.Canvas.FloodFill(0, 0, clwhite, fsSurface); // заливаем белым
    // Выводим текст на битмап
    // TmpBitmap.Canvas.TextRect(TmpBitmap.Canvas.ClipRect, 0, 0, SrcText); // всё в одну строку
    TmpRect := TmpBitmap.Canvas.ClipRect;
    DrawText(TmpBitmap.Canvas.Handle, PChar(SrcText), -1, TmpRect, DT_LEFT);
    // Делаем из неё ASCII art
    Result := MakeASCIIfromBitmap(TmpBitmap, DonorFont, contrast, zoom, IsNegative, CharacterSet);
    //
    FreeAndNil(Strs);
    FreeAndNil(TmpBitmap);
  end;
end;

end.
