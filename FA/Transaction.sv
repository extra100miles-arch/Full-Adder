`ifndef Transaction
`define Transaction
`include "uvm_macros.svh"
import uvm_pkg::*;
class Transaction extends uvm_sequence_item;
    rand bit a;
    rand bit b;
    rand bit cin;
    bit cout;
    bit sum;

    function new( input string path ="Transaction");
        super.new(path);
    endfunction

    `uvm_object_utils_begin(Transaction)
    `uvm_field_int(a, UVM_DEFAULT)
    `uvm_field_int(b, UVM_DEFAULT)
    `uvm_field_int(cin, UVM_DEFAULT)
    `uvm_field_int(sum, UVM_DEFAULT)
    `uvm_field_int(cout, UVM_DEFAULT)
    `uvm_object_utils_end
endclass
`endif