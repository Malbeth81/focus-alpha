unit UnitAlphaTrans;

interface

uses
  Windows, Messages, Classes, SysUtils, IniFiles;

function SetHook(AlphaValue : Integer) : Boolean; stdcall; export;
function FreeHook : Boolean; stdcall; export; 
function Enabled : Boolean; stdcall; export;
procedure Enable; stdcall; export;
procedure Disable; stdcall; export;
function GetAlpha : Integer; stdcall; export;
procedure SetAlpha(Value : Integer); stdcall; export;
procedure AddExclusion(Handle : HWND; Name : ShortString); stdcall; export;
procedure RemoveExclusion(Index : Integer); stdcall; export;
procedure ApplyToTaskbar; stdcall; export;
procedure ExcludeTaskbar; stdcall; export;

implementation

uses
  UnitFileMapping, UnitAlphaLayer;

function HookFunc(Code : Integer; wParam, lParam : Longint) : Longint; stdcall;
var                            
  FileMapHandle: THandle;
  FileMapData: PFileMapData;
  Data : tagCWPSTRUCT;    
begin
  Result := 0;
  { Retreives File Map Data }
  FileMapHandle := OpenFileMap(FileMapName);
  if FileMapHandle <> 0 then
  begin
    FileMapData := MapFile(FileMapHandle);
    if FileMapData <> nil then
    begin
      if FileMapData.Enabled and (Code = HC_ACTION) then
      begin
        Data := tagCWPSTRUCT(Pointer(lParam)^);
        if Data.message = WM_ACTIVATE then
          if LOWORD(Data.wParam) = WA_INACTIVE then
          begin
            AddLayer(Data.hwnd);
            ApplyAlpha(Data.hwnd, FileMapData.AlphaValue);
          end
          else if Bool(GetWindowLong(Data.hwnd, GWL_EXSTYLE) and WS_EX_LAYERED) then
            ApplyAlpha(Data.hwnd, 255);
      end;
      Result := CallNextHookEx(FileMapData.HookHandle, Code, wParam, lParam);
      UnmapFile(FileMapData);
    end;
    CloseFileMap(FileMapHandle);
  end;
end;
          
var
  FileMapHandle : THandle;
  FileMapData : PFileMapData;

function UnmapAndCloseFileMap : Boolean; stdcall;
begin
  Result := False;
  if UnmapFile(FileMapData) then
  begin
    FileMapData := nil;
    if CloseFileMap(FileMapHandle) then
    begin
      FileMapHandle := 0;
      Result := True;
    end;
  end;
end;

function SetHook(AlphaValue : Integer) : Boolean; stdcall;
begin
  Result := False;
  { Creates Initial Hook and File Map Data }
  if (FileMapData = nil) and (FileMapHandle = 0) then
  begin
    FileMapHandle := CreateFileMap(FileMapName, SizeOf(TFileMapData));
    if FileMapHandle <> 0 then
    begin
      FileMapData := MapFile(FileMapHandle);
      if FileMapData <> nil then
      begin
        FileMapData.AlphaValue := AlphaValue; 
        FileMapData.Enabled := True;
        FileMapData.TransTaskbar := False;
        FileMapData.HookHandle := SetWindowsHookEx(WH_CALLWNDPROC, HookFunc, HInstance, 0);
        if FileMapData.HookHandle = 0 then
          UnMapAndCloseFileMap
        else
        begin
          Result := True;
          AddLayerToAll;
          ApplyAlphaToAll(FileMapData.AlphaValue);
        end;
      end
      else
      begin
        CloseFileMap(FileMapHandle);
        FileMapHandle := 0;
      end;
    end;
  end;
end;

function FreeHook : Boolean; stdcall;
begin             
  Result := False;
  if (FileMapData <> nil) and (FileMapHandle <> 0) then   
    if UnhookWindowsHookEx(FileMapData.HookHandle) then
    begin
      Result := UnMapAndCloseFileMap;
      RemoveLayerFromAll;
    end;
end;
            
function Enabled : Boolean; stdcall; export;
begin
  Result := FileMapData.Enabled;
end;

procedure Enable; stdcall; export;
begin
  FileMapData.Enabled := True;
  AddLayerToAll;
  ApplyAlphaToAll(FileMapData.AlphaValue);
end;

procedure Disable; stdcall; export;
begin
  FileMapData.Enabled := False;
  RemoveLayerFromAll;
end;

function GetAlpha : Integer; stdcall; export;
begin
  Result := FileMapData.AlphaValue;
end;

procedure SetAlpha(Value : Integer); stdcall; export;
begin
  FileMapData.AlphaValue := Value;
  if FileMapData.Enabled then
  begin
    AddLayerToAll;
    ApplyAlphaToAll(FileMapData.AlphaValue);
  end;
end;

procedure AddExclusion(Handle : HWND; Name : ShortString); stdcall; export;
var 
  IniFile : TIniFile;
  Count : Integer;
begin
  RemoveLayer(Handle);
  IniFile := TIniFile.Create('FocusAlpha.ini');
  Count := IniFile.ReadInteger('Excluded', 'Count', 0)+1; 
  IniFile.WriteInteger('Excluded', 'Count', Count);
  IniFile.WriteString('Excluded', IntToStr(Count), Name);
  IniFile.Free;
end;

procedure RemoveExclusion(Index : Integer); stdcall; export;
var
  IniFile : TIniFile;
  Count, i : Integer;
begin
  IniFile := TIniFile.Create('FocusAlpha.ini');
  Count := IniFile.ReadInteger('Excluded', 'Count', 0)-1;
  IniFile.WriteInteger('Excluded', 'Count', Count);
  if Count > 1 then
    for i := Index+1 to Count do
      IniFile.WriteString('Excluded', IntToStr(i), IniFile.ReadString('Excluded', IntToStr(i+1), ''));
  IniFile.DeleteKey('Excluded', IntToStr(Count+1));  
  IniFile.UpdateFile;
  IniFile.Free;
end;
    
procedure ApplyToTaskbar; stdcall; export; 
var
  Handle : HWND;
begin
  FileMapData.TransTaskbar := True;       
  Handle := FindWindow('Shell_TrayWnd',nil);
  if FileMapData.Enabled and (Handle <> 0) then
  begin
    AddLayer(Handle);
    ApplyAlpha(Handle, FileMapData.AlphaValue);
  end;
end;

procedure ExcludeTaskbar; stdcall; export;
var
  Handle : HWND;
begin
  FileMapData.TransTaskbar := False;
  Handle := FindWindow('Shell_TrayWnd',nil);
  if Handle <> 0 then
    RemoveLayer(Handle);
end;

begin
  FileMapHandle := 0;
  FileMapData := nil;
end.
