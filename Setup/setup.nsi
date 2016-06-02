  SetCompressor lzma
# Variables
  !define Product "FocusAlpha"
  !define Version "2.0.0"

# Configuration
  Name "${Product} ${Version}"
  OutFile "..\FocusAlphaSetup.exe"
  InstallDir "$PROGRAMFILES\${Product}"
  InstallDirRegKey HKLM "Software\${Product}" "Install Dir"
  XPStyle On
  
# Modern UI Configuration
  !include "MUI.nsh"
  !define MUI_ICON "images\install.ico"
  !define MUI_UNICON "images\uninstall.ico"
  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "images\install.bmp"
  !define MUI_HEADERIMAGE_UNBITMAP "images\uninstall.bmp"
  !define MUI_HEADERIMAGE_RIGHT
  !define MUI_WELCOMEFINISHPAGE_BITMAP "images\welcome.bmp"
  !define MUI_ABORTWARNING
  !define MUI_WELCOMEPAGE_TITLE_3LINES

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES

  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

  !insertmacro MUI_LANGUAGE "English"

# Begin Section
Section "FocusAlpha" SecMain
  ;Add files
  SetOutPath "$INSTDIR"
  SetOverWrite On
  File "FocusAlpha.exe"
  File "AlphaTrans.dll"
  File "License.txt"
  File "Changes.txt"

  ;Create start-menu items
  CreateShortCut "$SMPROGRAMS\FocusAlpha.lnk" "$INSTDIR\FocusAlpha.exe" "" "$INSTDIR\FocusAlpha.exe" 0

  ;Write autorun information to the registry
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Run" "${Product}" "$INSTDIR\FocusAlpha.exe"

  ; Write installation information to the registry
  WriteRegStr HKLM "Software\${Product}" "Install Dir" "$INSTDIR"
  WriteRegDWORD HKLM "Software\${Product}" "Install Language" $LANGUAGE

  ;Write uninstall information to the registry
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${Product}" "DisplayIcon" "$INSTDIR\FocusAlpha.exe,0"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${Product}" "DisplayName" "${Product}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${Product}" "UninstallString" "$INSTDIR\Uninstall.exe"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${Product}" "ModifyPath" "$INSTDIR"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${Product}" "NoModify" 1

  ; Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

# Installer Functions
Function .onInit
  MessageBox MB_OK "Warning!! Before you proceed with the installation make sure that you close FocusAlpha if it is already installed on your computer!"
FunctionEnd

Function .onInstSuccess
  Exec "$INSTDIR\FocusAlpha.exe"
FunctionEnd

# Uninstaller Section
Section "Uninstall"
  ;Delete Files And Directory
  Delete "$INSTDIR\*.*"
  RmDir "$INSTDIR"

  ;Delete Shortcuts
  Delete "$SMPROGRAMS\FocusAlpha.lnk"

  ;Delete autorun information to the registry
  DeleteRegValue HKEY_CURRENT_USER "Software\Microsoft\Windows\CurrentVersion\Run" "${Product}"

  ;Delete Uninstaller And Unistall Registry Entries
  DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\${Product}"
  DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${Product}"
SectionEnd

# Uninstaller Functions
Function un.onInit
  MessageBox MB_OK "Warning!! Make sure to close FocusAlpha before proceeding with uninstallation!"
FunctionEnd