library verilog;
use verilog.vl_types.all;
entity add is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        y               : out    vl_logic_vector(4 downto 0)
    );
end add;
