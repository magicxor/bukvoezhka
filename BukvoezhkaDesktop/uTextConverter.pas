unit uTextConverter;

interface

type
  TTextConverter = class
  public
    class function Decode(Src: string): string;
    class function MakeASCII(Src: string): string;
    class function MakeANSIwin1252(Src: string): string;
    class function MakeLatinCyrillic(Src: string): string;
    class function MakeInverted(Src: string): string;
    class function AddInvisibleNoise1(Src: string): string;
    class function AddInvisibleNoise2(Src: string): string;
    class function AddStrikethrough1(Src: string): string;
    class function AddStrikethrough2(Src: string): string;
    class function AddUnderlines1(Src: string): string;
    class function AddUnderlines2(Src: string): string;
    class function AddUnderlines3(Src: string): string;
    class function AddDoubleUnderlines1(Src: string): string;
    class function AddDoubleUnderlines2(Src: string): string;
    class function AddOverlines1(Src: string): string;
    class function AddOverlines2(Src: string): string;
    class function MakeSupscript(Src: string): string;
    class function MakeOldStyle(Src: string): string;
    class function MakeBeznogim(Src: string): string;
    class function MakeUnicodePW(Src: string): string;
    class function MakeUnicodeW7Best(Src: string): string;
    class function MakeUnicodeW7(Src: string): string;
    class function MakeUnicodeWXP(Src: string): string;
    class function MakeBackwards(Src: string): string;
  end;

implementation

uses uTextConvertRoutines, uConstCharArrays;

class function TTextConverter.Decode(Src: string): string;
begin
  Result := TextConvert(Src, RU_Inverted_Big + RU_OldStyle_Big + RU_Unicode_Big + RU_Inverted_Small
    + RU_OldStyle_Small + RU_Unicode_Small + RU_Supscript + EN_Inverted_Big + EN_OldStyle_Big +
    EN_Unicode_Big + EN_Inverted_Small + EN_OldStyle_Small + EN_Unicode_Small + EN_Supscript +
    Inverted_Punctuation + Unicode_Punctuation + Supscript_Punctuation + Inverted_Numbers +
    Unicode_Numbers + Supscript_Numbers,

    RU_Standard_Big + RU_Standard_Big + RU_Standard_Big + RU_Standard_Small + RU_Standard_Small +
    RU_Standard_Small + RU_Standard_Small + EN_Standard_Big + EN_Standard_Big + EN_Standard_Big +
    EN_Standard_Small + EN_Standard_Small + EN_Standard_Small + EN_Standard_Small +
    Standard_Punctuation + Standard_Punctuation + Standard_Punctuation + Standard_Numbers +
    Standard_Numbers + Standard_Numbers);
end;

class function TTextConverter.MakeASCII(Src: string): string;
begin
  Result := TextConvert(Src, RU_Standard_Big + RU_Standard_Small,
    RU_Latin_127_ASCII_Big + RU_Latin_127_ASCII_Small);
end;

class function TTextConverter.MakeANSIwin1252(Src: string): string;
begin
  Result := TextConvert(Src, RU_Standard_Big + RU_Standard_Small,
    RU_Latin_255_ANSI_Big + RU_Latin_255_ANSI_Small);
end;

class function TTextConverter.MakeLatinCyrillic(Src: string): string;
begin
  Result := TextConvert(Src, RU_Standard_Big + RU_Standard_Small + EN_Standard_Big +
    EN_Standard_Small, RU_LatinCyrillic_Big + RU_LatinCyrillic_Small + EN_LatinCyrillic_Big +
    EN_LatinCyrillic_Small);
end;

class function TTextConverter.MakeInverted(Src: string): string;
begin
  Result := TextConvert(Src, RU_Standard_Big + RU_Standard_Small + EN_Standard_Big +
    EN_Standard_Small + Standard_Numbers + Standard_Punctuation, RU_Inverted_Big + RU_Inverted_Small
    + EN_Inverted_Big + EN_Inverted_Small + Inverted_Numbers + Inverted_Punctuation, ModeInverted);
end;

class function TTextConverter.AddInvisibleNoise1(Src: string): string;
begin
  Result := MakeTextNoise(Src, InvisibleV1);
end;

class function TTextConverter.AddInvisibleNoise2(Src: string): string;
begin
  Result := MakeTextNoise(Src, InvisibleV2);
