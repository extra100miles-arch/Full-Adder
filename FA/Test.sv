`include "uvm_macros.svh"
import uvm_pkg::*;
class Test extends uvm_test;
    `uvm_component_utils(Test)

    function new(input string name = "TEST",uvm_component c);
        super.new(name,c);
    endfunction

    Generator gen;
    Environment e;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        gen = Generator::type_id::create("gen",this);
        e   = Environment::type_id::create("e",this);
    endfunction

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        uvm_top.print_topology();
    endfunction

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        gen.start(e.a.seq);
        #50
        phase.drop_objection(this);
    endtask

endclass