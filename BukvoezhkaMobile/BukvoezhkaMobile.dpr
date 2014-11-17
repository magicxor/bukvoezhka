program BukvoezhkaMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {FormMain},
  uTextConvertRoutines in '..\BukvoezhkaDesktop\uTextConvertRoutines.pas',
  uCharacterSets in '..\BukvoezhkaDesktop\uCharacterSets.pas',
  uTextConverter in '..\BukvoezhkaDesktop\uTextConverter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
