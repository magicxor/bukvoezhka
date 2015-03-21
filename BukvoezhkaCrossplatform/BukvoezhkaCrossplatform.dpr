program BukvoezhkaCrossplatform;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {FormMain},
  uTextConvertRoutines in '..\BukvoezhkaDesktop\uTextConvertRoutines.pas',
  uTextConverter in '..\BukvoezhkaDesktop\uTextConverter.pas',
  uStringsHelper in '..\BukvoezhkaDesktop\uStringsHelper.pas',
  uFixedASCIIdecorator in '..\BukvoezhkaDesktop\uFixedASCIIdecorator.pas',
  uFixedASCIIartFonts in '..\BukvoezhkaDesktop\uFixedASCIIartFonts.pas',
  uCharacterSets in '..\BukvoezhkaDesktop\uCharacterSets.pas',
  uAbout in 'uAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
