" Vim syntax file
" Language:   SystemVerilog + UVM
" Maintainer: David C Black <dcblack@hldwizard.com>
" Modified:   $Updated: Sun Apr  8 05:45:24 CDT 2012 dcblack $
" Depends_on: Assumes few named colors: gold, sky and red from $HOME/.vim/etc/colors.vim
"             Uses $HOME/.vim/etc/sv.dict
" Notes:      See comments at end for categorization of SystemVerilog keywords
"             Includes UVM keywords.
"             Probably still incomplete.
"             Don't forget to update $HOME/.vim/filetype.vim with:
"               autocmd  BufRead,BufNewFile *.sv        setlocal filetype=sv
"               autocmd  BufRead,BufNewFile *.svh       setlocal filetype=sv
"               autocmd  BufRead,BufNewFile *.sva       setlocal filetype=sv

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

" Read Verilog syntax
runtime! syntax/verilog.vim
unlet b:current_syntax

" Set the local value of the 'iskeyword' option
if version >= 600
   setlocal iskeyword=@,48-57,_,192-255
else
   set iskeyword=@,48-57,_,192-255
endif

syn keyword Todo TBS NYI TO_BE_SUPPLIED NOT_YET_IMPLEMENTED
setlocal dict=$HOME/.vim/etc/sv.dict
setlocal errorfile="error.log"
" The following probably needs to be modified per simulator...
setlocal errorformat="%f:%l: %m"

"Matching
let b:match_words  = '[:],(:),{:},[/][*]:[*][/]'
let b:match_words .= ',\<\(rand\)\?case[xz]\?\>:\<endcase\>'
let b:match_words .= ',\<begin\>:\<end\>'
let b:match_words .= ',\<class\>:\<endclass\>'
let b:match_words .= ',\<clocking\>:\<endclocking\>'
let b:match_words .= ',\<config\>:\<endconfig\>'
let b:match_words .= ',\<covergroup\>:\<endgroup\>'
let b:match_words .= ',\<do\>:\<while\>'
let b:match_words .= ',\<fork\>:\<join\(_none\|_all\)\?\>'
let b:match_words .= ',\<function\>:\<endfunction\>'
let b:match_words .= ',\<if\>:\<else if\>:\<else\>'
let b:match_words .= ',\<interface\>:\<endinterface\>'
let b:match_words .= ',\<property\>:\<endproperty\>'
let b:match_words .= ',\<sequence\>:\<endsequence\>'
let b:match_words .= ',\<task:^\s*\<endtask\>'
let b:match_words .= ',^\s*\<\(macro\)\?module\>:^\s*\<endmodule\>'
let b:match_words .= ',^\s*\<checker\>:^\s*\<endchecker\>'
let b:match_words .= ',^\s*\<generate\>:^\s*\<endgenerate\>'
let b:match_words .= ',^\s*\<package:^\s*\<endpackage\>'
let b:match_words .= ',^\s*\<primitive\>:^\s*\<endprimitive\>'
let b:match_words .= ',^\s*\<program:^\s*\<endprogram\>'
let b:match_words .= ',^\s*\<specify\>:^\s*\<endspecify\>'
let b:match_words .= ',^\s*`if\(n\?def\)\?\>:^\s*`else\>:^\s*`endif\>'

" Folding (also see match_words)
:syn region begin_fold      start="\<begin\>"      end="\<end\>"          transparent fold contained
:syn region checker_fold    start="\<checker\>"    end="\<endchecker\>"   transparent fold contains=ALLBUT,module_fold 
:syn region class_fold      start="\<class\>"      end="\<endclass\>"     transparent fold
:syn region clocking_fold   start="\<clocking\>"   end="\<endclocking\>"  transparent fold
:syn region config_fold     start="\<config\>"     end="\<endconfig\>"    transparent fold contains=ALLBUT,program_fold
:syn region covergroup_fold start="\<covergroup\>" end="\<endgroup\>"     transparent fold contained
:syn region fork_fold       start="\<fork\>"       end="\<join\(_none\|all\)?\>" transparent fold contained
:syn region function_fold   start="\<function\>"   end="\<endfunction\>"  transparent fold contained
:syn region generate_fold   start="\<generate\>"   end="\<endgenerate\>"  transparent fold contained
:syn region interface_fold  start="\<interface\>"  end="\<endinterface\>" transparent fold
:syn region module_fold     start="\<module\>"     end="\<endmodule\>"    transparent fold contains=ALLBUT,program_fold
:syn region package_fold    start="\<package\>"    end="\<endpackage\>"   transparent fold contains=ALLBUT,module_fold 
:syn region primitive_fold  start="\<primitive\>"  end="\<endprimitive\>" transparent fold contains=ALLBUT,module_fold 
:syn region program_fold    start="\<program\>"    end="\<endprogram\>"   transparent fold contains=ALLBUT,module_fold 
:syn region property_fold   start="\<property\>"   end="\<endproperty\>"  transparent fold contained
:syn region sequence_fold   start="\<sequence\>"   end="\<endsequence\>"  transparent fold
:syn region specify_fold    start="\<specify\>"    end="\<endspecify\>"   transparent fold contains=ALLBUT,module_fold 
:syn region table_fold      start="\<table\>"      end="\<endtable\>"     transparent fold
:syn region task_fold       start="\<task\>"       end="\<endtask\>"      transparent fold contained
:syn sync fromstart
:set foldmethod=syntax

