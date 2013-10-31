" Vim filetype plugin file
" Language:    SystemVerilog (superset extension of Verilog)
" Maintainer:  David C Black <dcblack@hldwizard.com>
" Last Change: Sun Aug  4 06:36:59 CDT 2013 dcblack
" Version: 1.0

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" The following line could alternatively be copied into .vim/filetypes.sv
autocmd BufRead,BufNewFile *.v,*.vh,*.sv,*.svh,*.vlog   set filetype=sv

" Behaves just like Verilog
runtime! ftplugin/verilog.vim
