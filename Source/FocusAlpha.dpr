program FocusAlpha;

uses
  Forms,
  FormMain in 'FormMain.pas' {frmMain},
  Windows;

{$R *.res}
{$R Ressources\WinXP.res}

begin
  Application.Initialize;
  SetWindowLong(Application.Handle, GWL_EXSTYLE, GetWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
  Application.Title := 'FocusAlpha';
  Application.CreateForm(TfrmMain, frmMain);
  Application.ShowMainForm := False;
  Application.Run;
end.
