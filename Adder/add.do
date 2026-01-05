quit -sim
vdel -all

vlib work
vmap work work

# Compile UVM explicitly (IMPORTANT)
vlog -sv C:/questasim_10.0b/verilog_src/uvm-1.0p1/src/uvm_pkg.sv
vlog -sv C:/questasim_10.0b/verilog_src/uvm-1.0p1/src/uvm.sv

# Compile DUT + TB
vlog -sv add.sv
vlog -sv add_tb.sv

# DO NOT use -uvm in old Questa
vsim add_tb

set TimeUnit ns
set TimePrecision ps

add wave -group IF  sim:/add_tb/aif/*
add wave -group DUT sim:/add_tb/dut/*
add wave sim:/add_tb/aif/clk
add wave sim:/add_tb/aif/rst

run -all

