`ifndef Agent
`define Agent
`include "uvm_macros.svh"
import uvm_pkg::*;

class Agent extends uvm_agent;
    `uvm_component_utils(Agent)

    function new(input string name = "Agent",uvm_component c);
    super.new(name,c);
    endfunction

    Monitor m;
    Driver d;
    uvm_sequencer #(Transaction) seq;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        m   = Monitor::type_id::create("m",this);
        d   = Driver::type_id::create("d",this);
        seq = uvm_sequencer #(Transaction)::type_id::create("seq",this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        d.seq_item_port.connect(seq.seq_item_export);
    endfunction
endclass
`endif