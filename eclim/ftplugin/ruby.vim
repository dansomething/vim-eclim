" Author:  Eric Van Dewoestine
"
" Description: {{{
"   see http://eclim.org/vim/ruby/index.html
"
" License:
"
" Copyright (C) 2005 - 2013  Eric Van Dewoestine
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.
"
" }}}

" Global Variables {{{

if !exists("g:EclimRubyValidate")
  let g:EclimRubyValidate = 1
endif

if !exists("g:EclimRubySyntasticEnabled")
  let g:EclimRubySyntasticEnabled = 0
endif

" }}}

" Options {{{

exec 'setlocal ' . g:EclimCompletionMethod . '=eclim#ruby#complete#CodeComplete'

" disable syntastic
if exists('g:loaded_syntastic_plugin') && !g:EclimRubySyntasticEnabled
  let g:syntastic_ruby_checkers = []
endif

" }}}

" Autocmds {{{

augroup eclim_ruby
  autocmd! BufWritePost <buffer>
  autocmd BufWritePost <buffer> call eclim#lang#UpdateSrcFile('ruby')
augroup END

" }}}

" Command Declarations {{{

command! -nargs=0 -buffer Validate :call eclim#lang#UpdateSrcFile('ruby', 1)

if !exists(":RubySearch")
  command -buffer -nargs=*
    \ -complete=customlist,eclim#ruby#search#CommandCompleteRubySearch
    \ RubySearch :call eclim#ruby#search#Search('<args>')
endif

if !exists(":RubySearchContext")
  command -buffer RubySearchContext :call eclim#ruby#search#SearchContext()
endif

" }}}

" vim:ft=vim:fdm=marker
