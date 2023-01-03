augroup filetypedetect
    au BufRead, BufNewFile *.py setfiletype python
    au BufRead, BufNewFile *.sh setfiletype shell
augroup END