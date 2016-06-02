unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ShellAPI, Grids, Registry, IniFiles,
  Menus;
    
const
  WM_TRAYCLICK = WM_USER+333;
    
type
  TfrmMain = class(TForm)
    btnApply: TButton;
    btnTerminate: TButton;
    btnOk: TButton;
    pgcSettings: TPageControl;
    tbsGeneral: TTabSheet;
    tbsExclusions: TTabSheet;
    stgExclusions: TStringGrid;
    grpSettings: TGroupBox;
    lblAlphaValue: TLabel;
    btnAddExclusion: TButton;
    btnRemoveExclusion: TButton;
    chkAutorun: TCheckBox;
    btnSelectWindow: TButton;
    trbAlphaValue: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    PopMenu: TPopupMenu;
    PopMenu_N1: TMenuItem;
    PopMenu_Exit: TMenuItem;
    PopMenu_Config: TMenuItem;
    chkTransTaskbar: TCheckBox;
    PopMenu_Enable: TMenuItem;
    PopMenu_Disable: TMenuItem;
    PopMenu_N2: TMenuItem;
    chkEnabled: TCheckBox;
    lblName: TLabel;
    imgIcon: TImage;
    lblVersion: TLabel;
    lblCopyright: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrayIconClick(var msg: TMessage); message WM_TRAYCLICK;
    procedure btnAddExclusionClick(Sender: TObject);
    procedure btnRemoveExclusionClick(Sender: TObject);
    procedure btnSelectWindowClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnTerminateClick(Sender: TObject);
    procedure DisplayExclusions;
    procedure SaveOptions;             
    procedure LoadOptions;
    procedure PopMenu_ConfigClick(Sender: TObject);
    procedure PopMenu_ExitClick(Sender: TObject);
    procedure PopMenu_EnableClick(Sender: TObject);
    procedure PopMenu_DisableClick(Sender: TObject);
  private
    TrayIconData : TNotifyIconData;
  public
  end;

var
  frmMain: TfrmMain;

function SetHook(AlphaValue : Integer) : Boolean; stdcall; external 'AlphaTrans.dll';
function FreeHook : Boolean; stdcall; external 'AlphaTrans.dll';
function Enabled : Boolean; stdcall; external 'AlphaTrans.dll';
procedure Enable; stdcall; external 'AlphaTrans.dll';
procedure Disable; stdcall; external 'AlphaTrans.dll';
function GetAlpha : Integer; stdcall; external 'AlphaTrans.dll';
procedure SetAlpha(Value : Integer); stdcall; external 'AlphaTrans.dll';
procedure AddExclusion(Handle : HWND; Name : ShortString); stdcall; external 'AlphaTrans.dll';
procedure RemoveExclusion(Index : Integer); stdcall; external 'AlphaTrans.dll';
procedure ApplyToTaskbar; stdcall; external 'AlphaTrans.dll';
procedure ExcludeTaskbar; stdcall; external 'AlphaTrans.dll';

implementation

{$R *.dfm}   
{$R Ressources\Trayicon.res}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  frmMain.Left := Screen.Width-frmMain.Width;
  frmMain.Top := Screen.Height-frmMain.Height-30;
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
  TrayIconData.cbSize := sizeof(TNotifyIconData);
  TrayIconData.Wnd := Handle;
  TrayIconData.uID := 123;
  TrayIconData.uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;
  TrayIconData.uCallbackMessage := WM_TRAYCLICK;
  TrayIconData.hIcon := LoadIcon(HInstance, 'Tray_Icon');
  TrayIconData.szTip := 'FocusAlpha';
  Shell_NotifyIcon(NIM_ADD, @TrayIconData);
  LoadOptions;
  SetHook(200);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  btnApply.Click;
  SaveOptions;
  FreeHook;
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
end;
    
procedure TfrmMain.FormShow(Sender: TObject);
begin
  chkEnabled.Checked := Enabled;
  DisplayExclusions;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
  Hide;
end;
        
procedure TfrmMain.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Point : tagPOINT;
  Handle : HWND;
  CName : array[0..100] of Char;
begin
  if not btnSelectWindow.Enabled then
  begin
    GetCursorPos(Point);
    Handle := WindowFromPoint(Point);
    if GetClassName(Handle, CName, sizeof(CName)) > 0 then
    begin
      AddExclusion(Handle, CName);
      DisplayExclusions;
      btnSelectWindow.Enabled := True;
      btnSelectWindow.Caption := 'Select';
    end;
    ReleaseCapture;
  end;
