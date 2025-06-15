#singleinstance force


SetWinDelay,0

CoordMode, Mouse
return

CapsLock & LButton::
If DoubleCheck
{
    MouseGetPos,,,KDE_id
    PostMessage,0x112,0xf020,,,ahk_id %KDE_id%
    DoubleCheck := false
    return
}
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
Loop
{
    GetKeyState,KDE_Button,LButton,P
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2
    KDE_X2 -= KDE_X1
    KDE_Y2 -= KDE_Y1
    KDE_WinX2 := (KDE_WinX1 + KDE_X2)
    KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
    WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2%
}
return

CapsLock & RButton::
If DoubleCheck
{
    MouseGetPos,,,KDE_id

    WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
    If KDE_Win
        WinRestore,ahk_id %KDE_id%
    Else
        WinMaximize,ahk_id %KDE_id%
    DoubleCheck := false
    return
}
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
   KDE_WinLeft := 1
Else
   KDE_WinLeft := -1
If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
   KDE_WinUp := 1
Else
   KDE_WinUp := -1
Loop
{
    GetKeyState,KDE_Button,RButton,P
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2

    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    KDE_X2 -= KDE_X1
    KDE_Y2 -= KDE_Y1

    WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2
                            , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2
                            , KDE_WinW  -     KDE_WinLeft  *KDE_X2
                            , KDE_WinH  -       KDE_WinUp  *KDE_Y2
    KDE_X1 := (KDE_X2 + KDE_X1)
    KDE_Y1 := (KDE_Y2 + KDE_Y1)
}
return

CapsLock & MButton::
If DoubleCheck
{
    MouseGetPos,,,KDE_id
    WinClose,ahk_id %KDE_id%
    DoubleCheck := false
    return
}
return

~CapsLock::
DoubleCheck := A_PriorHotKey = "~CapsLock" AND A_TimeSincePriorHotkey < 400
Sleep 0
KeyWait CapsLock
return
