#Include switch_unikey_modes.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn All, StdOut  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#If WinActive("ahk_exe Notion.exe")

:?*:c'::
SendInput, :white check
Sleep, 100
Send, {Enter}
return

:?*:a'::
SendInput, :alert
Sleep, 100
Send, {Enter}
return

:?*:>>::
SendInput, /callout
Sleep, 100
Send, {Enter}
return

:?*:m'::
SwitchToTyping("english")
Send, [MOOC]{Space}
return

:?*:[::
Send, ^[
return

:?*:]::
Send, ^+u
return

AppsKey::
Loop
{
    If !GetKeyState("AppsKey","P")
        {
            Send, {Shift up}
            Break
        }
    else
        Send, {Shift down}
}
return

;~^+::
;Send, ^{+}
;Send, ^{+}
;Send, ^{+}
;return

;~^-::
;Send, ^{-}
;Send, ^{-}
;Send, ^{-}
;return


^!+m::
WinGetPos,,, Width, Height, ahk_exe Notion.exe
WinMove, ahk_exe Notion.exe,, -10, -75, 1940, 1130
return


^PgUp::
Send, ^+{Tab}
return

^PgDn::
Send, ^{Tab}
return

