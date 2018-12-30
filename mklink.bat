@echo off
rem KaoriYa版Windows用Vimシンボリックリンク作成バッチファイル

rem 管理者権限チェック・昇格
openfiles > nul
if errorlevel 1 (
    PowerShell.exe -Command Start-Process \"%~f0\" -Verb runas
    exit
)

set /P DOTPATH="dotfilesディレクトリのフルパス: "

cd %HOMEPATH%
mklink /D .vim "%DOTPATH%\vimfiles"
mklink _vimrc "%DOTPATH%\.vimrc"
mklink /D vimfiles .vim
