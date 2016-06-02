unit UnitAlphaLayer;

interface

uses
  Windows, Messages, SysUtils, IniFiles, StrUtils2;

function AddLayer(Handle : HWND; lParam : LPARAM = 0) : Boolean; stdcall;
procedure AddLayerToAll; stdcall;
function RemoveLayer(Handle : HWND; lParam : LPARAM = 0) : Boolean; stdcall;
procedure RemoveLayerFromAll; stdcall;
function ApplyAlpha(Handle : HWND; lParam : LPARAM = 255) : Boolean; stdcall;
procedure ApplyAlphaToAll(Value : Integer); stdcall;

implementation

uses UnitAlphaTrans, UnitFileMapping;

function Excluded(Name : string) : Boolean; stdcall;
var
  IniFile : TIniFile;
  Count, i : Integer;
begin
  Result := False;
  IniFile := TIniFile.Create('FocusAlpha.ini');
  Count := IniFile.ReadInteger('Excluded', 'Count', 0);
  for i := 1 to Count do
    if StrIComp(PChar(IniFile.ReadString('Excluded', IntToStr(i), '')), PChar(Name)) = 0 then
      Result := True;
  IniFile.Free;
end;

function AddLayer(Handle : HWND; lParam : LPARAM = 0) : Boolean; stdcall;
var
  FileMapHandle: THandle;
  FileMapData: PFileMapData;
  CName : array[0..100] of Char;
begin         
  Result := True;
  FileMapHandle := OpenFileMap(FileMapName);
  if FileMapHandle <> 0 then
  begin
    FileMapData := MapFile(FileMapHandle);
    if FileMapData <> nil then
    begin
      if IsWindowVisible(Handle) then
        if GetClassName(Handle, CName, sizeof(CName)) > 0 then
          if not Excluded(CName) and (CName <> 'Progman') and ((CName <> 'Shell_TrayWnd') or FileMapData.TransTaskbar) and
            (Pos('menu', LowerCase(CName)) = 0) and (Pos('tooltip',LowerCase(CName)) = 0) and
            (Pos('screensaver', LowerCase(CName)) = 0) and (Pos('d3d', LowerCase(CName)) = 0) then
          begin
            GetWindowText(Handle, CName, sizeof(CName));
            if not Excluded(CName) and not Bool(GetWindowLong(Handle, GWL_EXSTYLE) and WS_EX_LAYERED) then
            begin
              SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) + WS_EX_LAYERED);
              InvalidateRgn(Handle, 0, False);
            end;
          end;
      UnmapFile(FileMapData);
    end;
    CloseFileMap(FileMapHandle);
  end;
end;

procedure AddLayerToAll; stdcall;
begin
  EnumWindows(@AddLayer,0);
end;

function ApplyAlpha(Handle : HWND; lParam : LPARAM = 255) : Boolean; stdcall;
begin
  Result := True;
  if lParam > 255 then  { Skips the active window when called by ApplyToAll }
    if Handle = GetForegroundWindow then
      Exit
    else
      lParam := lParam-255;
  if Bool(GetWindowLong(Handle, GWL_EXSTYLE) and WS_EX_LAYERED) then
    SetLayeredWindowAttributes(Handle, 0, lParam, LWA_ALPHA);
end;

procedure ApplyAlphaToAll(Value : Integer); stdcall;
begin
  EnumWindows(@ApplyAlpha,255+Value);
end;

function RemoveLayer(Handle : HWND; lParam : LPARAM = 0) : Boolean; stdcall;
begin
  Result := True;
  if Bool(GetWindowLong(Handle, GWL_EXSTYLE) and WS_EX_LAYERED) then
  begin
    SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) - WS_EX_LAYERED);
    InvalidateRgn(Handle, 0, False);
  end;
end;

procedure RemoveLayerFromAll; stdcall;
begin
  EnumWindows(@RemoveLayer,0);
end;

end.
