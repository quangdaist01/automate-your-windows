CoordMode, Pixel, Screen
#inputlevel 1

; Switch between 2 typing modes in Unikey
SwitchToTyping(mode)
{
    PixelSearch, FoundX, FoundY, 1831, 1043, 1866, 1079, 0xE6D2D2, 0, Fast RGB
    if (mode == "vietnamese")
    {
    If ErrorLevel
        {
            Send !z
        }
    }
    if (mode == "english")
    {
        If ErrorLevel = 0
        {
            Send !z
        }
    }

    ; some windows also trigger Alt+Z hotkey so I will try do "undo" that
    exeName := getExeOfCurrentWindow()
    if (exeName = "WINWORD.EXE")
        Send, {ESC 2}
    else if (exeName = "anki.exe")
    {
        Send, {BS}
    }
    else if (exeName = "POWERPNT.EXE")
        Send, {ESC}
}

#If not WinActive("ahk_exe pycharm64.exe")

:*?:e'::
SwitchToTyping("english")
return

:*?:v'::
SwitchToTyping("vietnamese")
return

#If

getExeOfCurrentWindow()
{
    PID = 0
    WinGet, hWnd,, A
    DllCall("GetWindowThreadProcessId", "UInt", hWnd, "UInt *", PID)
    hProcess := DllCall("OpenProcess",  "UInt", 0x400 | 0x10, "Int", False
                                     ,  "UInt", PID)
    PathLength = 260*2
    VarSetCapacity(FilePath, PathLength, 0)
    DllCall("Psapi.dll\GetModuleFileNameExW", "UInt", hProcess, "Int", 0
                                 , "Str", FilePath, "UInt", PathLength)
    DllCall("CloseHandle", "UInt", hProcess)
    pathSplits := StrSplit(FilePath, "\")
    exeName := pathSplits[pathSplits.MaxIndex()]
    return exeName
}
