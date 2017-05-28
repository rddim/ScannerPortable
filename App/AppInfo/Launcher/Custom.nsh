;;; Add 'Show Usage with Scanner' to the context menu

;;; Define variables
!define STR1 `HKEY_CURRENT_USER\Software\Classes\Directory\shell\Scan_Content`
!define STR2 `HKEY_CURRENT_USER\Software\Classes\Drive\shell\Scan_Content`
!define STR3 `$EXEDIR\App\Scanner\Scanner.exe`
!define STR4 `$EXEDIR\ScannerPortable.exe "%1"`

;;; Execute customs
${SegmentFile}

;; Write reg keys on launch
${SegmentPre}
	${registry::Write} `${STR1}` `` `Show Usage with Scanner` `REG_SZ` $0
	${registry::Write} `${STR1}` `Icon` `${STR3}` `REG_SZ` $0
	${registry::Write} `${STR1}\command` `` `${STR4}` `REG_SZ` $0
	${registry::Write} `${STR2}` `` `Show Usage with Scanner` `REG_SZ` $0
	${registry::Write} `${STR2}` `Icon` `${STR3}` `REG_SZ` $0
	${registry::Write} `${STR2}\command` `` `${STR4}` `REG_SZ` $0
!macroend

;; CleanUp reg keys on exit
${SegmentPost}
	${registry::DeleteKey} `${STR1}` $0
	${registry::DeleteKey} `${STR2}` $0
!macroend
