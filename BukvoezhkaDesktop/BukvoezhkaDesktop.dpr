program BukvoezhkaDesktop;

uses
  Forms,
  uFormMain in 'uFormMain.pas' {FormMain},
  uTextConvertRoutines in 'uTextConvertRoutines.pas',
  uConstCharArrays in 'uConstCharArrays.pas',
  uTextConverter in 'uTextConverter.pas',
  uFormAbout in 'uFormAbout.pas' {FormAbout},
  uStringListTypesConverter in 'uStringListTypesConverter.pas',
  uASCIIartMaker in 'uASCIIartMaker.pas',
  uConstASCIIartFonts in 'uConstASCIIartFonts.pas',
  uFixedASCIIartMaker in 'uFixedASCIIartMaker.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
