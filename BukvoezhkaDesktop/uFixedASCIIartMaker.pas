unit uFixedASCIIartMaker;

interface

uses uConstCharArrays;

type
  TFixedASCIIdecorator = class
  private
    class function MakeFixedASCIIfromText(InputTxt: string;
      SrcSet, DestASCIIFontSet: ArrArrStr): string;
  public
    class function MakeFixedASCIIFirstFont(Src: string; IsNegative: boolean = false): string;
    class function MakeFixedASCII2chToolsFont(Src: string; IsNegative: boolean = false): string;
  end;

implementation

uses System.RegularExpressions, uConstASCIIartFonts;

class function TFixedASCIIdecorator.MakeFixedASCIIfromText(InputTxt: string;
  SrcSet, DestASCIIFontSet: ArrArrStr): string;
// 2 уровня, например: (строчные+заглавные+пунктуация)->(варианты буквы а)
var
  i, j, k, l: Integer;
  SplittedInputTxt: TArray<string>;
  OneConvertedStrTmp: ArrArrStr;
  TmpArrStr: ArrStr;

  function CanConvert(SrcSet, DestASCIIFontSet: ArrArrStr): boolean;
  // проверки на корректность
  var
    i, j: Integer;
  begin
    Result := true;
    // Длина исходного и целевого наборов должна совпадать
    if (Length(SrcSet) = Length(DestASCIIFontSet)) and not(Length(SrcSet) = 0) then
    begin
      i := low(SrcSet);
      while (Result = true) and (i <= high(SrcSet)) do
      begin
        if ((Length(SrcSet[i]) = 0) or (Length(DestASCIIFontSet[i]) = 0)) then
          Result := false
        else
        begin
          if not(Length(DestASCIIFontSet[i]) = Length(DestASCIIFontSet[0])) then
            // все символы должны быть одинаковыми по высоте
            Result := false;
          for j := low(DestASCIIFontSet[i]) to high(DestASCIIFontSet[i]) do
            if not(Length(DestASCIIFontSet[i][j]) = Length(DestASCIIFontSet[i][0])) then
              // символ должен состоять из строк одинаковой длины
              Result := false;
        end;
        Inc(i);
      end;
    end
    else
      Result := false;
  end;

  function CharConvert(SrcChar: char; SrcSet, DestASCIIFontSet: ArrArrStr): ArrStr;
  // преобразовать один символ в символ, нарисованный в FixedASCIIfont
  var
    i, j: Integer;
    SuccessConvert: boolean;
  begin
    SuccessConvert := false;
    //
    Result := [];
    i := low(SrcSet);
    while (i <= high(SrcSet)) and not(SuccessConvert) do
    begin
      j := low(SrcSet[i]);
      while (j <= high(SrcSet[i])) and not(SuccessConvert) do
      begin
        if SrcChar = SrcSet[i][j] then
        begin
          Result := DestASCIIFontSet[i];
          SuccessConvert := true;
        end;
        Inc(j);
      end;
      Inc(i);
    end;
  end;

begin
  if not(Length(InputTxt) = 0) then
    if CanConvert(SrcSet, DestASCIIFontSet) then
    begin
      Result := '';
      SplittedInputTxt := TRegEx.Split(InputTxt, sLineBreak, [roIgnoreCase, roSingleLine]);
      for i := low(SplittedInputTxt) to high(SplittedInputTxt) do
      begin
        if Length(SplittedInputTxt[i]) > 0 then
        begin
          OneConvertedStrTmp := [];
          for j := low(SplittedInputTxt[i]) to high(SplittedInputTxt[i]) do
          begin
            TmpArrStr := CharConvert(SplittedInputTxt[i][j], SrcSet, DestASCIIFontSet);
            if not(Length(TmpArrStr) = 0) then
              OneConvertedStrTmp := OneConvertedStrTmp + [TmpArrStr];
          end;
          for k := low(DestASCIIFontSet[0]) to high(DestASCIIFontSet[0]) do
          begin
            for l := low(OneConvertedStrTmp) to high(OneConvertedStrTmp) do
              Result := Result + OneConvertedStrTmp[l][k];
            Result := Result + sLineBreak;
          end;
        end;
      end;
    end
    else
      Result := 'Ошибка: наборы не совпадают по размеру или содержат пустые массивы'
  else
    Result := '';
end;

function InvertSet(ASet: ArrArrStr): ArrArrStr;
var
  i, j, k: Integer;
begin
  Result := ASet;
  for i := low(Result) to high(Result) do
    for j := low(Result[i]) to high(Result[i]) do
      for k := low(Result[i][j]) to high(Result[i][j]) do
        if Result[i][j][k] = '░' then
          Result[i][j][k] := '█'
        else
          if Result[i][j][k] = '█' then
            Result[i][j][k] := '░';
end;

class function TFixedASCIIdecorator.MakeFixedASCIIFirstFont(Src: string;
  IsNegative: boolean = false): string;
begin
  if IsNegative then
  begin
    Result := MakeFixedASCIIfromText(Src, RU_Standard_Big + RU_Standard_Small + EN_Standard_Big +
      EN_Standard_Small + Standard_Numbers + Standard_Punctuation + [[' ']],
      InvertSet(C_First_Font_RU + C_First_Font_RU + C_First_Font_EN + C_First_Font_EN +
      C_First_Font_Numbers + C_First_Font_Punctuation + C_First_Font_WhiteSpace));
  end
  else
    Result := MakeFixedASCIIfromText(Src, RU_Standard_Big + RU_Standard_Small + EN_Standard_Big +
      EN_Standard_Small + Standard_Numbers + Standard_Punctuation + [[' ']],
      C_First_Font_RU + C_First_Font_RU + C_First_Font_EN + C_First_Font_EN + C_First_Font_Numbers +
      C_First_Font_Punctuation + C_First_Font_WhiteSpace);
end;

class function TFixedASCIIdecorator.MakeFixedASCII2chToolsFont(Src: string;
  IsNegative: boolean = false): string;
begin
  if IsNegative then
  begin
    Result := MakeFixedASCIIfromText(Src, RU_Standard_Big + RU_Standard_Small + EN_Standard_Big +
      EN_Standard_Small + Standard_Numbers + Standard_Punctuation + [[' ']],
      InvertSet(C_2chtools_font_RU + C_2chtools_font_RU + C_2chtools_font_EN + C_2chtools_font_EN +
      C_2chtools_font_Numbers + C_2chtools_font_Punctuation + C_2chtools_font_WhiteSpace));
  end
  else
    Result := MakeFixedASCIIfromText(Src, RU_Standard_Big + RU_Standard_Small + EN_Standard_Big +
      EN_Standard_Small + Standard_Numbers + Standard_Punctuation + [[' ']],
      C_2chtools_font_RU + C_2chtools_font_RU + C_2chtools_font_EN + C_2chtools_font_EN +
      C_2chtools_font_Numbers + C_2chtools_font_Punctuation + C_2chtools_font_WhiteSpace);
end;

end.
