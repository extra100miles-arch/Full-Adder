`include"Transaction.sv"
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "Agent.sv"
`include "Scoreboard.sv"

class Environment extends uvm_env;
`uvm_component_utils(Environment)

function new(input string name ="ENV",uvm_component c);
super.new(name,c);
endfunction

Scoreboard s;
Agent a;

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
s = Scoreboard::type_id::create("s",this);
a = Agent::type_id::create("a",this);
endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
a.m.send.connect(s.recv);
endfunction




endclass