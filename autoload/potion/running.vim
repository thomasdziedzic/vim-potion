function! potion#running#PotionCompileAndRunFile()
	silent !clear
	execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! potion#running#PotionShowBytecode()
	write

	" get the bytecode
	let bytecode = system(g:potion_command . " -c -V " . bufname("%") . " 2>&1")

	if v:shell_error
		echom "potion segfaulted. DOH!"
		return
	endif

	" open a new split and set it up
	let potion_bytecode_buffer_name = "__Potion_Bytecode__"
	let existing_buffer = bufwinnr(potion_bytecode_buffer_name)
	if existing_buffer == 1
		execute existing_buffer . "wincmd w"
		normal! ggdG
	else
		vsplit __Potion_Bytecode__
		setlocal filetype=potionbytecode
		setlocal buftype=nofile
	end

	" insert the bytecode
	call append(0, split(bytecode, '\v\n'))
endfunction
