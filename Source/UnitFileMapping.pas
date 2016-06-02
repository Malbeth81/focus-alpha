unit UnitFileMapping;

interface            

uses
  Windows, Messages, Classes, SysUtils;
                   
const
  FileMapName = 'AlphaTransHook';
type
  PFileMapData = ^TFileMapData;
  TFileMapData = record
    HookHandle : HHOOK;
    AlphaValue : Integer;
    Enabled,
    TransTaskbar : Boolean;
  end;

function CreateFileMap(Name: string; Size: Integer) : THandle; stdcall;
function OpenFileMap(Name: string) : THandle; stdcall;
function MapFile(Handle: THandle) : Pointer; stdcall;
function UnmapFile(P : Pointer) : Boolean; stdcall;
function CloseFileMap(Handle : THandle):  Boolean; stdcall;

implementation
                
uses UnitAlphaTrans;

function CreateFileMap(Name: string; Size: Integer) : THandle; stdcall;
begin
  Result := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, Size, PChar(Name));
  if Result <> 0 then
    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      CloseHandle(Result);
      Result := 0;
    end;
end;

function OpenFileMap(Name: string) : THandle; stdcall;
begin
  Result := OpenFileMapping(FILE_MAP_ALL_ACCESS, False, PChar(Name));
end;

function MapFile(Handle: THandle) : Pointer; stdcall;
begin
  Result := MapViewOfFile(Handle, FILE_MAP_ALL_ACCESS, 0, 0, 0);
end;

function UnmapFile(P : Pointer) : Boolean; stdcall;
begin
  Result := UnmapViewOfFile(P);
end;

function CloseFileMap(Handle : THandle):  Boolean; stdcall;
begin
  Result := CloseHandle(Handle);
end;

end.
 