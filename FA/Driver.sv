`ifndef Driver
`define Driver
`include "uvm_macros.svh"
import uvm_pkg::*;
class Driver extends uvm_driver #(Transaction);
`uvm_component_utils(Driver);

function new(input string path = "Driver",uvm_component parent = null);
    super.new(path,parent);
endfunction

Transaction t;
virtual add_intf vif;

virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    t = Transaction::type_id::create("t");

    if(!uvm_config_db #(virtual add_intf)::get(this,"","vif",vif))
        `uvm_error("DRV","Unable to acces uvm_config_db");
endfunction

virtual task run_phase(uvm_phase phase);
forever begin
    seq_item_port.get_next_item(t);
    vif.a   <= t.a;
    vif.b   <= t.b;
    vif.cin <= t.cin;
    `uvm_info("DRV",$sformatf("Trigger DUT|a: %0d|b : %0d|cin : %0d|",t.a,t.b,t.cin),UVM_NONE);
    seq_item_port.item_done();
    #10;
end
endtask
endclass
`endif