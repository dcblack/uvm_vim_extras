*Please read this **entire** document **before** installing.*

#License

These VIM scripts/add-ons are part of David Black's work environment, and are
licensed free for use by others under Apache 2.0 license. They augment
SystemVerilog and UVM development.

-------------------------------------------------------------------------------
Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License.  You may obtain a copy of the
License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied.  See the License for the
specific language governing permissions and limitations under the License.
-------------------------------------------------------------------------------

#Archive contents

- doc/README_uvm.html   -- this file                                   
- syntax/sv.vim         -- SystemVerilog & UVM highlighting            
- syntax/log.vim        -- logfile highlighting (e.g. errors in red)   
- etc/colors.vim        -- used by syntax files                        
- etc/sv.dict           -- used by SystemVerilog highlighting          
- ftdetect/sv.vim       -- specifies filename extensions to which this applies

#Installation

**IMPORTANT:** Requires *Vim version **7.0** or better*, which may be obtained from
[**VIm.org**](http:://www.vim.org)

The following apply to Linux/UNIX installations. Please adjust yourself if using
Windows.

To install as-is from the "vimball" with VIM or GVIM, simply open in the editor
and type:

    :source %

To learn more about vimball, use the vim command:

    :help vimball

Alternately, if you get the files in a tarball, be sure to install them under
your vim person initialization directory. Per vim help:

  Places for your personal initializations:

    Linux/OS-X: $HOME/.vimrc or $HOME/.vim/vimrc
    MS-Windows: $HOME/_vimrc, $HOME/vimfiles/vimrc or $VIM/_vimrc

  RECOMMENDATION: Put all your Vim configuration stuff in the
  $HOME/.vim/ directory ($HOME/vimfiles/ for MS-Windows). That makes it
  easy to copy it to another system.

  The files are searched in the order specified above and only the first
  one that is found is read.

To install from GitHub, clone/update and then either make a vimball or follow
non-vimball approach above. YMMV

**NOTE:** If syntax coloring does not take effect when you open a file, it is
because a mapping to the new `sv` syntax file may be missing. You may need to
edit your $VIMHOME/filetype.vim or $VIMHOME/scripts.vim file to recognize your
file. Alternately, you can enter a comment line of the format:
/*vim: syntax=sv*/ as the the last line of your file, or manually issue the vim
command:

    :set syntax=sv

whenever you edit a systemverilog file.

-------
The end 
vim:syntax=markdown
