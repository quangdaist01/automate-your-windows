#SingleInstance Force
SetWorkingDir %A_ScriptDir%
;if not A_IsAdmin
;	Run *RunAs "%A_ScriptFullPath%" ; (A_AhkPath is usually optional if the script has the .ahk extension.) You would typically check  ;first.


CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

SetKeyDelay, 1

RCtrl & Up:: ; Send Ctrl + A
Send, ^a
return

RCtrl & Left:: ; Send Ctrl + X
Send, ^x
return

RCtrl & Right:: ; Send Ctrl + V
Send, ^v
return

RCtrl & Down:: ; Send Ctrl + C
Send, ^c
return

:?*:f':: ; Send F11, mostly to go to Fullscreen mode
Send {F11}
return

#c:: ; Activate Pycharm (Coding)
;:?*:c`;::
WinActivate ahk_exe pycharm64.exe
return

#n:: ; Activate Notion
;:?*:n`;::
WinActivate ahk_exe notion.exe
return

#t:: ; Activate Teams
;:?*:t`;::
WinActivate ahk_exe Teams.exe
return

#!e:: ; Open Explorer
Send, #e
return

#e:: ; Activate Edge in the LEFTMOST monitor
ChromeList := GetWinListByExe()

LeftmostPos := 9999
LeftmostId := ""
Loop, % ChromeList.MaxIndex()
{
    currentId := ChromeList[A_Index][1]
    currentX := ChromeList[A_Index][2]

    if (currentX < LeftmostPos)
    {
        LeftmostPos := currentX
        LeftmostId := currentId
    }
}

WinActivate, % "ahk_id" LeftmostId
Return

#r:: ; Activate Edge in the RIGHT monitor
ChromeList := GetWinListByExe()
RightmostPos := -9999
RightmostId := ""
Loop, % ChromeList.MaxIndex()
{
    currentId := ChromeList[A_Index][1]
    currentX := ChromeList[A_Index][2]

    if (currentX > RightmostPos)
    {
        RightmostPos := currentX
        RightmostId := currentId
    }
}

WinActivate, % "ahk_id" RightmostId
Return

GetWinListByExe()
{
    WinGet, edgeList, List, ahk_exe msedge.exe
    WinList := {}
    winCount := 1
    Loop, %edgeList%
    {
        WinGetClass, WClass, % "ahk_id " edgeList%A_Index%
        winId := edgeList%A_Index%
        WinGetPos, X, Y, W, H, % "ahk_id " winId
        WinList[winCount] := [winId, X]
        winCount++
    }

    return WinList
}


^Ins:: ; Send Ctrl + W, mostly to close a tab
Send, ^w
return

RCtrl & Delete:: ; Send Alt + Tab
#Space:: ; Send Alt + Tab
Gui, hide
Send, {Alt down}
Sleep, 100
Send, {Tab}
Sleep, 100
Send, {Alt up}
Sleep, 100
MoveMouseToCenterOfActiveWindow()
return


Break:: ; Lock the laptop
DllCall("user32\LockWorkStation")
return


moveMouseToCenterOfActiveWindow()
{
    CoordMode, Mouse, Screen
    WinGetActiveTitle, Title
    WinGetPos, X, Y, W, H, %Title%
;    msgbox, %Title%, %x%, %y% , %w%, %h%
    X := X + W//2
    Y := Y + H//2
;    msgbox, %Title%, %x%, %y%
    Click, %x% %y% 0
}

^;:: ; Type ';'
Send, {Text};
return

Insert:: ; Move the current window to the NEXT monitor
Send, #+{Right}
return

#+l:: ; Move the current window to the RIGHT monitor
send, #+{Right}
return

#+h:: ; Move the current window to the LEFT monitor
send, #+{Left}
return

^Space:: ; Change Unikey mode
Send, !z
return

PrintScreen:: ; Capture using Win # S
Send +#s
Return

!F10:: ; Reload the script
Msgbox, Script Reloaded
Reload
return

;CapsLock::Esc ; Map CapsLock -> Esc
;Esc::CapsLock ; Map Esc -> CapsLock

; ------------ Scroll on the taskbar to adjust the volume ------------
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp:: ; Scroll UP on the taskbar to INCREASE the volume
Send {Volume_Up}
Send {Volume_Up}
Send {Volume_Up}
Send {Volume_Up}
Send {Volume_Up}
return

WheelDown:: ; Scroll DOWN on the taskbar to DECREASE the volume
Send {Volume_Down}
Send {Volume_Down}
Send {Volume_Down}
Send {Volume_Down}
Send {Volume_Down}
return

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

#If

!F11:: ; Toggle the current window float on the top of the screen
WinSet, AlwaysOnTop, Toggle,A
Return

^':: ; Delete a word
Send, ^{BS}
Return

#':: ; Delete a character
Send, {BS}
Return

#w:: ; Disable Windows + C
;#k:: ; Disable Windows + K
#j:: ; Disable Windows + J
Return

#If WinActive("ahk_exe pycharm64.exe") or WinActive("ahk_exe msedge.exe")
!F4:: ; (Edge)(Pycharm) Disable Alt + F4
Return
#If

#z:: ; Hide/Show the taskbar
HideShowTaskbar()
return

HideShowTaskbar() {
   static SW_HIDE := 0, SW_SHOWNA := 8, SPI_SETWORKAREA := 0x2F
   DetectHiddenWindows, On
   hTB := WinExist("ahk_class Shell_TrayWnd")
   WinGetPos,,,, H
   hBT := WinExist("ahk_class Button ahk_exe Explorer.EXE")  ; for Windows 7
   b := DllCall("IsWindowVisible", "Ptr", hTB)
   for k, v in [hTB, hBT]
      ( v && DllCall("ShowWindow", "Ptr", v, "Int", b ? SW_HIDE : SW_SHOWNA) )
   VarSetCapacity(RECT, 16, 0)
   NumPut(A_ScreenWidth, RECT, 8)
   NumPut(A_ScreenHeight - !b*H, RECT, 12, "UInt")
   DllCall("SystemParametersInfo", "UInt", SPI_SETWORKAREA, "UInt", 0, "Ptr", &RECT, "UInt", 0)
   WinGet, List, List
   Loop % List {
      WinGet, res, MinMax, % "ahk_id" . List%A_Index%
      if (res = 1)
         WinMove, % "ahk_id" . List%A_Index%,, 0, 0, A_ScreenWidth, A_ScreenHeight - !b*H
   }
}

^#u:: ; Convert selected text to uppercase
Clipboard := ""
Sleep 50
Send ^c
ClipWait
StringUpper Clipboard, Clipboard
SendInput %Clipboard%
Return

;` & v:: ; Send Windows + V
;Send, {LWin Down}v{LWin Up}


