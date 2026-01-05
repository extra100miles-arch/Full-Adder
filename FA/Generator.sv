`ifndef Generator
`define Generator
`include "uvm_macros.svh"
import uvm_pkg::*;
class Generator extends uvm_sequence #(Transaction);
`uvm_object_utils(Generator)
Transaction t;


function new(input string name = "Generator");
    super.new(name);
endfunction

virtual task body();
t = Transaction::type_id::create("t");
repeat(8)begin
    start_item(t);
    assert(t.randomize());
    `uvm_info("GEN",$sformatf("Data send to Driver|a : %0d|b : %0d|cin : %0d",t.a,t.b,t.cin),UVM_NONE);
    finish_item(t);
end
endtask

endclass
`endif