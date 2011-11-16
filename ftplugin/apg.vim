" Name: apg.vim
" Author: Sean Caulfield <sean@yak.net>
" Summary: Command to quickly insert a randomly generated password
" Licence: GPLv2

function GeneratePasswd()
	let e = shellescape('"$''()*;<=>[\]^`{|}', 1)
	let p = " " . system('apg -n1 -a1 -m16 -MSNCL -d -E ' . e)
	execute "normal A\<C-R>=p\<CR>\<ESC>"
endfunction

function MapKeys()
	map <F12> :call GeneratePasswd()<CR>
endfunction

augroup APG
autocmd!
autocmd BufNewFile,BufReadPre,FileReadPre *.\(gpg\|asc\|pgp\) call MapKeys()
augroup END