end;

class function TTextConverter.AddStrikethrough1(Src: string): string;
begin
  Result := MakeTextNoise(Src, Strikethrough1);
end;

class function TTextConverter.AddStrikethrough2(Src: string): string;
begin
  Result := MakeTextNoise(Src, Strikethrough2);
end;

class function TTextConverter.AddUnderlines1(Src: string): string;
begin
  Result := MakeTextNoise(Src, Underlines1);
end;

class function TTextConverter.AddUnderlines2(Src: string): string;
begin
  Result := MakeTextNoise(Src, Underlines2);
end;

class function TTextConverter.AddUnderlines3(Src: string): string;
begin
  Result := MakeTextNoise(Src, Underlines3);
end;

class function TTextConverter.AddDoubleUnderlines1(Src: string): string;
begin
  Result := MakeTextNoise(Src, DoubleUnderlines1);
end;

class function TTextConverter.AddDoubleUnderlines2(Src: string): string;
begin
  Result := MakeTextNoise(Src, DoubleUnderlines2);
end;

class function TTextConverter.AddOverlines1(Src: string): string;
begin
  Result := MakeTextNoise(Src, Overlines1);
end;

class function TTextConverter.AddOverlines2(Src: string): string;
begin
  Result := MakeTextNoise(Src, Overlines2);
end;

class function TTextConverter.MakeSupscript(Src: string): string;
begin
  Result := TextConvert(Src, RU_Standard_Big + RU_Standard_Small + EN_Standard_Big +
    EN_Standard_Small + Standard_Numbers + Standard_Punctuation, RU_Supscript + RU_Supscript +
    EN_Supscript + EN_Supscript + Supscript_Numbers + Supscript_Punctuation);
end;

class function TTextConverter.MakeOldStyle(Src: string): string;
begin
  Result := TextConvert(Src, RU_Standard_Big + RU_Standard_Small + EN_Standard_Big +
    EN_Standard_Small, RU_OldStyle_Big + RU_OldStyle_Small + EN_OldStyle_Big + EN_OldStyle_Small);
end;

class function TTextConverter.MakeBeznogim(Src: string): string;
begin
  Result := TextConvert(Src, RU_Standard_Big + RU_Standard_Small,
    RU_Beznogim_Big + RU_Beznogim_Big);
end;

class function TTextConverter.MakeUnicodePW(Src: string): string;
begin
  Result := TextConvert(Src, RU_Standard_Big + RU_Standard_Small,
    RU_Unicode_PW_Big + RU_Unicode_PW_Small);
end;

class function TTextConverter.MakeUnicodeW7Best(Src: string): string;
begin
  Result := TextConvert(Src, RU_Standard_Big + RU_Standard_Small + EN_Standard_Big +
    EN_Standard_Small + Standard_Numbers + Standard_Punctuation, RU_Unicode_Big + RU_Unicode_Small +
    EN_Unicode_Big + EN_Unicode_Small + Unicode_Numbers + Unicode_Punctuation, ModeFirst);
end;

class function TTextConverter.MakeUnicodeW7(Src: string): string;
begin
  Result := TextConvert(Src, RU_Standard_Big + RU_Standard_Small + EN_Standard_Big +
    EN_Standard_Small + Standard_Numbers + Standard_Punctuation, RU_Unicode_Big + RU_Unicode_Small +
    EN_Unicode_Big + EN_Unicode_Small + Unicode_Numbers + Unicode_Punctuation);
end;

class function TTextConverter.MakeUnicodeWXP(Src: string): string;
begin
  Result := TextConvert(Src, RU_Standard_Big + RU_Standard_Small + EN_Standard_Big +
    EN_Standard_Small + Standard_Punctuation, RU_Unicode_XP_Big + RU_Unicode_XP_Small +
    EN_Unicode_XP_Big + EN_Unicode_XP_Small + Unicode_XP_Punctuation);
end;

class function TTextConverter.MakeBackwards(Src: string): string;
begin
  Result := TextConvert(Src, [['('], [')'], ['['], [']'], ['{'], ['}'], ['<'], ['>']],
    [[')'], ['('], [']'], ['['], ['}'], ['{'], ['>'], ['<']], ModeInverted);
end;

end.
