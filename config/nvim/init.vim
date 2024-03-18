" vim: set ts=4 sw=4 expandtab:

"    Copyright (C) 2013-2024 Matthew Langbehn
"
"    This program is free software: you can redistribute it and/or modify
"    it under the terms of the GNU General Public License as published by
"    the Free Software Foundation, either version 3 of the License, or
"    (at your option) any later version.
"
"    This program is distributed in the hope that it will be useful,
"    but WITHOUT ANY WARRANTY; without even the implied warranty of
"    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"    GNU General Public License for more details.
"
"    You should have received a copy of the GNU General Public License
"    along with this program.  If not, see <http://www.gnu.org/licenses/>.

" Default stuff...figure this out later...
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Fix Python3 issues
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'
set pyxversion=3

" Source old .vimrc
source ~/.vimrc
