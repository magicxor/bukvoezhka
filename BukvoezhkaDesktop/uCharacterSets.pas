﻿unit uCharacterSets;

interface

uses SysUtils;

type
  ArrArrStr = array of array of string;
  ArrStr = array of string;

var
  // ========================================= СТАНДАРТ ============================================
  // Русский
  RU_Standard_Big: ArrArrStr = [['А'], ['Б'], ['В'], ['Г'], ['Д'], ['Е'], ['Ё'], ['Ж'], ['З'],
    ['И'], ['Й'], ['К'], ['Л'], ['М'], ['Н'], ['О'], ['П'], ['Р'], ['С'], ['Т'], ['У'], ['Ф'],
    ['Х'], ['Ц'], ['Ч'], ['Ш'], ['Щ'], ['Ъ'], ['Ы'], ['Ь'], ['Э'], ['Ю'], ['Я']];

  RU_Standard_Small: ArrArrStr = [['а'], ['б'], ['в'], ['г'], ['д'], ['е'], ['ё'], ['ж'], ['з'],
    ['и'], ['й'], ['к'], ['л'], ['м'], ['н'], ['о'], ['п'], ['р'], ['с'], ['т'], ['у'], ['ф'],
    ['х'], ['ц'], ['ч'], ['ш'], ['щ'], ['ъ'], ['ы'], ['ь'], ['э'], ['ю'], ['я']];

  // Английский
  EN_Standard_Big: ArrArrStr = [['A'], ['B'], ['C'], ['D'], ['E'], ['F'], ['G'], ['H'], ['I'],
    ['J'], ['K'], ['L'], ['M'], ['N'], ['O'], ['P'], ['Q'], ['R'], ['S'], ['T'], ['U'], ['V'],
    ['W'], ['X'], ['Y'], ['Z']];

  EN_Standard_Small: ArrArrStr = [['a'], ['b'], ['c'], ['d'], ['e'], ['f'], ['g'], ['h'], ['i'],
    ['j'], ['k'], ['l'], ['m'], ['n'], ['o'], ['p'], ['q'], ['r'], ['s'], ['t'], ['u'], ['v'],
    ['w'], ['x'], ['y'], ['z']];

  // Пунктуация
  Standard_Punctuation: ArrArrStr = [['.'], ['!'], ['?'], ['"'], [''''], [','], ['*'], ['…'], ['⁇'],
    ['⁈'], ['⁉'], ['‼'], ['('], [')'], ['['], [']'], ['{'], ['}'], ['-'], ['–'], ['<'],
    ['>'], [':']];

  // Числа
  Standard_Numbers: ArrArrStr = [['0'], ['1'], ['2'], ['3'], ['4'], ['5'], ['6'], ['7'],
    ['8'], ['9']];

  // ========================================= ASCII ===============================================
  // ASCII-совместимые
  RU_Latin_127_ASCII_Big: ArrArrStr = [['A'], ['6'], ['B'], ['r'], ['D'], ['E'], ['E'], ['}|{'],
    ['3'], ['U'], ['U'''], ['K'], ['/\'], ['M'], ['H'], ['O'], ['n'], ['P'], ['C'], ['T'], ['Y'],
    ['O|O'], ['X'], ['U,'], ['4'], ['W'], ['W,'], ['`b'], ['b|'], ['b'], ['-)'], ['|-0'], ['9']];

  RU_Latin_127_ASCII_Small: ArrArrStr = [['a'], ['6'], ['B'], ['r'], ['g'], ['e'], ['e'], ['}|{'],
    ['3'], ['u'], ['u'''], ['k'], ['/\'], ['M'], ['H'], ['o'], ['n'], ['p'], ['c'], ['T'], ['y'],
    ['o|o'], ['x'], ['u,'], ['4'], ['w'], ['w,'], ['`b'], ['b|'], ['b'], ['-)'], ['|-0'], ['9']];

  // ANSI - Win-1252-совместимые
  RU_Latin_255_ANSI_Big: ArrArrStr = [['A'], ['6'], ['B'], ['r'], ['D'], ['E'], ['Ë'], ['}|{'],
    ['3'], ['U'], ['Ú'], ['K'], ['/\'], ['M'], ['H'], ['O'], ['n'], ['P'], ['C'], ['T'], ['Y'],
    ['O|O'], ['X'], ['U,'], ['4'], ['W'], ['W,'], ['`b'], ['b|'], ['b'], ['-)'], ['|-0'], ['9']];

  RU_Latin_255_ANSI_Small: ArrArrStr = [['a'], ['6'], ['ß'], ['r'], ['g'], ['e'], ['ë'], ['}|{'],
    ['3'], ['u'], ['ú'], ['k'], ['/\'], ['m'], ['H'], ['o'], ['n'], ['p'], ['c'], ['T'], ['y'],
    ['o|o'], ['x'], ['u,'], ['4'], ['w'], ['w,'], ['`b'], ['b|'], ['b'], ['-)'], ['|-0'], ['9']];

  // ASCII + кириллица
  // По возможности русские буквы заменены латинскими аналогами макс. схожести и наоборот
  RU_LatinCyrillic_Big: ArrArrStr = [['A'], ['Б'], ['B'], ['Г'], ['Д'], ['E'], ['Ё'], ['Ж'], ['3'],
    ['И'], ['Й'], ['K'], ['Л'], ['M'], ['H'], ['O'], ['П'], ['P'], ['C'], ['T'], ['Y'], ['Ф'],
    ['X'], ['Ц'], ['Ч'], ['Ш'], ['Щ'], ['Ъ'], ['Ы'], ['Ь'], ['Э'], ['Ю'], ['Я']];

  RU_LatinCyrillic_Small: ArrArrStr = [['a'], ['б'], ['в'], ['г'], ['д'], ['e'], ['ё'], ['ж'],
    ['з'], ['и'], ['й'], ['k'], ['л'], ['м'], ['н'], ['o'], ['п'], ['p'], ['c'], ['т'], ['y'],
    ['ф'], ['x'], ['ц'], ['ч'], ['ш'], ['щ'], ['ъ'], ['ы'], ['ь'], ['э'], ['ю'], ['я']];

  EN_LatinCyrillic_Big: ArrArrStr = [['А'], ['В'], ['С'], ['D'], ['Е'], ['F'], ['G'], ['Н'], ['I'],
    ['J'], ['К'], ['L'], ['М'], ['N'], ['О'], ['Р'], ['Q'], ['R'], ['S'], ['Т'], ['U'], ['V'],
    ['W'], ['Х'], ['У'], ['Z']];

  EN_LatinCyrillic_Small: ArrArrStr = [['а'], ['ь'], ['с'], ['d'], ['е'], ['f'], ['g'], ['h'],
    ['i'], ['j'], ['к'], ['l'], ['m'], ['n'], ['о'], ['р'], ['q'], ['r'], ['s'], ['t'], ['u'],
    ['v'], ['w'], ['х'], ['у'], ['z']];

  // ======================================= Перевёрнутые ==========================================
  // Русский
  RU_Inverted_Big: ArrArrStr = [['∀'], ['ƍ'], ['ᙠ'], ['⅃'] { '⌋' } , ['ɓ'], ['Ǝ'], ['Ǝ'], ['Ж'],
    ['Ƹ'], ['И'], ['ņ'], ['ʞ'], ['v', 'Ꮩ'], ['W'], ['H'], ['O'], ['U'] { ⊔ } , ['Ԁ'], ['Ɔ'],
    [' ̱|̱'], ['⅄'], ['ȸ'], ['X'], ['ǹ'], ['Һ'], ['m'], ['''m'], ['q_'], ['ıq'], ['q'], ['є'],
    ['Ol'], ['ʁ']];

  RU_Inverted_Small: ArrArrStr = [['ɐ'], ['ƍ'], ['ʚ'], ['ɹ'], ['ɓ'], ['ǝ'], ['ǝ'], ['ж'], ['ε'],
    ['и'], ['ņ'], ['ʞ'], ['v'], ['w'], ['н'], ['о'], ['u'], ['d'], ['ɔ'], ['ɯ'], ['ʎ'], ['ȸ'],
    ['х'], ['ǹ'], ['Һ'], ['m'], ['''m'], ['q_'], ['ıq'], ['q'], ['є'], ['oı'], ['ʁ']];

  // Пунктуация
  Inverted_Punctuation: ArrArrStr = [['˙'], ['¡'], ['¿'], ['„'], ['‚'], ['‘'], ['⁎'], ['˙˙˙'],
    ['¿¿'], ['¡¿'], ['¿¡'], ['¡¡'], [')'], ['('], [']'], ['['], ['}'], ['{'], ['-'], ['–'], ['>'],
    ['<'], [':']];

  // Числа
  Inverted_Numbers: ArrArrStr = [['0'], ['Ɩ'] { ⇂ } , ['ᄅ'], ['Ɛ'], ['ㄣ'], ['ϛ'], ['9'], ['ㄥ'],
    ['8'], ['6']];

  // Английский
  EN_Inverted_Big: ArrArrStr = [['∀'], ['ᙠ'], ['Ɔ'], ['ᗡ'], ['Ǝ'], ['Ⅎ'], ['⅁'] { פ } , ['H'],
    ['I'], ['ſ'], ['ʞ'], ['⌉', '⏋'] { ˥ } , ['W'], ['N'], ['O'], ['Ԁ'], ['Ò'], ['ᴚ'], ['S'],
    ['⊥'] { ┴ } , ['⋂'] { ∩ } , ['Λ'], ['M'], ['X'], ['⅄'], ['Z']];

  EN_Inverted_Small: ArrArrStr = [['ɐ'], ['q'], ['ɔ'], ['p'], ['ǝ'], ['ɟ'], ['ƃ'], ['ɥ'], ['ᴉ'],
    ['ɾ'], ['ʞ'], ['ן'], ['ɯ'], ['u'], ['o'], ['d'], ['b'], ['ɹ'], ['s'], ['ʇ'], ['n'], ['ʌ'],
    ['ʍ'], ['x'], ['ʎ'], ['z']];

  // ========================================= ШУМ =================================================
  // Невидимые
  InvisibleV1: ArrStr = ['​', '‌', '‍'];
  InvisibleV2: ArrStr = ['‎‏', '‬', '⁡', '⁪', '⁫', '⁬', '⁬'];
  // Зачёркивание
  Strikethrough1: ArrStr = ['̶'];
  Strikethrough2: ArrStr = ['̵'];
  // Подчёркивание
  Underlines1: ArrStr = ['̱'];
  Underlines2: ArrStr = ['̲'];
  Underlines3: ArrStr = ['͟'];
  // Двойное подчёркивание
  DoubleUnderlines1: ArrStr = ['̳'];
  DoubleUnderlines2: ArrStr = ['͇'];
  // Надчёркивание
  Overlines1: ArrStr = ['̅'];
  Overlines2: ArrStr = ['͞'];
  // ===================================== НАДСТРОЧНЫЕ =============================================

  // Надстрочные
  RU_Supscript: ArrArrStr = [[' ⷶ'], [' ⷠ'], [' ⷡ'], [' ⷢ'], [' ⷣ'], [' ⷷ'], [' ⷷ'], [' ⷤ'], [' ⷥ'],
    [' ꙵ'], [' ꙵ'], [' ⷦ'], [' ⷧ'], [' ⷨ'], [' ⷩ'], [' ⷪ'], [' ⷫ'], [' ⷬ'], [' ⷭ'], [' ⷮ'], [' ꙷ'],
    ['  ⷴ'], [' ⷯ'], [' ⷰ'], [' ⷱ'], [' ⷲ'], [' ⷳ'], [' ꙸ'], [' ꙹ'], [' ꙺ'], [' ꙴ'],
    [' ⷻ'], [' ⷹ']];

  Supscript_Numbers: ArrArrStr = [['⁰'], ['¹'], ['²'], ['³'], ['⁴'], ['⁵'], ['⁶'], ['⁷'],
    ['⁸'], ['⁹']];

  Supscript_Punctuation: ArrArrStr = [['˙'], ['ꜝ'], ['ˀ'], ['"'], [''''], ['ʼ'], ['*'], ['…'],
    ['ˀˀ'], ['ˀꜝ'], ['ꜝˀ'], ['ꜝꜝ'], ['⁽'], ['⁾'], ['['], [']'], ['{'], ['}'], ['⁻'], ['⁻'],
    [' ᷾ '] { лишние пробелы для совместимости со шрифтами } , [' ͐'], ['˸']];

  EN_Supscript: ArrArrStr = [['ᵃ'], ['ᵇ'], ['ᶜ'], ['ᵈ'], ['ᵉ'], ['ᶠ'], ['ᵍ'], ['ʰ'], ['ⁱ'], ['ʲ'],
    ['ᵏ'], ['ˡ'], ['ᵐ'], ['ⁿ'], ['ᵒ'], ['ᵖ'], ['ˁ'], ['ʳ'], ['ˢ'], ['ᵗ'], ['ᵘ'], ['ᵛ'], ['ʷ'],
    ['ˣ'], ['ʸ'], ['ᶻ']];

  // ====================================== СТАРИННЫЙ ==============================================

  // Церковнославянский
  RU_OldStyle_Big: ArrArrStr = [['Ⲁ'], ['Ⳝ'], ['Ⲃ'], ['Ⲅ'], ['Ⲇ'], ['Ⲉ'], ['Ⲉ'], ['Ⲿ'], ['Ⲝ'],
    ['И'], ['Й'], ['Ⲕ'], ['Ⲗ'], ['Ⲙ'], ['Ⲏ'], ['Ⲟ'], ['Ⲡ'], ['Ⲣ'], ['Ⲥ'], ['Ⲧ'], ['Ⲩ'], ['Ⲫ'],
    ['Ⲭ'], ['Ⳙ'], ['ⴗ'], ['Ⱎ'], ['ⴓ'], ['ⴆ'], ['Ы'], ['Ⱃ'], ['Ⰵ'], ['Ю'], ['Я']];

  RU_OldStyle_Small: ArrArrStr = [['ⲁ'], ['ⳝ'], ['ⲃ'], ['ⲅ'], ['ⲇ'], ['ⲉ'], ['ⲉ'], ['ⲿ'], ['ⲝ'],
    ['и'], ['й'], ['ⲕ'], ['ⲗ'], ['ⲙ'], ['ⲏ'], ['ⲟ'], ['ⲡ'], ['ⲣ'], ['ⲥ'], ['ⲧ'], ['ⲩ'], ['ⲫ'],
    ['ⲭ'], ['ⳙ'], ['ⴗ'], ['ⱎ'], ['ⴓ'], ['ⴆ'], ['ы'], ['ⱃ'], ['ⰵ'], ['ю'], ['я']];

  // Готический английский
  EN_OldStyle_Big: ArrArrStr = [['𝕬'], ['𝕭'], ['𝕮'], ['𝕯'], ['𝕰'], ['𝕱'], ['𝕲'], ['𝕳'],
    ['𝕴'], ['𝕵'], ['𝕶'], ['𝕷'], ['𝕸'], ['𝕹'], ['𝕺'], ['𝕻'], ['𝕼'], ['𝕽'], ['𝕾'], ['𝕿'],
    ['𝖀'], ['𝖁'], ['𝖂'], ['𝖃'], ['𝖄'], ['𝖅']];

  EN_OldStyle_Small: ArrArrStr = [['𝖆'], ['𝖇'], ['𝖈'], ['𝖉'], ['𝖊'], ['𝖋'], ['𝖌'], ['𝖍'],
    ['𝖎'], ['𝖏'], ['𝖐'], ['𝖑'], ['𝖒'], ['𝖓'], ['𝖔'], ['𝖕'], ['𝖖'], ['𝖗'], ['𝖘'], ['𝖙'],
    ['𝖚'], ['𝖛'], ['𝖜'], ['𝖝'], ['𝖞'], ['𝖟']];

  // ===============================================================================================

  // Безногим
  RU_Beznogim_Big: ArrArrStr = [['А'], ['Б'], ['В'], ['Г'], ['Д'], ['3'], ['Ё'], ['Ж'], ['Z'],
    ['N'], ['И!'], ['K'], ['Л'], ['М'], ['Н'], ['0'], ['П'], ['Р'], ['С'], ['Т'], ['У'], ['Ф'],
    ['Х'], ['Ц'], ['Ч'], ['Ш'], ['Щ'], ['Ъ'], ['Ы'], ['b'], ['Э'], ['Ю'], ['R']];

  // ================================== ЮНИКОД WIN7+ ===============================================

  RU_Unicode_Big: ArrArrStr = [['Α', 'Å', 'ᗅ', 'À', 'Á', 'Â', 'Ã', 'Ä', 'Ā', 'Ă', 'Ą', 'Ǟ', 'Ǡ',
    'Ȁ', 'Ȃ', 'Ȧ', 'Ά', 'Ꭺ', 'Ḁ', 'Ạ', 'Ả', 'Ấ', 'Ầ', 'Ẩ', 'Ẫ', 'Ậ', 'Ắ', 'Ằ', 'Ẳ', 'Ẵ', 'Ặ'],
    ['ƃ', 'Ҕ', 'Ђ', 'Ƃ'], ['Ɓ', 'ß', 'Ḇ', 'Ḅ', 'Ḃ', 'ẞ', 'Β', 'Ƀ', 'ᛒ', 'ꕗ'],
    ['Ӷ', 'ᒥ', 'Ґ', 'Ѓ', 'ᒤ', 'ᒦ'], ['Δ', 'ᐃ', 'ꗇ'], ['Ε', 'Ê', 'Ḝ', 'Ḛ', 'Ḕ', 'Ḗ', 'Ѐ', 'É', 'Ē',
    'Ĕ', 'Ė', 'Ę', 'Ě', 'Έ', 'Σ', 'Ӗ', 'Ḙ', 'Ꭼ', 'Ẹ', 'Ẻ', 'Ẽ', 'Ế', 'Ề', 'Ể', 'Ễ', 'Ệ', 'ꗋ'],
    ['Ë', 'Ȅ'], ['Җ', 'Ӂ', 'Ѫ', 'Ӝ'], ['3', 'Ȝ', 'Ʒ', 'Ҙ', 'Ӟ', 'Ӡ', 'Ǯ', 'Յ'], ['Ӥ'],
    ['Ҋ', 'Ӣ', 'Ѝ'], ['Қ', 'Ꮶ', 'Ƙ', 'Ҡ', 'Ҟ', 'Ķ', 'Ҝ', 'Κ', 'Ќ', 'Ḱ', 'Ḳ', 'Ḵ', 'Ⱪ'],
    ['Ʌ', 'Λ', 'Ӆ', 'Ԉ', 'Ԓ'], ['Μ', 'Ӎ', 'Ϻ', 'Ḿ'], ['Ӊ', 'Ң', 'Ĥ', 'Ȟ', 'Ή', 'Η', 'Ӈ', 'Ԋ', 'Ḣ',
    'Ḥ', 'Ḧ', 'Ḩ', 'Ḫ', 'Ἠ', 'Ἡ', 'Ἢ', 'Ἣ', 'Ἤ', 'Ἥ', 'Ἦ', 'Ἧ', 'ᾘ', 'ᾙ', 'ᾚ', 'ᾛ', 'ᾜ', 'ᾝ', 'ᾞ',
    'ᾟ', 'Ὴ', 'Ή', 'ῌ', 'Ⱨ'], ['Ο', 'Ӧ', 'Ѻ', 'Ō', 'Ŏ', 'Ő', 'Ò', 'Ó', 'Ô', 'Õ', 'Ö', 'Ǫ', 'Ǭ', 'Ơ',
    'Ǒ', 'Ȫ', 'Ȭ', 'Ȯ', 'Ȱ', 'Ό', 'Ồ', 'Ổ', 'Ỗ', 'Ộ', 'Ớ', 'Ờ', 'Ở', 'Ỡ', 'Ợ', 'Ọ', 'Ỏ', 'Օ', 'Ὀ',
    'Ὁ', 'Ὂ', 'Ὃ', 'Ὄ', 'Ὅ'], ['Π'], ['Ρ', 'Ƥ', 'Ҏ', 'Ṕ', 'Ṗ'], ['Ϲ', 'Ç', 'Ć', 'Ĉ', 'Ċ', 'Č', 'Ƈ',
    'Ҫ', 'Ḉ'], ['Τ', 'Ţ', 'Ť', 'Ƭ', 'Ʈ', 'Ț', 'Ҭ', 'Ṫ', 'Ṭ', 'Ṯ', 'Ṱ'],
    ['Ӱ', 'Ӳ', 'Ÿ', 'Ý', 'Ŷ', 'Ÿ', 'Ƴ', 'Ȳ', 'Ύ', 'Υ', 'Ϋ', 'ϒ', 'ϓ', 'ϔ', 'Ў', 'Ү', 'Ӯ', 'Ẏ', 'Ỳ',
    'Ỵ', 'Ỷ', 'Ỹ', 'Ὑ', 'Ὓ', 'Ὕ', 'Ὗ', 'Ῠ', 'Ῡ', 'Ὺ', 'Ύ'], ['Φ', 'Ⱇ'], ['Χ', 'Ҳ', 'Ӽ', 'Ẋ', 'Ẍ'],
    ['Ҵ', 'Ų'], ['Ҷ', 'Ϥ', 'ϥ', 'Ҹ', 'Ӌ', 'Ӵ'], ['Ɯ'], ['Ϣ'], ['Ѣ'], ['Ӹ'], ['Ƅ', 'Ҍ'], ['Ӭ', 'Ⰵ'],
    ['ⱵO'], ['Я']];

  RU_Unicode_Small: ArrArrStr = [['ɑ', 'ἀ', 'ἁ', 'ἂ', 'ἃ', 'ἄ', 'ἅ', 'ἆ', 'ἇ', 'ᾀ', 'ᾁ', 'ᾂ', 'ᾃ',
    'ᾄ', 'ᾅ', 'ᾆ', 'ᾇ', 'ᾰ', 'ᾱ', 'ᾲ', 'ᾳ', 'ᾴ', 'å', 'ᶏ', 'à', 'á', 'â', 'ã', 'ä', 'ā', 'ă', 'ą',
    'ǟ', 'ǡ', 'ȁ', 'ȃ', 'ȧ', 'ά', 'α', 'ạ', 'ả', 'ấ', 'ầ', 'ẩ', 'ẫ', 'ậ', 'ắ', 'ằ', 'ẳ', 'ẵ', 'ặ',
    'ᴀ', '𝛂', '𝚨'], ['δ', 'Ϭ', 'ნ', 'ᘕ', '𝛅'], ['ʙ', 'β', 'ᴃ', 'ϐ', 'Ᏸ', 'Ᏼ', 'ᗸ', 'ᗹ', 'ᙝ', 'ᙫ',
    'ᗷ', '𝛃', '𝚩', '𝛃'], ['ᴦ', 'ґ', 'ɾ', 'ϩ', 'ѓ', 'ғ', 'ӷ', 'Ꮁ', 'ɼ', 'ᒰ', 'ᒱ', '𝚪', '𝛤',
    '𝜞', '𝝘', '𝞒'], ['ɡ', 'ð', 'ց', 'ĝ', 'ğ', 'ġ', 'ģ', 'ǥ', 'ǧ', 'ǵ', 'ց', 'ḡ'],
    ['ҿ', 'Ҽ', 'ȇ', 'ᴇ', 'ᶒ', 'ḝ', 'ḛ', 'ḕ', 'ḗ', 'ѐ', 'é', 'ē', 'ĕ', 'ė', 'ę', 'ě', 'є', 'ҽ', 'Ҿ',
    'ӗ', 'ḙ', 'ẹ', 'ẻ', 'ẽ', 'ế', 'ề', 'ể', 'ễ', 'ệ', '℮', '𝚬', '𝛦'], ['ë', 'ȅ'],
    ['җ', 'ӂ', 'ѫ', 'ⵣ', 'ӝ'], ['ᴈ', 'ȝ', 'ʒ', 'ҙ', 'ᶚ', 'ᶔ', 'ӟ', 'ვ', 'ჳ', 'ӡ', 'ƺ', 'კ', 'ǯ',
    'ɜ', 'ʓ', 'პ', 'ჴ', 'ᘊ', 'ᘌ', 'ᘼ', 'ᙣ', 'ᙤ', 'ᙥ', 'ᴣ'], ['ᴎ', 'ӥ'], ['ҋ', 'ӣ', 'ѝ'],
    ['ᴋ', 'ҡ', 'ҟ', 'ķ', 'қ', 'ҝ', 'κ', 'ќ', 'ḱ', 'ḳ', 'ḵ', 'ⱪ', 'ƙ', '𝚱', '𝛫'],
    ['ʌ', 'ለ', 'ላ', 'ӆ', 'ԓ', 'ሰ', 'ስ', 'Ꮧ', 'ᐱ', 'ᴧ', '𝚲', '𝛬', '𝜦', '𝝠', '𝞚'],
    ['ӎ', 'ϻ', 'ʍ', '𝚳', '𝛭', '𝜧'], ['ӊ', 'ң', 'ӈ', 'ዘ', 'ዞ', '𝚮', '𝛨', '𝜢', '𝝜', 'ʜ'],
    ['ο', 'ӧ', 'ѻ', 'ō', 'ŏ', 'ő', 'ò', 'ó', 'ô', 'õ', 'ö', 'ǫ', 'ǭ', 'ơ', 'ǒ', 'ȫ', 'ȭ', 'ȯ', 'ȱ',
    'ồ', 'ổ', 'ỗ', 'ộ', 'ớ', 'ờ', 'ở', 'ỡ', 'ợ', 'ọ', 'ỏ', 'ᴏ', 'ᴑ', 'ὀ', 'ὁ', 'ὂ', 'ὃ', 'ὄ', 'ὅ',
    '𝚶', '𝜣'], ['ᴨ', 'π', 'ո', '𝚷', '𝛱', '𝜫', '𝝥', '𝞟'], ['ρ', 'ҏ', 'ք', 'Ꮅ', 'Ꮲ', 'ṕ', 'ṗ',
    '𝚸', '𝛲'], ['ϲ', 'ç', 'ć', 'ĉ', 'ċ', 'č', 'ƈ', 'ҫ', 'Ꮯ', 'Ꮸ', 'ᑕ', 'ᙅ', 'ḉ'],
    ['ҭ', 'τ', 'Ꭲ', '𝚻', '𝛵'], ['γ', 'ý', 'ÿ', 'ŷ', 'ƴ', 'ȳ', 'γ', 'ў', 'ү', 'ӯ', 'ӱ', 'ӳ', 'ẏ',
    'ẙ', 'ỳ', 'ỵ', 'ỷ', 'ỹ', '𝚼'], ['ȹ', 'ɸ', 'φ', 'ϕ', 'ዋ', 'ჶ', 'ⱇ', '𝚽', '𝜱', '𝝫'],
    ['ҳ', 'χ', 'ჯ', 'ӽ', 'ᶍ', 'ẋ', 'ẍ', '𝚾', '𝛸'], ['ҵ', 'ų'], ['ӵ', 'ʮ', 'ҷ', 'ӌ'], ['ɯ'],
    ['ɰ', 'ϣ'], ['ѣ', 'Ꮦ'], ['ӹ'], ['ƅ', 'ᶀ', 'ḃ', 'ḅ', 'ḇ', 'Ꮟ', 'ҍ', 'ᑲ', 'ᑳ', 'ᑾ', 'ᑿ', 'ᒀ', 'ᒁ',
    'ᒂ', 'ᖚ'], ['϶', 'ӭ', 'ᕭ', 'ⰵ'], ['ⱶo', 'Ꮀo'], ['ᴙ']];

  EN_Unicode_Big: ArrArrStr = [['À', 'Á', 'Â', 'Ã', 'Ä', 'Å', 'Å', 'Ā', 'Ă', 'Ą', 'Ȁ', 'Ȃ', 'Ȧ',
    'Ǎ', 'Ǻ', 'Ấ', 'Ầ', 'Ắ', 'Ằ', 'Ẫ', 'Ẵ', 'Ả', 'Ẩ', 'Ẳ', 'Ạ', 'Ậ', 'Ặ'],
    ['ℬ', 'ß', 'ẞ', 'Ƀ', 'Ɓ', 'Ḃ', 'Ḅ', 'Ḇ'], ['ℂ', 'Ç', 'Ć', 'Ĉ', 'Ċ', 'Č', 'Ƈ', 'Ḉ'],
    ['Ð', 'Ď', 'Đ', 'Ɖ', 'Ɗ', 'Ḋ', 'Ḑ', 'Ḍ', 'Ḓ'], ['È', 'É', 'Ê', 'Ë', 'Ē', 'Ĕ', 'Ė', 'Ę', 'Ě',
    'Ȅ', 'Ȇ', 'Ȩ', 'Ẽ', 'Ế', 'Ề', 'Ḗ', 'Ḕ', 'Ễ', 'Ḝ', 'Ẻ', 'Ể', 'Ẹ', 'Ḙ', 'Ḛ', 'Ệ'], ['Ƒ', 'Ḟ'],
    ['Ĝ', 'Ğ', 'Ġ', 'Ģ', 'Ɠ', 'Ǥ', 'Ǧ', 'Ǵ', 'Ḡ'], ['ℍ', 'ℋ', 'Ⱨ', 'Ȟ', 'Ḣ', 'Ḧ', 'Ḩ', 'Ḥ', 'Ḫ'],
    ['Ĩ', 'Ī', 'Ĭ', 'Ȉ', 'Ȋ', 'Ǐ', 'Ḯ', 'Ỉ', 'Ị', 'Ḭ', 'Ì', 'Í', 'Î', 'Ï', 'İ'], ['Ĵ', 'ǰ'],
    ['K', 'Ⱪ', 'Ķ', 'Ƙ', 'Ǩ', 'Ḱ', 'Ḳ', 'Ḵ'], ['Ĺ', 'Ļ', 'Ľ', 'Ŀ', 'Ł', 'Ḷ', 'Ḽ', 'Ḻ', 'Ḹ'],
    ['ℳ', 'Ḿ', 'Ṁ', 'Ṃ'], ['ℕ', 'Ñ', 'Ń', 'Ņ', 'Ň', 'Ŋ', 'Ɲ', 'Ǹ', 'Ṅ', 'Ṇ', 'Ṋ', 'Ṉ'],
    ['Ò', 'Ó', 'Ô', 'Õ', 'Ö', '𝚯', 'Ō', 'Ŏ', 'Ő', 'Ȍ', 'Ȏ', 'Ȯ', 'Ơ', 'Ǒ', 'Ố', 'Ồ', 'Ỗ', 'Ỏ', 'Ổ',
    'Ọ', 'Ớ', 'Ờ', 'Ỡ', 'Ộ', 'Ở', 'Ợ', 'Ṓ'], ['ℙ', 'Ᵽ', 'Ƥ', 'Ƿ', 'Ṕ', 'Ṗ'], ['ℚ'],
    ['ℝ', 'ℛ', 'Ɽ', 'Ŕ', 'Ŗ', 'Ř', 'Ȑ', 'Ȓ', 'Ɍ', 'Ʀ', 'Ṙ', 'Ṛ', 'Ṟ', 'Ṝ'],
    ['Ś', 'Ŝ', 'Ş', 'Š', 'Ș', 'Ṡ', 'Ṥ', 'Ṧ', 'Ṣ', 'Ṩ'], ['Ţ', 'Ť', 'Ț', 'Ƭ', 'Ʈ', 'Ṫ', 'Ṭ', 'Ṱ',
    'Ṯ'], ['Ù', 'Ú', 'Û', 'Ü', 'Ũ', 'Ū', 'Ŭ', 'Ů', 'Ű', 'Ȕ', 'Ȗ', 'Ư', 'Ʋ', 'Ǔ', 'Ǖ', 'Ǘ', 'Ǚ', 'Ǜ',
    'Ủ', 'Ụ', 'Ṳ', 'Ứ', 'Ừ', 'Ṷ', 'Ṵ', 'Ữ', 'Ử', 'Ự'], ['Ṽ', 'Ṿ'],
    ['Ⱳ', 'Ŵ', 'Ẃ', 'Ẁ', 'Ẇ', 'Ẅ', 'Ẉ'], ['Ẋ', 'Ẍ'], ['Ý', 'Ŷ', 'Ÿ', 'Ȳ', 'Ƴ', 'Ỳ', 'Ẏ', 'Ỹ', 'Ỷ',
    'Ỵ'], ['ℤ', 'Ⱬ', 'Ź', 'Ż', 'Ž', 'Ȥ', 'Ƶ', 'Ẑ', 'Ẓ', 'Ẕ']];

  EN_Unicode_Small: ArrArrStr = [['𝐀', '𝐴', '𝑨', '𝓐', '𝖠', '𝗔', '𝘈', '𝘼', '𝙰', '𝐚', '𝑎',
    '𝒂', '𝒶', '𝓪', '𝔞', '𝕒', '𝖺', '𝗮', '𝘢', '𝙖', '𝚊', 'à', 'á', 'â', 'ã', 'ä', 'å', '𝛂',
    '𝔸', '𝒜', '𝚨', '𝛢', '𝜜', '𝝖', '𝞐', 'ā', 'ă', 'ą', 'ȁ', 'ȃ', 'ȧ', 'ǎ', 'ɑ', 'ᴀ', 'ấ', 'ầ',
    'ắ', 'ằ', 'ẫ', 'ẵ', 'ả', 'ẩ', 'ẳ', 'ạ', 'ậ', 'ặ'], ['𝐁', '𝐵', '𝑩', '𝓑', '𝖡', '𝗕', '𝘉',
    '𝘽', '𝙱', '𝔹', '𝐛', '𝑏', '𝒃', '𝒷', '𝓫', '𝔟', '𝕓', '𝖻', '𝗯', '𝘣', '𝙗', '𝚋', '𝚩',
    '𝛃', '𝛣', '𝜝', '𝝗', '𝞑', 'Ƅ', 'ƅ', 'ɞ', 'ʙ', 'ᴃ', 'ḃ', 'ḅ', 'ḇ'],
    ['𝐂', '𝐶', '𝑪', '𝓒', '𝖢', '𝗖', '𝘊', '𝒞', '𝘾', '𝙲', 'ç', 'ć', 'ĉ', 'ċ', 'č', 'ƈ', 'ᴄ',
    'ḉ'], ['𝐃', '𝐷', '𝑫', '𝓓', '𝖣', '𝗗', '𝘋', '𝘿', '𝙳', 'ď', 'đ', 'ᴅ', 'ᴆ', 'ḋ', 'ḑ', '𝔻',
    '𝒟', '𝔇', 'ḍ', 'ḓ', 'ḏ'], ['𝐄', '𝐸', '𝑬', '𝓔', '𝖤', '𝗘', '𝘌', '𝙀', '𝙴', 'è', 'é',
    'ê', 'ë', '℮', '𝚬', '𝛦', '𝜠', '𝝚', '𝞔', 'ē', 'ĕ', 'ė', 'ę', 'ě', 'ȅ', 'ȇ', 'ȩ', 'ᴇ', 'ẽ',
    'ế', 'ề', 'ḗ', 'ḕ', 'ễ', 'ḝ', 'ẻ', 'ể', 'ẹ', 'ḙ', 'ḛ', 'ệ'],
    ['𝐅', '𝐹', '𝑭', '𝓕', '𝖥', '𝗙', '𝘍', '𝙁', '𝙵', '𝚏', '𝟊', 'ƒ', 'ḟ', '𝔽', 'ℱ'],
    ['𝐆', '𝐺', '𝑮', '𝓖', '𝖦', '𝗚', '𝘎', '𝙂', '𝙶', 'ĝ', 'ğ', 'ġ', 'ģ', 'ǵ', 'ǧ', 'ɡ', 'ɢ',
    'ʛ', 'ḡ', '𝔾', '𝒢'], ['𝐇', '𝐻', '𝑯', '𝓗', '𝖧', '𝗛', '𝘏', '𝙃', '𝙷', '𝐡', 'ℎ', 'ℏ',
    'ⱨ', 'ĥ', 'ȟ', 'ɦ', 'ɧ', 'ḣ', 'ḧ', 'ḩ', 'ḥ'], ['𝐈', '𝐼', '𝑰', '𝓘', '𝖨', '𝗜', '𝘐', '𝙄',
    '𝙸', '𝐢', '𝑖', '𝒊', '𝒾', '𝓲', '𝔦', '𝕚', '𝗂', '𝗶', '𝘪', '𝙞', '𝚒', 'ĩ', 'ī', 'ĭ',
    'ȉ', 'ȋ', 'ǐ', 'ḯ', 'ỉ', 'ị', 'ḭ'], ['𝐉', '𝐽', '𝑱', '𝓙', '𝖩', '𝗝', '𝘑', '𝙅', '𝙹', '𝐣',
    '𝑗', '𝒋', '𝕛', '𝗃', '𝗷', '𝘫', '𝙟', '𝚓', 'ĵ', 'ȷ', 'ʝ', 'ᴊ'],
    ['𝐊', '𝐾', '𝑲', '𝓚', '𝖪', '𝗞', '𝘒', '𝙆', '𝙺', '𝐤', '𝗄', '𝗸', '𝘬', '𝙠', '𝚔', 'ⱪ',
    '𝚱', '𝛫', '𝜥', '𝝟', '𝞙', 'ķ', 'ĸ', 'ƙ', 'ǩ', 'ᴋ', 'ḱ', '𝕂', '𝒦', 'ḳ', 'ḵ'],
    ['𝐋', '𝐿', '𝑳', '𝓛', '𝖫', '𝗟', '𝘓', '𝙇', '𝙻', '𝐥', '𝑙', '𝒍', '𝓁', '𝓵', '𝔩', '𝗅',
    '𝗹', '𝘭', '𝙡', '𝚕', 'ļ', 'ľ', 'ŀ', 'ł', 'ȴ', 'ɭ', 'ḷ', 'ḽ', 'ḻ'],
    ['𝐌', '𝑀', '𝑴', '𝓜', '𝖬', '𝗠', '𝘔', '𝙈', '𝙼', '𝐦', '𝗆', '𝗺', '𝘮', '𝙢', '𝚖', '𝚳',
    '𝛭', '𝜧', '𝝡', '𝞛', 'ɱ', 'ᴍ', 'ḿ', 'ṁ', 'ṃ'], ['𝐍', '𝑁', '𝑵', '𝓝', '𝖭', '𝗡', '𝘕',
    '𝙉', '𝙽', '𝒩', '𝚴', '𝛮', '𝜨', '𝝢', '𝞜', 'ń', 'ņ', 'ň', 'ŋ', 'ƞ', 'ǹ', 'ɲ', 'ɳ', 'ɴ',
    'ṅ', 'ṇ', 'ṋ', 'ṉ'], ['𝐎', '𝑂', '𝑶', '𝓞', '𝖮', '𝗢', '𝘖', '𝙊', '𝙾', '𝐨', 'ò', 'ó', 'ô',
    'õ', 'ö', '𝚶', '𝕆', '𝒪', '𝛰', '𝜣', '𝜪', '𝜭', '𝝝', '𝝤', '𝞗', '𝞞', '𝞠', 'ō', 'ŏ', 'ő',
    'ȍ', 'ȏ', 'ȯ', 'ơ', 'ǒ', 'ᴏ', 'ᴑ', 'ố', 'ồ', 'ỗ', 'ỏ', 'ổ', 'ọ', 'ớ', 'ờ', 'ỡ', 'ộ', 'ở', 'ợ'],
    ['𝐏', '𝑃', '𝑷', '𝓟', '𝖯', '𝗣', '𝘗', '𝙋', '𝚸', '𝛲', '𝜬', '𝝧', '𝞡', 'ᴘ', 'ᵽ', 'ᴩ',
    'ṕ', 'ṗ'], ['𝐐', '𝑄', '𝑸', '𝓠', '𝖰', '𝗤', '𝘘', '𝙌', '𝚀', '𝐪', '𝒬', '𝗾', '𝘲', '𝙦',
    '𝚚', 'ɋ'], ['𝐑', '𝑅', '𝑹', '𝓡', '𝖱', '𝗥', '𝘙', '𝙍', '𝚁', '𝐫', 'ŕ', 'ŗ', 'ř', 'ȑ',
    'ȓ', 'ɍ', 'ʀ', 'ṙ', 'ṛ', 'ṟ', 'ṝ'], ['𝐒', '𝑆', '𝑺', '𝓢', '𝖲', '𝗦', '𝘚', '𝙎', 'ś', 'ŝ',
    'ş', 'š', 'ș', 'ȿ', 'ʂ', '𝕊', '𝒮', 'ṡ', 'ṥ', 'ṧ', 'ṣ', 'ṩ'],
    ['𝐓', '𝑇', '𝑻', '𝖳', '𝗧', '𝘛', '𝙏', '𝕋', '𝚻', '𝛵', '𝜯', '𝝩', '𝞣', 'ţ', 'ť', 'ț',
    'ȶ', 'Ƚ', 'ƫ', 'ƭ', 'ʈ', 'ᴛ', 'ṫ', 'ṭ', 'ṱ', 'ṯ'], ['𝐔', '𝑈', '𝑼', '𝓤', '𝖴', '𝗨', '𝘜',
    '𝙐', '𝚄', 'ù', 'ú', 'û', 'ü', 'ũ', 'ū', 'ŭ', 'ů', 'ű', 'ȕ', 'ȗ', 'ư', 'ǔ', '𝕌', '𝒰', 'ǖ',
    'ǘ', 'ǚ', 'ǜ', 'ᴜ', 'ủ', 'ụ', 'ṳ', 'ứ', 'ừ', 'ṷ', 'ṵ', 'ữ', 'ử', 'ự'],
    ['𝐕', '𝑉', '𝑽', '𝓥', '𝖵', '𝗩', '𝘝', '𝙑', '𝚅', '𝕍', '𝒱', 'ⱱ', 'ᴠ', 'ṽ', 'ṿ'],
    ['𝐖', '𝑊', '𝑾', '𝓦', '𝖶', '𝗪', '𝘞', '𝕎', '𝒲', '𝙒', '𝚆', 'ⱳ', 'ŵ', 'ᴡ', 'ẃ', 'ẁ', 'ẇ',
    'ẅ', 'ẉ'], ['𝐗', '𝑋', '𝑿', '𝓧', '𝖷', '𝗫', '𝘟', '𝙓', '𝚇', '𝚾', '𝛸', '𝜲', '𝝬', '𝞦',
    '𝕏', '𝒳', 'ẋ', 'ẍ'], ['𝐘', '𝑌', '𝒀', '𝓨', '𝖸', '𝗬', '𝘠', '𝙔', '𝚈', 'ý', 'ÿ', '𝚼',
    '𝛶', '𝜰', '𝝪', '𝞤', 'ŷ', 'ȳ', 'ƴ', '𝕐', '𝒴', 'ʏ', 'ỳ', 'ẏ', 'ỹ', 'ỷ', 'ỵ'],
    ['𝐙', '𝑍', '𝒁', '𝓩', '𝖹', '𝗭', '𝘡', '𝙕', '𝚉', 'ⱬ', '𝚭', '𝛧', '𝜡', '𝝛', '𝒵', '𝞕',
    'ź', 'ż', 'ž', 'ȥ', 'ƶ', 'ʐ', 'ᴢ', 'ẑ', 'ẓ', 'ẕ']];

  (* Unicode_PunctuationW8: ArrArrStr = [['.'], ['ⵑ', '❗'], ['?'], ['ʺ', '˝', 'ˮ', '“', '”', '„', '‟',
    '″', '‶'], ['ʻ', 'ʼ', 'ʽ', 'ʹ', 'ˈ', '՝', '‘', '’', '‛', '‵'], ['❟'], ['⁎', '∗'],
    ['…'], ['⁇'], ['⁈'], ['⁉'], ['‼'], ['❨', '❪', '⟮'], ['❩', '❫', '⟯'], ['['], [']'], ['{'], ['}'],
    ['˗', '−'], ['－', '‒', '—', '―'], ['˂'], ['˃'], ['⁚']];
  *)
  Unicode_Punctuation: ArrArrStr = [['.'], ['ⵑ', '❗'], ['?'], ['ʺ', '˝', 'ˮ', '“', '”', '„', '‟',
    '″', '‶'], ['ʻ', 'ʼ', 'ʽ', 'ʹ', 'ˈ', '՝', '‘', '’', '‛', '‵'], [','], ['∗'], ['…'], ['⁇'],
    ['⁈'], ['⁉'], ['‼'], ['❨', '❪'], ['❩', '❫'], ['['], [']'], ['{'], ['}'], ['˗', '−'],
    ['－', '‒', '—', '―'], ['˂'], ['˃'], [':']];

  Unicode_Numbers: ArrArrStr = [['𝟎', '𝟘', '𝟢', '𝟬', '𝟶'], ['𝟏', '𝟙', '𝟣', '𝟭', '𝟷'],
    ['𝟐', '𝟚', '𝟤', '𝟮', '𝟸', '౽'], ['𝟑', '𝟛', '𝟥', '𝟯', '𝟹'],
    ['𝟒', '𝟜', '𝟦', '𝟰', '𝟺', '౺'], ['𝟓', '𝟝', '𝟧', '𝟱', '𝟻', 'Ƽ', 'ƽ'],
    ['𝟔', '𝟞', '𝟨', '𝟲', '𝟼'], ['𝟕', '𝟟', '𝟩', '𝟳', '𝟽'],
    ['𝟖', '𝟠', '𝟪', '𝟴', '𝟾', 'Ȣ', 'ȣ'], ['𝟗', '𝟡', '𝟫', '𝟵', '𝟿', '೨', '᧒']];

  // ===============================================================================================

  RU_Unicode_PW_Big: ArrArrStr = [['Α', 'Ａ'], ['Б'], ['Β', 'Ｂ'], ['Γ'], ['Δ'], ['Ε', 'Σ', 'Ｅ'],
    ['Ё'], ['Ж'], ['3'], ['Ｕ'], ['Й'], ['Κ', 'Ｋ'], ['Λ'], ['Μ', 'Ｍ'], ['Η', 'Ｈ'], ['Ο', 'Ｏ', 'Θ'],
    ['Π'], ['Ρ', 'Ｐ'], ['Ｃ'], ['Τ', 'Ｔ'], ['Υ', 'Ｙ'], ['Φ'], ['Χ', 'Ｘ'], ['Ц'], ['Ч'], ['Ш'], ['Щ'],
    ['Ъ'], ['Ы'], ['ｂ'], ['Э'], ['Ю'], ['Я']];

  RU_Unicode_PW_Small: ArrArrStr = [['ɑ', 'à', 'á', 'ā', 'α', 'ａ'], ['δ'], ['β'], ['ｒ'], ['ɡ', 'ｇ'],
    ['é', 'ē', 'ě', 'ｅ'], ['ё'], ['ж'], ['з'], ['ｕ'], ['й'], ['κ', 'ｋ'], ['λ'], ['м'], ['н'],
    ['ο', 'ō', 'ò', 'ó', 'ǒ', 'θ', 'σ', 'ｏ'], ['π'], ['ρ', 'ｐ'], ['ｃ'], ['τ'], ['γ', 'ｙ'], ['φ'],
    ['χ', 'ｘ'], ['ц'], ['ч'], ['ш'], ['щ'], ['ъ'], ['ы'], ['ｂ'], ['э'], ['ю'], ['я']];

  // ===============================================================================================

  RU_Unicode_XP_Big: ArrArrStr = [['Α', 'Å', 'À', 'Á', 'Â', 'Ã', 'Ä', 'Ā', 'Ă', 'Ą', 'Ά', 'Ḁ', 'Ạ',
    'Ả', 'Ấ', 'Ầ', 'Ẩ', 'Ẫ', 'Ậ', 'Ắ', 'Ằ', 'Ẳ', 'Ẵ', 'Ặ'], ['Ђ'], ['ß', 'Ḇ', 'Ḅ', 'Ḃ', 'Β'],
    ['Ґ', 'Ѓ'], ['Δ'], ['Ε', 'Ê', 'Ḝ', 'Ḛ', 'Ḕ', 'Ḗ', 'Ѐ', 'É', 'Ē', 'Ĕ', 'Ė', 'Ę', 'Ě', 'Έ', 'Σ',
    'Ḙ', 'Ẹ', 'Ẻ', 'Ẽ', 'Ế', 'Ề', 'Ể', 'Ễ', 'Ệ'], ['Ë'], ['Җ'], ['3', 'Ʒ', 'Ǯ'], ['И'], ['Ѝ'],
    ['Қ', 'Ķ', 'Ҝ', 'Κ', 'Ќ', 'Ḱ', 'Ḳ', 'Ḵ'], ['Λ'], ['Μ', 'Ḿ'], ['Ң', 'Ĥ', 'Ή', 'Η', 'Ḣ', 'Ḥ', 'Ḧ',
    'Ḩ', 'Ḫ', 'Ἠ', 'Ἡ', 'Ἢ', 'Ἣ', 'Ἤ', 'Ἥ', 'Ἦ', 'Ἧ', 'ᾘ', 'ᾙ', 'ᾚ', 'ᾛ', 'ᾜ', 'ᾝ', 'ᾞ', 'ᾟ', 'Ὴ',
    'Ή', 'ῌ'], ['Ο', 'Ō', 'Ŏ', 'Ő', 'Ò', 'Ó', 'Ô', 'Õ', 'Ö', 'Ǫ', 'Ơ', 'Ό', 'Ồ', 'Ổ', 'Ỗ', 'Ộ', 'Ớ',
    'Ờ', 'Ở', 'Ỡ', 'Ợ', 'Ọ', 'Ỏ', 'Ὀ', 'Ὁ', 'Ὂ', 'Ὃ', 'Ὄ', 'Ὅ'], ['Π'], ['Ρ', 'Ṕ', 'Ṗ'],
    ['Ç', 'Ć', 'Ĉ', 'Ċ', 'Č', 'Ḉ'], ['Τ', 'Ţ', 'Ť', 'Ț', 'Ṫ', 'Ṭ', 'Ṯ', 'Ṱ'],
    ['Ÿ', 'Ý', 'Ŷ', 'Ÿ', 'Ύ', 'Υ', 'Ϋ', 'Ў', 'Ү', 'Ẏ', 'Ỳ', 'Ỵ', 'Ỷ', 'Ỹ', 'Ὑ', 'Ὓ', 'Ὕ', 'Ὗ', 'Ῠ',
    'Ῡ', 'Ὺ', 'Ύ'], ['Φ'], ['Χ', 'Ҳ', 'Ẋ', 'Ẍ'], ['Ų'], ['Ҹ'], ['Ш'], ['Щ'], ['Ъ'], ['Ы'], ['Ь'],
    ['Э'], ['І-O'], ['Я']];

  RU_Unicode_XP_Small: ArrArrStr = [['ἀ', 'ἁ', 'ἂ', 'ἃ', 'ἄ', 'ἅ', 'ἆ', 'ἇ', 'ᾀ', 'ᾁ', 'ᾂ', 'ᾃ',
    'ᾄ', 'ᾅ', 'ᾆ', 'ᾇ', 'ᾰ', 'ᾱ', 'ᾲ', 'ᾳ', 'ᾴ', 'å', 'à', 'á', 'â', 'ã', 'ä', 'ā', 'ă', 'ą', 'ά',
    'α', 'ạ', 'ả', 'ấ', 'ầ', 'ẩ', 'ẫ', 'ậ', 'ắ', 'ằ', 'ẳ', 'ẵ', 'ặ'], ['δ'], ['β'], ['ґ', 'ѓ'],
    ['ð', 'ĝ', 'ğ', 'ġ', 'ģ', 'ǥ', 'ǧ', 'ḡ'], ['ḝ', 'ḛ', 'ḕ', 'ḗ', 'ѐ', 'é', 'ē', 'ĕ', 'ė', 'ę',
    'ě', 'є', 'ḙ', 'ẹ', 'ẻ', 'ẽ', 'ế', 'ề', 'ể', 'ễ', 'ệ', '℮'], ['ë'], ['җ'], ['ʒ', 'ǯ'], ['и'],
    ['ѝ'], ['ķ', 'қ', 'ҝ', 'κ', 'ќ', 'ḱ', 'ḳ', 'ḵ'], ['л'], ['м'], ['ң'],
    ['ο', 'ō', 'ŏ', 'ő', 'ò', 'ó', 'ô', 'õ', 'ö', 'ǫ', 'ơ', 'ồ', 'ổ', 'ỗ', 'ộ', 'ớ', 'ờ', 'ở', 'ỡ',
    'ợ', 'ọ', 'ỏ', 'ὀ', 'ὁ', 'ὂ', 'ὃ', 'ὄ', 'ὅ'], ['π'], ['ρ', 'ṕ', 'ṗ'],
    ['ç', 'ć', 'ĉ', 'ċ', 'č', 'ḉ'], ['τ'], ['γ', 'ý', 'ÿ', 'ŷ', 'γ', 'ў', 'ү', 'ẏ', 'ẙ', 'ỳ', 'ỵ',
    'ỷ', 'ỹ'], ['φ'], ['ҳ', 'χ', 'ẋ', 'ẍ'], ['ų'], ['ч'], ['ш'], ['щ'], ['ъ'], ['ы'],
    ['ḃ', 'ḅ', 'ḇ'], ['э'], ['ю'], ['я']];

  EN_Unicode_XP_Big: ArrArrStr = [['À', 'Á', 'Â', 'Ã', 'Ä', 'Å', 'Ā', 'Ă', 'Ą', 'Ȁ', 'Ȃ', 'Ȧ', 'Ǎ',
    'Ǻ', 'Ấ', 'Ầ', 'Ắ', 'Ằ', 'Ẫ', 'Ẵ', 'Ả', 'Ẩ', 'Ẳ', 'Ạ', 'Ậ', 'Ặ'],
    ['ℬ', 'ß', 'Ɓ', 'Ḃ', 'Ḅ', 'Ḇ'], ['ℂ', 'Ç', 'Ć', 'Ĉ', 'Ċ', 'Č', 'Ƈ', 'Ḉ'],
    ['Ð', 'Ď', 'Đ', 'Ɖ', 'Ɗ', 'Ḋ', 'Ḑ', 'Ḍ', 'Ḓ'], ['È', 'É', 'Ê', 'Ë', 'Ē', 'Ĕ', 'Ė', 'Ę', 'Ě',
    'Ȅ', 'Ȇ', 'Ȩ', 'Ẽ', 'Ế', 'Ề', 'Ḗ', 'Ḕ', 'Ễ', 'Ḝ', 'Ẻ', 'Ể', 'Ẹ', 'Ḙ', 'Ḛ', 'Ệ'], ['Ƒ', 'Ḟ'],
    ['Ĝ', 'Ğ', 'Ġ', 'Ģ', 'Ɠ', 'Ǥ', 'Ǧ', 'Ǵ', 'Ḡ'], ['ℍ', 'ℋ', 'Ȟ', 'Ḣ', 'Ḧ', 'Ḩ', 'Ḥ', 'Ḫ'],
    ['Ĩ', 'Ī', 'Ĭ', 'Ȉ', 'Ȋ', 'Ǐ', 'Ḯ', 'Ỉ', 'Ị', 'Ḭ', 'Ì', 'Í', 'Î', 'Ï', 'İ'], ['Ĵ', 'ǰ'],
    ['K', 'Ķ', 'Ƙ', 'Ǩ', 'Ḱ', 'Ḳ', 'Ḵ'], ['Ĺ', 'Ļ', 'Ľ', 'Ŀ', 'Ł', 'Ḷ', 'Ḽ', 'Ḻ', 'Ḹ'],
    ['ℳ', 'Ḿ', 'Ṁ', 'Ṃ'], ['ℕ', 'Ñ', 'Ń', 'Ņ', 'Ň', 'Ŋ', 'Ɲ', 'Ǹ', 'Ṅ', 'Ṇ', 'Ṋ', 'Ṉ'],
    ['Ò', 'Ó', 'Ô', 'Õ', 'Ö', 'Ō', 'Ŏ', 'Ő', 'Ȍ', 'Ȏ', 'Ȯ', 'Ơ', 'Ǒ', 'Ố', 'Ồ', 'Ỗ', 'Ỏ', 'Ổ', 'Ọ',
    'Ớ', 'Ờ', 'Ỡ', 'Ộ', 'Ở', 'Ợ', 'Ṓ'], ['ℙ', 'Ƥ', 'Ƿ', 'Ṕ', 'Ṗ'], ['ℚ'],
    ['ℝ', 'ℛ', 'Ŕ', 'Ŗ', 'Ř', 'Ȑ', 'Ȓ', 'Ʀ', 'Ṙ', 'Ṛ', 'Ṟ', 'Ṝ'],
    ['Ś', 'Ŝ', 'Ş', 'Š', 'Ș', 'Ṡ', 'Ṥ', 'Ṧ', 'Ṣ', 'Ṩ'], ['Ţ', 'Ť', 'Ț', 'Ƭ', 'Ʈ', 'Ṫ', 'Ṭ', 'Ṱ',
    'Ṯ'], ['Ù', 'Ú', 'Û', 'Ü', 'Ũ', 'Ū', 'Ŭ', 'Ů', 'Ű', 'Ȕ', 'Ȗ', 'Ư', 'Ʋ', 'Ǔ', 'Ǖ', 'Ǘ', 'Ǚ', 'Ǜ',
    'Ủ', 'Ụ', 'Ṳ', 'Ứ', 'Ừ', 'Ṷ', 'Ṵ', 'Ữ', 'Ử', 'Ự'], ['Ṽ', 'Ṿ'], ['Ŵ', 'Ẃ', 'Ẁ', 'Ẇ', 'Ẅ', 'Ẉ'],
    ['Ẋ', 'Ẍ'], ['Ý', 'Ŷ', 'Ÿ', 'Ȳ', 'Ƴ', 'Ỳ', 'Ẏ', 'Ỹ', 'Ỷ', 'Ỵ'],
    ['ℤ', 'Ź', 'Ż', 'Ž', 'Ȥ', 'Ƶ', 'Ẑ', 'Ẓ', 'Ẕ']];

  EN_Unicode_XP_Small: ArrArrStr = [['à', 'á', 'â', 'ã', 'ä', 'å', 'ā', 'ă', 'ą', 'ȁ', 'ȃ', 'ȧ',
    'ǎ', 'ɑ', 'ấ', 'ầ', 'ắ', 'ằ', 'ẫ', 'ẵ', 'ả', 'ẩ', 'ẳ', 'ạ', 'ậ', 'ặ'],
    ['Ƅ', 'ƅ', 'ɞ', 'ʙ', 'ḃ', 'ḅ', 'ḇ'], ['ç', 'ć', 'ĉ', 'ċ', 'č', 'ƈ', 'ḉ'],
    ['ď', 'đ', 'ḋ', 'ḑ', 'ḍ', 'ḓ', 'ḏ'], ['è', 'é', 'ê', 'ë', '℮', 'ē', 'ĕ', 'ė', 'ę', 'ě', 'ȅ',
    'ȇ', 'ȩ', 'ẽ', 'ế', 'ề', 'ḗ', 'ḕ', 'ễ', 'ḝ', 'ẻ', 'ể', 'ẹ', 'ḙ', 'ḛ', 'ệ'], ['ƒ', 'ḟ', 'ℱ'],
    ['ĝ', 'ğ', 'ġ', 'ģ', 'ǵ', 'ǧ', 'ɡ', 'ɢ', 'ʛ', 'ḡ'], ['ℎ', 'ℏ', 'ĥ', 'ȟ', 'ɦ', 'ɧ', 'ḣ', 'ḧ',
    'ḩ', 'ḥ'], ['ĩ', 'ī', 'ĭ', 'ȉ', 'ȋ', 'ǐ', 'ḯ', 'ỉ', 'ị', 'ḭ'], ['ĵ', 'ʝ'],
    ['ķ', 'ĸ', 'ƙ', 'ǩ', 'ḱ', 'ḳ', 'ḵ'], ['ļ', 'ľ', 'ŀ', 'ł', 'ɭ', 'ḷ', 'ḽ', 'ḻ'],
    ['ɱ', 'ḿ', 'ṁ', 'ṃ'], ['ń', 'ņ', 'ň', 'ŋ', 'ƞ', 'ǹ', 'ɲ', 'ɳ', 'ɴ', 'ṅ', 'ṇ', 'ṋ', 'ṉ'],
    ['ò', 'ó', 'ô', 'õ', 'ö', 'ō', 'ŏ', 'ő', 'ȍ', 'ȏ', 'ȯ', 'ơ', 'ǒ', 'ố', 'ồ', 'ỗ', 'ỏ', 'ổ', 'ọ',
    'ớ', 'ờ', 'ỡ', 'ộ', 'ở', 'ợ'], ['ṕ', 'ṗ'], ['q'], ['ŕ', 'ŗ', 'ř', 'ȑ', 'ȓ', 'ʀ', 'ṙ', 'ṛ', 'ṟ',
    'ṝ'], ['ś', 'ŝ', 'ş', 'š', 'ș', 'ʂ', 'ṡ', 'ṥ', 'ṧ', 'ṣ', 'ṩ'],
    ['ţ', 'ť', 'ț', 'ƫ', 'ƭ', 'ʈ', 'ṫ', 'ṭ', 'ṱ', 'ṯ'], ['ù', 'ú', 'û', 'ü', 'ũ', 'ū', 'ŭ', 'ů',
    'ű', 'ȕ', 'ȗ', 'ư', 'ǔ', 'ǖ', 'ǘ', 'ǚ', 'ǜ', 'ủ', 'ụ', 'ṳ', 'ứ', 'ừ', 'ṷ', 'ṵ', 'ữ', 'ử', 'ự'],
    ['ṽ', 'ṿ'], ['ŵ', 'ẃ', 'ẁ', 'ẇ', 'ẅ', 'ẉ'], ['ẋ', 'ẍ'], ['ý', 'ÿ', 'ŷ', 'ȳ', 'ƴ', 'ʏ', 'ỳ', 'ẏ',
    'ỹ', 'ỷ', 'ỵ'], ['ź', 'ż', 'ž', 'ȥ', 'ƶ', 'ʐ', 'ẑ', 'ẓ', 'ẕ']];

  Unicode_XP_Punctuation: ArrArrStr = [['.'], ['!'], ['?'], ['˝', '“', '”', '„'], ['‘', '’'], [','],
    ['*'], ['…'], ['⁇'], ['⁈'], ['⁉'], ['‼'], ['('], [')'], ['['], [']'], ['{'], ['}'], ['−'],
    ['—', '―'], ['<'], ['>'], [':']];

  // ===============================================================================================

  UntouchableChars: array of char = [char(
    $000A // LF (U+000A): англ. line feed — подача строки;
  ),
  char
  (
    $000D // CR (U+000D): англ. carriage return — возврат каретки;
  )];

implementation

end.
