if exists("b:current_syntax")
	finish
endif

"syntax keyword potionbytecodeKeyword
syntax match potionbytecodeComment "\v;.*$"
highlight link potionbytecodeComment Comment

syntax match potionbytecodeNumber "\v\d+"
highlight link potionbytecodeNumber Number

syntax match potionbytecodeDirective "\v^\.\S+"
highlight link potionbytecodeDirective Statement

syntax match potionbytecodeSection "\v\-\-.*"
highlight link potionbytecodeSection SpecialComment

let b:current_syntax = "potion"
