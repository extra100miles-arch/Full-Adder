`include "uvm_macros.svh"
import uvm_pkg::*;
import my_package::*;
`include "add_intf.sv"


module tb;
    add_intf vif();
    add DUT(
        .a(vif.a),
        .b(vif.b),
        .cin(vif.cin),
        .sum(vif.sum),
        .cout(vif.cout)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end

    initial begin
    uvm_config_db #(virtual add_intf)::set(null ,"uvm_test_top.e.a*","vif",vif);
    run_test("Test");
    end

endmodule