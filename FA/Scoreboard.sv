`ifndef Scoreboard
`define Scoreboard
`include "uvm_macros.svh"
import uvm_pkg::*;
class Scoreboard extends uvm_scoreboard;
`uvm_component_utils(Scoreboard)
uvm_analysis_imp #(Transaction,Scoreboard) recv;

Transaction t;

function new(input string path = "Scoreboard",uvm_component parent = null);
    super.new(path,parent);
    recv = new("recv",this);
endfunction

virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    t = Transaction::type_id::create("t");
endfunction

virtual function void write(input Transaction tr);
t = tr;
`uvm_info("SCO",$sformatf("Data Received from Monitor|a : %0d|b : %0d|cin: %0d|sum :%0d|cout: %0d|",t.a,t.b,t.cin,t.sum,t.cout),UVM_NONE);
if((tr.sum == tr.a ^ tr.b ^ tr.cin) && (tr.cout == ((tr.a & tr.b)|(tr.cin & tr.b)|(tr.a & tr.cin))))
begin
    `uvm_info("SCO","Test PASSED",UVM_NONE);
end
else begin
     `uvm_info("SCO","Test FAIL",UVM_NONE);
end
endfunction
endclass
`endif