; ------------ Open Google Search box ------------
toEncode :=	[" ","%", """", "#", "&"
 , "/", ":", ";", "<"
 , "=", ">", "?", "@"
 , "[", "\", "]", "^"
 , "``", "{", "|", "}", "~"]

e :=	["+","%25", "%22", "%23", "%26"
 , "%2F", "%3A", "%3B", "%3C"
 , "%3D", "%3E", "%3F", "%40"
 , "%5B", "%5C", "%5D", "%5E"
 , "%60", "%7B", "%7C", "%7D", "%7E"]


;;; Win + j
;#j::
#o:: ; Open Google Search box

InputBox, Search, Google Search,,,250, 100
if !ErrorLevel
{
;    For i, u in toEncode		; check/replace loop for unsafe chars
;	StringReplace, Search, Search, %	u, %	e[i], All
	if (InStr(Search, ".com") or InStr(Search, "http"))
	{
        Run, %Search% ;else use Google search
    }
	else
	{
        Run, http://www.google.com/search?q=%Search% ;else use Google search

    }
}
return

#If WinActive("ahk_exe Notion.exe")
^a:: ; (Notion) Disable Ctrl + A (It's a dangerous function :D)
Return

:?*:c':: ; (Notion) Send whitecheck symbol in notion
SendInput, :white check
Sleep, 100
Send, {Enter}
return

:?*:a':: ; Send alert symbol in notion
SendInput, :alert
Sleep, 100
Send, {Enter}
return

:?*:>>:: ; (Notion) Create a callout block in Notion
SendInput, /callout
Sleep, 100
Send, {Enter}
return

:?*:tt':: ; (Notion) Turn the current block into something else
Send, /tu%A_space%
return

^\:: ; (Notion) Go one tier up in the page hierarchy.
Send, ^+u
return

^+\:: ; (Notion) Open the sidebar
Send, ^\
return

;;;; I put the mouse on the LEFT and the LEFT shift is mapped to another function so it's hard to scroll horizontally
AppsKey:: ; (Notion) Hold shift key
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

:?*:p':: ; (Notion) Change the bg of the current block to Yellow (PENDING)
Send, /yellow b
Sleep, 300
Send, {Enter}
return

:?*:d':: ; (Notion) Change the bg of the current block to Blue (DOING)
Send, /blue b
Sleep, 300
Send, {Enter}
return

:?*:b':: ; (Notion) Change the bg of the current block to Black (BLACK)
Send, /black b
Sleep, 300
Send, {Enter}
return

:?*:x':: ; (Notion) Change the bg of the current block to Green (DONE ~ CHECKED)
Send, /green b
Sleep, 300
Send, {Enter}
return

; ------------ Move the current window ------------
#If not WinActive("ahk_exe Adobe Premiere Pro.exe") and not WinActive("ahk_exe Notion.exe")
~^+l:: ; Move the current window to the LEFT
wingetpos x, y,,, A   ; get coordinates of the active window
x += 100			  ; add 100 to the x coordinate
winmove, A,,%x%, %y%  ; make the active window use the new coordinates
return				  ; finish

~^+h:: ; Move the current window to the RIGHT
wingetpos x, y,,, A
x -= 100
winmove, A,,%x%, %y%
return

~^+k:: ; Move the current window UP
wingetpos x, y,,, A
y -= 100
winmove, A,,%x%, %y%
return

~^+j:: ; Move the current window DOWN
wingetpos x, y,,, A
y += 100
winmove, A,,%x%, %y%
return

!PrintScreen:: ; Play my favorite song
SoundPlay, D:\OneDrive - Trường ĐH CNTT - University of Information Technology\Storage\Music\y2mate.com - White noise black screen 3 hours no ads.mp3, wait
return

Title := ""
ScrollLock:: ; Control Sticky Notes
If not WinActive("Sticky Notes")
{
    WinGetTitle, Title, A
    WinActivate, Sticky Notes
}
Else
{
    WinActivate, %Title%
}
Return

#If WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe foxitreader.exe") or WinActive("ahk_exe Notion.exe")
^PgUp:: ; (Edge)(Foxit)(Notion) Switch to the PREVIOUS tab
:?*:[:: ; (Edge)(Foxit)(Notion) Switch to the PREVIOUS tab
WinGetTitle, Title, A
Text := "Colaboratory"
If InStr(Title, Text)
{
    Send, [
    return
}

Send, ^+{Tab}
return

^PgDn:: ; (Edge)(Foxit)(Notion) Switch to the NEXT tab
:?*:]:: ; (Edge)(Foxit)(Notion) Switch to the NEXT tab
WinGetTitle, Title, A
Text := "Colaboratory"
If InStr(Title, Text)
{
    Send, ]
    return
}

Send, ^{Tab}
return

#If WinActive("ahk_exe msedge.exe")
^g:: ; (Edge) Group the current tab
Send, {F6}
Sleep, 100
Send, {Appskey}
Sleep, 100
Send, {Down}
Sleep, 100
Send, {Right}
Sleep, 100
return

^.:: ; (Edge) Open Search Tab window
Send ^+a
Return

Scrolllock:: ; (Edge) Send Alt + N => Move the current tab to the next window
Send !n
Return
#If

; ------------ Haven't added to the office laptop

RAlt & Down:: ; RAlt + Left to reduce volume
Send {Volume_Down 5}
return

RAlt & Up::
Send {Volume_Up 5} ; RAlt + Right to increase volume
return
