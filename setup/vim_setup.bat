@echo off
rem KaoriYa版Windows用Vimシンボリックリンク作成バッチファイル

rem 管理者権限チェック・昇格
openfiles > nul
if errorlevel 1 (
	PowerShell.exe -Command Start-Process \"%~f0\" -Verb runas
	exit
)

rem 設定用パスの取得
pushd %~dp0..
set DOTPATH=%CD%
popd

rem シンボリックリンク作成
cd %HOMEPATH%
mklink /D .vim "%DOTPATH%\vimfiles"
mklink _vimrc "%DOTPATH%\vimfiles\vimrc"
mklink /D vimfiles .vim