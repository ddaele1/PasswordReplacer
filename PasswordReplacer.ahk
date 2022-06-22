#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force	
#NoTrayIcon

; plaats nieuw passwoord in een ini file
SetPassword()
{
	InputBox, newPass, Wachtwoord, Voer hier je huidig wachtwoord in., hide
	IniWrite, %newPass%, PRSettings.ini, settings, ww
	MsgBox, Je huidig ww is opgeslagen.
}

; Haal het passwoord uit de ini file
GetPassword()
{
	IniRead, readPass, PRSettings.ini, settings, ww
	return %readPass%
}

::setpass::
SetPassword()
return

:*:mpass::
if !FileExist("PRSettings.ini")
{
	MsgBox, Er is geen wachtwoord opgeslagen. Tik setpass + enter in om er een aan te maken.
	return
}
else
{
 pass := GetPassword()
 SendInput %pass%
 return
 }
