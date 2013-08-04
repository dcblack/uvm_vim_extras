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

#Archive contents

- doc/README_uvm.html   -- this file                                   
- syntax/sv.vim         -- SystemVerilog & UVM highlighting            
- syntax/log.vim        -- logfile highlighting (e.g. errors in red)   
- etc/colors.vim        -- used by syntax files                        
- etc/sv.dict           -- used by SystemVerilog highlighting          
- ftdetect/sv.vim       -- specifies filename extensions to which this applies

#Installation

The following apply to Linux/UNIX installations. Please adjust yourself if using
Windows.

To install as-is from the "vimball" with VIM or GVIM, simply open in the editor
and type:

    :source %

To install from GitHub, clone/update and then make the vimball. Follow above
instructions.

-------
The end