" All the SystemVerilog keywords
syn keyword svStatement  accept_on
syn keyword svStatement  alias
syn keyword svStatement  always_comb
syn keyword svStatement  always_ff
syn keyword svStatement  always_latch
syn keyword Alert        assert
syn keyword svStatement  assume
syn keyword svStatement  before
syn keyword svStatement  bind
syn keyword svStatement  bins
syn keyword svStatement  binsof
syn keyword svStatement  bit
syn keyword svStatement  break
syn keyword svStatement  byte
syn keyword svStatement  chandle
syn keyword svStatement  class
syn keyword svStatement  clocking
syn keyword svStatement  const
syn keyword svStatement  constraint
syn keyword svStatement  context
syn keyword svStatement  continue
syn keyword svStatement  cover
syn keyword svStatement  covergroup
syn keyword svStatement  coverpoint
syn keyword svStatement  cross
syn keyword svStatement  design
syn keyword svStatement  dist
syn keyword svStatement  do
syn keyword svStatement  endclass
syn keyword svStatement  endclocking
syn keyword svStatement  endgroup
syn keyword svStatement  endinterface
syn keyword svStatement  endpackage
syn keyword svStatement  endprogram
syn keyword svStatement  endproperty
syn keyword svStatement  endsequence
syn keyword svStatement  enum
syn keyword svStatement  error_bins
syn keyword svStatement  eventually
syn keyword svStatement  expect
syn keyword svStatement  export
syn keyword svStatement  extends
syn keyword svStatement  extern
syn keyword svStatement  final
syn keyword svStatement  first_match
syn keyword svStatement  foreach
syn keyword svStatement  forkjoin
syn keyword svStatement  iff
syn keyword svStatement  ifnone
syn keyword svStatement  ignore_bins
syn keyword svStatement  illegal_bins
syn keyword svStatement  implements
syn keyword svStatement  import
syn keyword svStatement  inside
syn keyword svStatement  int
syn keyword svStatement  interface
syn keyword svStatement  intersect
syn keyword svStatement  join_any
syn keyword svStatement  join_none
syn keyword svStatement  local
syn keyword svStatement  logic
syn keyword svStatement  longint
syn keyword svStatement  matches
syn keyword svStatement  modport
syn keyword svStatement  new
syn keyword svStatement  null
syn keyword svStatement  option
syn keyword svStatement  package
syn keyword svStatement  packed
syn keyword svStatement  priority
syn keyword svStatement  program
syn keyword svStatement  property
syn keyword svStatement  protected
syn keyword svStatement  pure
syn keyword svStatement  rand
syn keyword svStatement  randc
syn keyword svStatement  randcase
syn keyword svStatement  randomize
syn keyword svStatement  randsequence
syn keyword svStatement  ref
syn keyword svStatement  return
syn keyword svStatement  sample
syn keyword svStatement  sequence
syn keyword svStatement  shortint
syn keyword svStatement  shortreal
syn keyword svStatement  solve
syn keyword svStatement  static
syn keyword svStatement  string
syn keyword svStatement  struct
syn keyword svStatement  super
syn keyword svStatement  tagged
syn keyword svStatement  this
syn keyword svStatement  throughout
syn keyword svStatement  timeprecision
syn keyword svStatement  timeunit
syn keyword svStatement  type
syn keyword svStatement  type_option
syn keyword svStatement  typedef
syn keyword svStatement  union
syn keyword svStatement  unique
syn keyword svStatement  var
syn keyword svStatement  virtual
syn keyword svStatement  void
syn keyword svStatement  wait_order
syn keyword svStatement  wildcard
syn keyword svStatement  with
syn keyword svStatement  within

