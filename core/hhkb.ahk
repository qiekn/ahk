CapsLock::Ctrl

#IfWinNotActive ahk_exe emacs.exe

^k::Send {Up}
^h::Send {Left}
^j::Send {Down}
^l::Send {Right}

^!h::Send {Home}
^!l::Send {End}

#IfWinNotActive
