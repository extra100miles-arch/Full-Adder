`ifndef Monitor
`define Monitor
`include "uvm_macros.svh"
import uvm_pkg::*;
class Monitor extends uvm_monitor;

    `uvm_component_utils(Monitor)

    uvm_analysis_port #(Transaction) send;

    function new(input string path = "Monitor",uvm_component parent = null);
        super.new(path,parent);
        send = new("send",this);
    endfunction

    Transaction t;
    virtual add_intf vif;

    virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    t = Transaction::type_id::create("t");
    if(!uvm_config_db #(virtual add_intf)::get(this,"","vif",vif))
        `uvm_error("MON","Unable to access uvm_config_db");
    endfunction

    virtual task run_phase(uvm_phase phase);
        forever begin
            #10;
            t.a    = vif.a;
            t.b    = vif.b;
            t.cin  = vif.cin;
            t.sum  = vif.sum;
            t.cout = vif.cout;

            `uvm_info("MON",$sformatf("Data send to scoreboard|A : %0d|B :%0d|cin : %0d|sum :%0d|cout:%0d",t.a,t.b,t.cin,t.sum,t.cout),UVM_NONE);
            send.write(t);
        end
    endtask
endclass
`endif