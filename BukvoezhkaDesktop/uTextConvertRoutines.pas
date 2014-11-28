unit uTextConvertRoutines;

interface

uses uCharacterSets;

const
  ModeRandom: Byte   = 0;
  ModeFirst: Byte    = 1;
  ModeInverted: Byte = 2;

function TextConvert(InputTxt: string; SrcSet, DestSet: ArrArrStr; ConvertMode: Byte = 0): string;
function MakeTextNoise(InputTxt: string; Noise: ArrStr): string;

implementation

function UCharInSet(UChar: char; UCharArr: array of char): Boolean;
// Аналог CharInSet для юникода
var
  i: Integer;
begin
  Result := False;
  for i := low(UCharArr) to high(UCharArr) do
    if UCharArr[i] = UChar then
      Result := true;
end;

function TextConvert(InputTxt: string; SrcSet, DestSet: ArrArrStr; ConvertMode: Byte = 0): string;
// 2 уровня, например: (строчные+заглавные+пунктуация)->(варианты буквы а)
var
  i: Integer;
  BlacklistedCharsCount: Integer;

  function CanConvert(SrcSet, DestSet: ArrArrStr): Boolean;
  // проверки на корректность
  var
    i: Integer;
  begin
    Result := true;
    // Длина исходного и целевого наборов должна совпадать
    if (Length(SrcSet) = Length(DestSet)) and not(Length(SrcSet) = 0) then
    begin
      i := low(SrcSet);
      while (Result = true) and (i <= high(SrcSet)) do
      begin
        if ((Length(SrcSet[i]) = 0) or (Length(DestSet[i]) = 0)) then
          Result := False;
        Inc(i);
      end;
    end
    else
      Result := False;
  end;

  function CharConvert(SrcChar: char; SrcSet, DestSet: ArrArrStr; ConvertMode: Byte): string;
  // преобразовать один символ в другой (или в несколько других)
  var
    i, j: Integer;
    SuccessConvert: Boolean;
  begin
    Result := SrcChar;
    SuccessConvert := False;
    //
    if not(UCharInSet(SrcChar, UntouchableChars)) then
    begin
      i := low(SrcSet);
      while (i <= high(SrcSet)) and not(SuccessConvert) do
      begin
        j := low(SrcSet[i]);
        while (j <= high(SrcSet[i])) and not(SuccessConvert) do
        begin
          if SrcChar = SrcSet[i][j] then
          begin
            if (ConvertMode = ModeRandom) or (ConvertMode = ModeInverted) then
              Result := DestSet[i][Random(Length(DestSet[i]))]
            else
              Result := DestSet[i][low(DestSet[i])];
            SuccessConvert := true;
          end;
          Inc(j);
        end;
        Inc(i);
      end;
    end;
  end;

begin
  if not(Length(InputTxt) = 0) then
    if CanConvert(SrcSet, DestSet) then
    begin
      Randomize;
      Result := '';
      BlacklistedCharsCount := 0;
      for i := low(InputTxt) to high(InputTxt) do
      begin
        if (ConvertMode = ModeInverted) then
          if not(UCharInSet(InputTxt[i], UntouchableChars)) then
          begin
            Result := CharConvert(InputTxt[i], SrcSet, DestSet, ConvertMode) + Result;
            BlacklistedCharsCount := 0;
          end
          else
          begin
            Insert(CharConvert(InputTxt[i], SrcSet, DestSet, ConvertMode), Result,
              low(Result) + BlacklistedCharsCount);
            Inc(BlacklistedCharsCount);
          end
        else
          Result := Result + CharConvert(InputTxt[i], SrcSet, DestSet, ConvertMode);
      end;
    end
    else
      Result := 'Ошибка: наборы не совпадают по размеру или содержат пустые массивы'
  else
    Result := '';
end;

function MakeTextNoise(InputTxt: string; Noise: ArrStr): string;
// Добавить "шум" (мусор, подчёркивания) в текст
var
  i: Integer;
begin
  if not(Length(InputTxt) = 0) then
  begin
    Randomize;
    Result := Noise[Random(Length(Noise))];
    for i := low(InputTxt) to high(InputTxt) do
    begin
      if not(UCharInSet(InputTxt[i], UntouchableChars)) then
        Result := Result + InputTxt[i] + Noise[Random(Length(Noise))]
      else
        Result := Result + InputTxt[i];
    end;
  end
  else
    Result := '';
end;

end.
