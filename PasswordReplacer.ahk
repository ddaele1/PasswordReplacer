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

::setpass::
SetPassword()
return

:*:mpass::
pass := "Epsilon29992"
SendInput %pass%
return
