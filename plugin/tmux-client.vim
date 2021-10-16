let g:pane = 1

"TMUX configs

function! MyEscape(cmd)
"	return shellescape(a:cmd)
 	return a:cmd
endfunction

function! SendToPane(val)
		execute "silent !tmux send-keys -t ".g:pane." '".a:val."' Enter"
		execute "redraw!"
endfunction

function! PasteToPane()
	"attention, la fonction prend la sélection 'yankée' avec y
	let exp = MyEscape(@")
	let tab= split(exp, "\n")	
	echom tab
	for line in tab
		execute "silent !tmux send-keys -t ".g:pane." '".line."' Enter"
	endfor
	execute "redraw!"
endfunction

function! TmuxSplit(command, orientation)
	let size = "10"
	if a:orientation == "-h"
		let size = "50"
	endif
	execute "silent !tmux split-window -l ".size." ".a:orientation." ".a:command
	execute "redraw!"
endfunction