syn keyword svStd std process semaphore mailbox

syn keyword uvm_enum     UVM_ALL_ON
syn keyword uvm_enum     UVM_BIN
syn keyword uvm_enum     UVM_CALL_HOOK
syn keyword uvm_enum     UVM_COUNT
syn keyword uvm_enum     UVM_DEC
syn keyword uvm_enum     UVM_DISPLAY
syn keyword uvm_enum     UVM_ERROR
syn keyword uvm_enum     UVM_EXIT
syn keyword uvm_enum     UVM_FATAL
syn keyword uvm_enum     UVM_INFO
syn keyword uvm_enum     UVM_LOG
syn keyword uvm_enum     UVM_NOCOMPARE
syn keyword uvm_enum     UVM_NOPRINT
syn keyword uvm_enum     UVM_NO_ACTION
syn keyword uvm_enum     UVM_PRINT
syn keyword uvm_enum     UVM_RGM
syn keyword uvm_enum     UVM_STOP
syn keyword uvm_enum     UVM_WARNING

syn keyword Alert        REPORT_INFO REPORT_WARNING REPORT_ERROR REPORT_FATAL

syn keyword uvm_macros   uvm_add_to_seq_lib
syn keyword uvm_macros   uvm_component_utils uvm_component_param_utils
syn keyword uvm_macros   uvm_component_utils_begin
syn keyword uvm_macros   uvm_component_utils_end
syn keyword uvm_macros   uvm_create
syn keyword uvm_macros   uvm_create_on
syn keyword uvm_macros   uvm_create_seq
syn keyword uvm_macros   uvm_declare_p_sequencer
syn keyword uvm_macros   uvm_do
syn keyword uvm_macros   uvm_do_on
syn keyword uvm_macros   uvm_do_on_pri
syn keyword uvm_macros   uvm_do_on_pri_with
syn keyword uvm_macros   uvm_do_on_with
syn keyword uvm_macros   uvm_do_pri
syn keyword uvm_macros   uvm_do_pri_with
syn keyword uvm_macros   uvm_do_seq
syn keyword uvm_macros   uvm_do_seq_with
syn keyword uvm_macros   uvm_do_with
syn keyword uvm_macros   uvm_error
syn keyword uvm_macros   uvm_fatal
syn keyword uvm_macros   uvm_field_enum
syn keyword uvm_macros   uvm_field_int
syn keyword uvm_macros   uvm_info
syn keyword uvm_macros   uvm_object_utils uvm_object_param_utils
syn keyword uvm_macros   uvm_object_utils_begin
syn keyword uvm_macros   uvm_object_utils_end
syn keyword uvm_macros   uvm_rand_send
syn keyword uvm_macros   uvm_rand_send_pri
syn keyword uvm_macros   uvm_rand_send_pri_with
syn keyword uvm_macros   uvm_rand_send_with
syn keyword uvm_macros   uvm_send
syn keyword uvm_macros   uvm_send_pri
syn keyword uvm_macros   uvm_sequence_library_utils
syn keyword uvm_macros   uvm_warning

syn keyword uvm_class    uvm_phase 
syn keyword uvm_class    uvm_reg_sequence uvm_reg_block uvm_reg uvm_reg_field
syn keyword uvm_seq      uvm_reg_mem_built_in_seq uvm_reg_hw_reset_seq, uvm_reg_bit_hash_seq
syn keyword uvm_method   raise_objection drop_objection get_is_active

syn keyword uvm_data     analysis_port req rsp seq_item_port seq_item_export p_sequencer
syn keyword uvm_data     analysis_export starting_phase parent phase

syn keyword uvm_phase    build_phase
syn keyword uvm_phase    connect_phase
syn keyword uvm_phase    end_of_elaboration_phase
syn keyword uvm_phase    start_of_simulation_phase
syn keyword uvm_phase    run_phase
syn keyword uvm_phase    pre_reset_phase
syn keyword uvm_phase    reset_phase
syn keyword uvm_phase    post_reset_phase
syn keyword uvm_phase    pre_configure_phase
syn keyword uvm_phase    configure_phase
syn keyword uvm_phase    post_configure_phase
syn keyword uvm_phase    pre_main_phase
syn keyword uvm_phase    main_phase
syn keyword uvm_phase    post_main_phase
syn keyword uvm_phase    pre_shutdown_phase
syn keyword uvm_phase    shutdown_phase
syn keyword uvm_phase    post_shutdown_phase
syn keyword uvm_phase    extract_phase
syn keyword uvm_phase    check_phase
syn keyword uvm_phase    report_phase
syn keyword uvm_phase    final_phase

