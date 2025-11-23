:*:;dd::
    d =%A_YYYY%-%A_MM%-%A_DD%
    ;_%A_Hour%-%A_Min%-%A_Sec%
    clipboard = %d%
    Send ^v
    return
:*:;tt::
    d =%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec%
    clipboard = %d%
    Send ^v
    return
:*:;ed::
    ed = %A_YYYY%%A_MM%%A_DD%
    Clipboard =
    clipboard = %ed%
    Send ^v
    return
