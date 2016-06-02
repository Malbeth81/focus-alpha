@Echo off
Echo.
Echo =============================
Echo  Compiling source
Echo =============================
Echo.
Del Bin\AlphaTrans.dll
Del Bin\FocusAlpha.exe
Del Setup\AlphaTrans.dll
Del Setup\FocusAlpha.exe
cd Source
C:\Programs\Borland\Delphi6\Bin\DCC32 AlphaTrans
C:\Programs\Borland\Delphi6\Bin\DCC32 FocusAlpha
cd ..
cd Bin
copy FocusAlpha.exe ..\Setup\
copy AlphaTrans.dll ..\Setup\
Echo.
Echo =============================
Echo  Done
Echo =============================
Echo.
Pause