syn match   uvm_method   "::type_id::create"
syn keyword uvm_method   set_drain_time
syn keyword uvm_method   b_transport
syn keyword uvm_method   block
syn keyword uvm_method   body
syn keyword uvm_method   create
syn keyword uvm_method   connect
syn keyword uvm_method   convert2string do_copy do_compare sprint print print_topology
syn keyword uvm_method   put get peek try_put try_get try_peek can_put can_get can_peek read_by_name set write transform
syn keyword uvm_method   default_sequence
syn keyword uvm_method   do_global_phase
syn keyword uvm_method   do_print
syn keyword uvm_method   dump_report_state
syn keyword uvm_method   find
syn keyword uvm_method   get_name
syn keyword uvm_method   get_next_item
syn keyword uvm_method   get_sequence_path
syn keyword uvm_method   get_type_name
syn keyword uvm_method   global_stop_request
syn keyword uvm_method   item_done
syn keyword uvm_method   max_quit_count
syn keyword uvm_method   mid_do
syn keyword uvm_method   nb_transport_bw
syn keyword uvm_method   nb_transport_fw
syn keyword uvm_method   post_body
syn keyword uvm_method   post_do
syn keyword uvm_method   post_start
syn keyword uvm_method   pre_body
syn keyword uvm_method   pre_do
syn keyword uvm_method   pre_start
syn keyword uvm_method   ralgen
syn keyword uvm_method   regfile
syn keyword uvm_method   register
syn keyword uvm_method   report_hook
syn keyword uvm_method   report_summarize
syn keyword uvm_method   run_test
syn keyword uvm_method   set_config
syn keyword uvm_method   set_global_timeout
syn keyword uvm_method   set_inst_override_by_type
syn keyword uvm_method   set_report_default_file
syn keyword uvm_method   set_report_default_file_hier
syn keyword uvm_method   set_report_id_action
syn keyword uvm_method   set_report_id_action_hier
syn keyword uvm_method   set_report_id_file
syn keyword uvm_method   set_report_id_file_hier
syn keyword uvm_method   set_report_max_quit_count
syn keyword uvm_method   set_report_severity_action
syn keyword uvm_method   set_report_severity_action_hier
syn keyword uvm_method   set_report_severity_file
syn keyword uvm_method   set_report_severity_file_hier
syn keyword uvm_method   set_report_severity_id_action
syn keyword uvm_method   set_report_severity_id_action_hier
syn keyword uvm_method   set_report_severity_id_file
syn keyword uvm_method   set_report_severity_id_file_hier
syn keyword uvm_method   set_report_verbosity_level
syn keyword uvm_method   set_report_verbosity_level_hier
syn keyword uvm_method   set_type_override_by_type
syn keyword uvm_method   type_id
syn keyword uvm_method   uvm_agent
syn keyword uvm_method   uvm_algorithmic_comparator
syn keyword uvm_method   uvm_analysis_export
syn keyword uvm_method   uvm_analysis_port
syn keyword uvm_method   uvm_bitstream_t
syn keyword uvm_method   uvm_callback
syn keyword uvm_method   uvm_callback_iter
syn keyword uvm_method   uvm_callbacks
syn keyword uvm_method   uvm_callbacks_objection
syn keyword uvm_method   uvm_cmdline_proc
syn keyword uvm_method   uvm_cmdline_processor
syn keyword uvm_method   uvm_component
syn keyword uvm_method   uvm_component_registry
syn keyword uvm_method   uvm_config_db
syn keyword uvm_method   uvm_default_line_printer
syn keyword uvm_method   uvm_default_printer
syn keyword uvm_method   uvm_default_table_printer
syn keyword uvm_method   uvm_default_tree_printer
syn keyword uvm_method   uvm_driver
syn keyword uvm_method   uvm_env
syn keyword uvm_method   uvm_event
syn keyword uvm_method   uvm_event_callback
syn keyword uvm_method   uvm_event_pool
syn keyword uvm_method   uvm_factory
syn keyword uvm_method   uvm_heartbeat
syn keyword uvm_method   uvm_in_order_*_comparator
syn keyword uvm_method   uvm_in_order_built_in_comparator
syn keyword uvm_method   uvm_in_order_class_comparator
syn keyword uvm_method   uvm_in_order_comparator
syn keyword uvm_method   uvm_is_match
syn keyword uvm_method   uvm_line_printer
syn keyword uvm_method   uvm_monitor
syn keyword uvm_method   uvm_object
syn keyword uvm_method   uvm_object_registry
syn keyword uvm_method   uvm_objection
syn keyword uvm_method   uvm_objection_callback
syn keyword uvm_method   uvm_objection_cbs_t
syn keyword uvm_method   uvm_port_base
syn keyword uvm_method   uvm_printer
syn keyword uvm_method   uvm_printer_knobs
syn keyword uvm_method   uvm_push_driver
syn keyword uvm_method   uvm_push_sequencer
syn keyword uvm_method   uvm_random_stimulus
syn keyword uvm_method   uvm_report_catcher
syn keyword uvm_method   uvm_report_error
syn keyword uvm_method   uvm_report_fatal
syn keyword uvm_method   uvm_report_handler
syn keyword uvm_method   uvm_report_info
syn keyword uvm_method   uvm_report_object
syn keyword uvm_method   uvm_report_server
syn keyword uvm_method   uvm_report_warning
syn keyword uvm_method   uvm_resource_db
syn keyword uvm_method   uvm_root
syn keyword uvm_method   uvm_scoreboard
syn keyword uvm_method   uvm_seq_item_export
syn keyword uvm_method   uvm_seq_item_port
syn keyword uvm_method   uvm_seq_item_pull_export
syn keyword uvm_method   uvm_seq_item_pull_port
syn keyword uvm_method   uvm_sequence
syn keyword uvm_method   uvm_sequence_base
syn keyword uvm_method   uvm_sequence_item
syn keyword uvm_method   uvm_sequence_library
syn keyword uvm_method   uvm_sequence_library_cfg
syn keyword uvm_method   uvm_sequence_state
syn keyword uvm_method   uvm_sequencer
syn keyword uvm_method   uvm_sequencer_base
syn keyword uvm_method   uvm_sequencer_param_base
syn keyword uvm_method   uvm_subscriber
syn keyword uvm_method   uvm_table_printer
syn keyword uvm_method   uvm_table_printer_knobs
syn keyword uvm_method   uvm_test
syn keyword uvm_method   uvm_test_done_objection
syn keyword uvm_method   uvm_tlm_analysis_fifo
syn keyword uvm_method   uvm_tlm_extension
syn keyword uvm_method   uvm_tlm_extension_base
syn keyword uvm_method   uvm_tlm_fifo
syn keyword uvm_method   uvm_tlm_generic_payload
syn keyword uvm_method   uvm_tlm_if
syn keyword uvm_method   uvm_tlm_time
syn keyword uvm_method   uvm_top
syn keyword uvm_method   uvm_transaction
syn keyword uvm_method   uvm_tree_printer
syn keyword uvm_method   uvm_tree_printer_knobs

