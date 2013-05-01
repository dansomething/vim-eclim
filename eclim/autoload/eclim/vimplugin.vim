" Author:  Eric Van Dewoestine
"
" Description: {{{
"   Contains any global vim side code for embedding gvim in eclipse.
"
" License:
"
" Copyright (C) 2005 - 2011  Eric Van Dewoestine
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

" BufferWritten() {{{
" Invoked when a buffer opened from eclipse is saved, to notify eclipse of the
" save.
function eclim#vimplugin#BufferWritten()
  if has('netbeans_enabled') && exists('g:vimplugin_running')
    if exists('b:eclim_file_modified')
      unlet b:eclim_file_modified
    endif
    nbkey unmodified
  endif
endfunction " }}}

" BufferModified() {{{
" Invoked on cursor hold to check if a previously modified buffer is now
" unmodified, and vice versa, so that eclipse can be notified.
function eclim#vimplugin#BufferModified()
  if has('netbeans_enabled') && exists('g:vimplugin_running')
    if !exists('b:eclim_file_modified')
      let b:eclim_file_modified = &modified
    endif

    if &modified != b:eclim_file_modified
      unlet b:eclim_file_modified
      exec 'nbkey ' . (&modified ? 'modified' : 'unmodified')
    endif
    let b:eclim_file_modified = &modified
  endif
endfunction " }}}

" BufferClosed() {{{
" Invoked when a buffer is removed from a window to signal that eclipse should
" close the associated editor tab. This is only needed for external vim +
" tabbed mode.
function eclim#vimplugin#BufferClosed()
  if has('netbeans_enabled') && exists('g:vimplugin_tabbed')
    exec 'nbkey fileClosed ' . expand('<afile>:p')
  endif
endfunction " }}}

" BufferEnter() {{{
" Invoked when switching buffers so we can update the eclipse tab title.
function eclim#vimplugin#BufferEnter()
  if has('netbeans_enabled') && exists('g:vimplugin_running')
    exec 'nbkey bufferEnter ' . expand('<afile>:p')
  endif
endfunction " }}}

" FeedKeys(keys, [refocusGvim]) {{{
" Feeds eclipse compatible key string to eclipse if current gvim instance is
" attached via the netbeans protocol.
function eclim#vimplugin#FeedKeys(keys, ...)
  if has('netbeans_enabled') && exists('g:vimplugin_running')
    let refocus = a:0 > 0 && a:1 ? ',refocus' : ''
    silent exec 'nbkey feedkeys ' . a:keys . refocus
  endif
endfunction " }}}

" vim:ft=vim:fdm=marker
