program BukvoezhkaCrossplatform;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {FormMain},
  uTextConvertRoutines in '..\BukvoezhkaDesktop\uTextConvertRoutines.pas',
  uTextConverter in '..\BukvoezhkaDesktop\uTextConverter.pas',
  uStringListTypesConverter in '..\BukvoezhkaDesktop\uStringListTypesConverter.pas',
  uFixedASCIIartMaker in '..\BukvoezhkaDesktop\uFixedASCIIartMaker.pas',
  uConstASCIIartFonts in '..\BukvoezhkaDesktop\uConstASCIIartFonts.pas',
  uConstCharArrays in '..\BukvoezhkaDesktop\uConstCharArrays.pas',
  uAbout in 'uAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