syn match   Alert        "[\$]\(finish\|error\|stop\|warning\|info\)\>"

syn keyword verilogConditional unique priority

syn match   verilogNumber "\(\<\d[0-9_]*\|\)'[sS]?[bB]\s*[0-1_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d[0-9_]*\|\)'[sS]?[oO]\s*[0-7_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d[0-9_]*\|\)'[sS]?[dD]\s*[0-9_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d[0-9_]*\|\)'[sS]?[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d[0-9_]*\)[munpf]\?s\>"

set include="^\s*`include\ \""
set define="^\s*\(`define\|parameter\|defparam\)\>\ \""
" Directives
" ideally, exclude (*) which is not an attribute
syn region  verilogDirective   start="(\*" end="\*)"

let b:current_syntax = "sv"
let b:color_path = "$HOME/.vim/etc/colors.vim"
if !filereadable(expand(b:color_path))
  source b:color_path
else
endif
: highlight link svStd       sky
: highlight link uvm_enum    Constant
: highlight link uvm_macros  gold
: highlight link uvm_method  sky
: highlight link uvm_class   sky
: highlight link uvm_seq     sky
: highlight link uvm_data    black
: highlight link uvm_phase   purple
: highlight link svStatement Statement
: highlight link Alert       red

" Map CTRL-n to search for incomplete templates
:nmap <C-N> /{:.\{-}:}/b<CR>

