; �˽ű��Ǵ���̳������������Ľű�������
; ��������. �Ѹ�л�͸� ck, thinkstorm, Chris,
; �� aurelian �����ù���.

; ������ʷ:
; 2006.11.07: �Ż��� !RButton �еĴ�С��������, courtesy of bluedawn.
; 2006.02.05: �޸� double-alt (~Alt �ȼ�) ��ʹ������������� AHK �汾.

; ˫ Alt ���μ���ͨ������
; Alt �����������, ����˫��. �ڶ���ʱ���ְ�ס,
; һֱ�������.
;
; ��ݼ�:
;  Alt + Left Button  : �϶����ƶ�����.
;  Alt + Right Button : �϶����������ڴ�С.
;  Double-Alt + Left Button   : ��С������.
;  Double-Alt + Right Button  : ���/��ԭ����.
;  Double-Alt + Middle Button : �رմ���.
;
; ���������״ε�� Alt ��
; �ɿ��������������������ж���ס.

If (A_AhkVersion < "1.0.39.00")
{
    MsgBox,20,,This script may not work properly with your version of AutoHotkey. Continue?
    IfMsgBox,No
    ExitApp
}


; �������ҵ�ϵͳ�����е���˳��
; ������. �������Կ��� CPU ��
; �ٶ�, ������Ҫ���ӻ��С���ֵ.
SetWinDelay,0

CoordMode,Mouse
return

!LButton::
If DoubleAlt
{
    MouseGetPos,,,KDE_id
    ; ����Ϣ�󲿷�ʱ���൱�� WinMinimize,
    ; ������������������ PSPad ʱ������.
    PostMessage,0x112,0xf020,,,ahk_id %KDE_id%
    DoubleAlt := false
    return
}
; ��ȡ��ʼ�����λ�úʹ��� id, ��
; �ڴ��ڴ������״̬ʱ����.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; ��ȡ��ʼ�Ĵ���λ��.
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
Loop
{
    GetKeyState,KDE_Button,LButton,P ; �����ť�Ѿ����ɿ������˳�.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; ��ȡ��ǰ�����λ��.
    KDE_X2 -= KDE_X1 ; �õ�����ԭ�����λ�õ�ƫ��.
    KDE_Y2 -= KDE_Y1
    KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; �����ƫ��Ӧ�õ�����λ��.
    KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
    WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2% ; �ƶ����ڵ��µ�λ��.
}
return

!RButton::
If DoubleAlt
{
    MouseGetPos,,,KDE_id
    ; ����󻯺ͻ�ԭ״̬���л�.
    WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
    If KDE_Win
        WinRestore,ahk_id %KDE_id%
    Else
        WinMaximize,ahk_id %KDE_id%
    DoubleAlt := false
    return
}
; ��ȡ��ʼ�����λ�úʹ��� id, ��
; �ڴ��ڴ������״̬ʱ����.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; ��ȡ��ʼ�Ĵ���λ�úʹ�С.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
; ������굱ǰ�����Ĵ�������.
; �ĸ���Ϊ����, ����, ���º�����.
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
    GetKeyState,KDE_Button,RButton,P ; �����ť�Ѿ��ɿ������˳�.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; ��ȡ��ǰ���λ��.
    ; ��ȡ��ǰ�Ĵ���λ�úʹ�С.
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    KDE_X2 -= KDE_X1 ; �õ�����ԭ�����λ�õ�ƫ��.
    KDE_Y2 -= KDE_Y1
    ; Ȼ������Ѷ���������ж���.
    WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; ��С�����󴰿ڵ� X ����
                            , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; ��С�����󴰿ڵ� Y ����
                            , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; ��С�����󴰿ڵ� W (���)
                            , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; ��С�����󴰿ڵ� H (�߶�)
    KDE_X1 := (KDE_X2 + KDE_X1) ; Ϊ��һ�ε��ظ��������ó�ʼλ��.
    KDE_Y1 := (KDE_Y2 + KDE_Y1)
}
return

; "Alt + MButton" ���ܼ��˵�, ������
; ϲ�����������Ĳ���
; ���Ӷ���İ�ȫ���.
!MButton::
If DoubleAlt
{
    MouseGetPos,,,KDE_id
    WinClose,ahk_id %KDE_id%
    DoubleAlt := false
    return
}
return

; ������ alt ����˫��.
~Alt::
DoubleAlt := A_PriorHotKey = "~Alt" AND A_TimeSincePriorHotkey < 400
Sleep 0
KeyWait Alt  ; ���������˼��̵��Զ��ظ����ܵ�����.
return