program BukvoezhkaDesktop;

uses
  Forms,
  uMain in 'uMain.pas' {FormMain},
  uTextConvertRoutines in 'uTextConvertRoutines.pas',
  uCharacterSets in 'uCharacterSets.pas',
  uTextConverter in 'uTextConverter.pas',
  uAbout in 'uAbout.pas' {FormAbout},
  uStringsHelper in 'uStringsHelper.pas',
  uASCIIdecorator in 'uASCIIdecorator.pas',
  uFixedASCIIartFonts in 'uFixedASCIIartFonts.pas',
  uFixedASCIIdecorator in 'uFixedASCIIdecorator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