" Categorization of SystemVerilog keywords:
" ------------------------------------------------------
" r=rtl o=object a=assertion c=coverage r=randomization 
" v=verilog s=systemverilog b=blocking n=non-bocking
"
" KIND  KEYWORD
"       accept_on
"       alias
" v     always
" sr    always_comb
" sr    always_ff
" sr    always_latch
" v     and
" s     assert
" v     assign
"       assume
" v     automatic
" s     before
" v     begin
" v     bind
" sc    bins
" sc    binsof
" s     bit
" s     break
" v     buf
" v     bufif0
" v     bufif1
" s     byte
" v     case
" v     casex
" v     casez
"       cell
" so    chandle
" s     checker
" so    class
" s     clocking
" v     cmos
" v     config
" s     const
" s     constraint
" s     context
" sc    continue
" sc    cover
" sc    covergroup
" sc    coverpoint
" sc    cross
" v     deassign
" v     default
" v     defparam
" s     design
" v     disable
" s     dist
" s     do
" v     edge
" v     else
" v     end
" v     endcase
" s     endchecker
" so    endclass
" s     endclocking
" v     endconfig
" v     endfunction
" v     endgenerate
" sc    endgroup
" v     endinterface
" v     endmodule
" v     endpackage
" v     endprimitive
" s     endprogram
" sa    endproperty
" sa    endsequence
" v     endspecify
" v     endtable
" v     endtask
" s     enum
" v     event
" sa    eventually
" sa    expect
" s     export
" sc    extends
" s     extern
" s     final
" s     first_match
" v     for
" v     force
" s     foreach
" v     forever
" v     fork
" s     forkjoin
" v     function
" v     generate
" v     genvar
"       global
" v     highz0
" v     highz1
" v     if
" s     iff
" s     ifnone
" sc    ignore_bins
" sc    illegal_bins
"       implies
" s     import
"       incdir
" v     include
" v     initial
" v     inout
" v     input
" s     inside
"       instance
" s     int
" v     integer
" v     interface
"       intersect
" v     join
" v     join_any
" v     join_none
"       large
"       let
"       liblist
"       library
" sc    local
"       localparam
" s     logic
" s     longint
"       macromodule
"       matches
"       medium
" v     modport
"       module
"       nand
"       negedge
"       new
"       nexttime
"       nmos
" v     nor
"       noshowcancelled
" v     not
" v     notif0
" v     notif1
"  o    null
" v     or
"       output
" s     package
" s     packed
" v     parameter
" v     pmos
" v     posedge
" v     primitive
"       priority
" v     program
" s     property
" sc    protected
" v     pull0
" v     pull1
" v     pulldown
" v     pullup
"       pulsestyle_ondetect
"       pulsestyle_onevent
" sc    pure
" v     rand
" v     randc
" s     randcase
" s     randsequence
" v     rcmos
" v     real
" v     realtime
" s     ref
" v     reg
"       reject_on
" v     release
" v     repeat
"       restrict
" s     return
" v     rnmos
" v     rpmos
" v     rtran
" v     rtranif0
" v     rtranif1
"       s_always
"       s_eventually
"       s_nexttime
"       s_until
"       s_until_with
"       scalared
" s     sequence
" s     shortint
" s     shortreal
"       showcancelled
" v     signed
"       small
"       solve
" v     specify
" v     specparam
" sc    static
" s     string
" v     strong
" v     strong0
" v     strong1
" s     struct
" sc    super
" v     supply0
" v     supply1
"       sync_accept_on
"       sync_reject_on
"       table
"       tagged
" v     task
" sc    this
"       throughout
" v     time
" s     timeprecision
" s     timeunit
" v     tran
" v     tranif0
" v     tranif1
" v     tri
" v     tri0
" v     tri1
" v     triand
" v     trior
" v     trireg
"       type
" s     typedef
" s     union
" s     unique
"       unique0
" v     unsigned
"       until
"       until_with
"       untyped
" s     use
"       uwire
" s     var
"       vectored
" s     virtual
" s     void
" v     wait
"       wait_order
" v     wand
" v     weak
" v     weak0
" v     weak1
" v     while
"       wildcard
" v     wire
" sr    with
" s     within
" v     wor
" v     xnor
" v     xor

" vim: ts=8
