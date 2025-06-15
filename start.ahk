Run %A_ScriptDir%\hhkb.ahk
;Run %A_ScriptDir%\WindowShading.ahk
;Run %A_ScriptDir%\EverNote-editor.ahk
Run %A_ScriptDir%\HotStringAssistant.ahk
Run %A_ScriptDir%\EasyWindowDrag.ahk


SelfKill =
(
bat file
del %A_ScriptFullPath%
del `%0
)

FileAppend,%SelfKill%,SelfKill.bat

Run,SelfKill.bat