end;

procedure TfrmMain.TrayIconClick(var msg: TMessage);var
  Point : TPoint;
begin
  if (Msg.Msg = WM_TRAYCLICK) and (Msg.wParam = Integer(TrayIconData.uID)) then
    try
      case Msg.LParam of
        WM_RBUTTONUP : begin
          SetForeGroundWindow(frmMain.Handle);
          Application.ProcessMessages;
          GetCursorPos(Point);
          PopMenu.PopupComponent := Self;
          PopMenu.Popup(Point.X, Point.Y);
        end;
        WM_LBUTTONDBLCLK :
          PopMenu_Config.Click;
      end;
    except
      Application.HandleException(Self);
    end
  else
    Msg.Result := DefWindowProc(FrmMain.Handle, Msg.Msg, Msg.wParam, Msg.lParam);
  inherited;
end;
               
procedure TfrmMain.PopMenu_ConfigClick(Sender: TObject);
begin
  if frmMain.Visible then
    Application.BringToFront
  else
    frmMain.Show;
end;
 
procedure TfrmMain.PopMenu_EnableClick(Sender: TObject);
begin
  Enable;
  PopMenu_Enable.Enabled := False;
  PopMenu_Disable.Enabled := True;
end;

procedure TfrmMain.PopMenu_DisableClick(Sender: TObject);
begin
  Disable;
  PopMenu_Enable.Enabled := True;
  PopMenu_Disable.Enabled := False;
end;

procedure TfrmMain.PopMenu_ExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnAddExclusionClick(Sender: TObject);
var
  Input : ShortString;
begin
  Input := InputBox('Input', 'Name of window to exclude :', '');
  if Input <> '' then
    AddExclusion(0, Input);
  DisplayExclusions;
end;

procedure TfrmMain.btnRemoveExclusionClick(Sender: TObject);
begin
  RemoveExclusion(stgExclusions.Row-1);
  DisplayExclusions;
end;

procedure TfrmMain.btnSelectWindowClick(Sender: TObject);
begin
  SetCapture(frmMain.Handle);
  btnSelectWindow.Enabled := False;
  btnSelectWindow.Caption := 'Click on a window...';
end;

procedure TfrmMain.btnOkClick(Sender: TObject);
begin
  btnApply.Click;
  Close;
end;

procedure TfrmMain.btnApplyClick(Sender: TObject);
var
  Reg : TRegistry;
begin
  { Saves autorun in registry }
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', True) then
    begin
      if chkAutorun.Checked then
        Reg.WriteString('FocusAlpha', Application.ExeName)
      else
        Reg.DeleteValue('FocusAlpha');
      Reg.CloseKey;
    end;
    Reg.Free;
  except
    Reg.Free;
  end;
  if chkEnabled.Checked then
    popMenu_Enable.Click
  else
    popMenu_Disable.Click;
  if chkTransTaskbar.Checked then
    ApplyToTaskbar
  else
    ExcludeTaskbar;
  SetAlpha(trbAlphaValue.Position);
end;

procedure TfrmMain.btnTerminateClick(Sender: TObject);
begin
  PopMenu_Exit.Click;
end;

procedure TfrmMain.DisplayExclusions;
var
  IniFile : TIniFile;
  Count, i : Integer;
begin
  IniFile := TIniFile.Create('FocusAlpha.ini');
  Count := IniFile.ReadInteger('Excluded', 'Count', 0);
  if Count > 0 then
  begin
    stgExclusions.RowCount := Count+1;
    for i := 1 to Count do
      stgExclusions.Cells[0,i] := IniFile.ReadString('Excluded', IntToStr(i), '')
  end
  else
  begin
    stgExclusions.RowCount := 2;
    stgExclusions.Cells[0,1] := '';
  end;
  IniFile.Free;
end;
        
procedure TfrmMain.SaveOptions;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('FocusAlpha.ini');
  IniFile.WriteBool('Options', 'Autorun', chkAutorun.Checked);
  IniFile.UpdateFile;
  IniFile.Free;
end;

procedure TfrmMain.LoadOptions;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('FocusAlpha.ini');
  chkAutorun.Checked := IniFile.ReadBool('Options', 'Autorun', True);
  IniFile.Free;
end;

end.
