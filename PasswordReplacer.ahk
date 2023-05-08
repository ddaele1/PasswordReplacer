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

; Lees het passwoord uit de ini file
GetPassword()
{
	IniRead, readPass, PRSettings.ini, settings, ww
	return %readPass%
}

; Plaats gebuiker in een ini file
SetUser1()
{
	InputBox, newUser, Gebruikersnaam, Voer hier je gebruikersnaam in.
	IniWrite, %newUser%, PRSettings.ini, settings, user
	MsgBox, Je gebruikersnaam is opgeslagen.
}

; Lees de gebruiker uit de ini file
GetUser()
{
	IniRead, readUser, PRSettings.ini, settings, user
	return %readUser%
}

::setuser::
SetUser1()
return

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
 SendRaw %pass%
 return
}
 
:*:muser::
{
user := GetUser()
SendInput %user%
return
}

 
