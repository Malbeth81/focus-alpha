library AlphaTrans;

uses
  SysUtils,
  Classes,
  UnitAlphaTrans in 'UnitAlphaTrans.pas';

{$R *.res}

exports
  SetHook,
  FreeHook,
  Enabled,
  Enable,
  Disable,
  GetAlpha,
  SetAlpha,
  AddExclusion,
  RemoveExclusion,
  ApplyToTaskbar,
  ExcludeTaskbar;
end.
