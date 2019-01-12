@echo off
rem KaoriYa版Windows用Vimシンボリックリンク作成バッチファイル

rem 管理者権限チェック・昇格
openfiles > nul
if errorlevel 1 (
    PowerShell.exe -Command Start-Process \"%~f0\" -Verb runas
    exit
)

rem シンボリックリンク作成
cd %HOMEPATH%
mklink /D .vim "%~dp0vimfiles"
mklink _vimrc "%~dp0vimfilesﾂ･vimrc"
mklink /D vimfiles .vim
