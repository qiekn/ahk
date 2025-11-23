Run %A_ScriptDir%\core\hhkb.ahk
Run %A_ScriptDir%\core\hot_string_assistant.ahk
Run %A_ScriptDir%\core\easy_window_drag.ahk

Run %A_ScriptDir%\espanso\sentences.ahk
Run %A_ScriptDir%\espanso\shortcuts.ahk
Run %A_ScriptDir%\espanso\time.ahk

SelfKill =
(
bat file
del %A_ScriptFullPath%
del `%0
)

FileAppend,%SelfKill%,SelfKill.bat

Run,SelfKill.bat
