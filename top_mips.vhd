library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main_Module is
    port(clk, rst: in STD_LOGIC;
         writedata, dataadr: out STD_LOGIC_VECTOR(31 downto 0);
         memwrite: out STD_LOGIC);
end Main_Module;

architecture Behavioral of Main_Module is
    component mips
        port(clk, reset: in STD_LOGIC;
             pc: out STD_LOGIC_VECTOR(31 downto 0);
             instr: in STD_LOGIC_VECTOR(31 downto 0);
             memwrite: out STD_LOGIC;
             aluout, writedata: out STD_LOGIC_VECTOR(31 downto 0);
             readdata: in STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component imem
        port(a: in STD_LOGIC_VECTOR(5 downto 0);
             rd: out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component dmem
        port(clk, we: in STD_LOGIC;
             a, wd: in STD_LOGIC_VECTOR(31 downto 0);
             rd: out STD_LOGIC_VECTOR(31 downto 0));
    end component;
   
    signal pc, instr, readdata, aluout, writedata_int: STD_LOGIC_VECTOR(31 downto 0);
    signal memwrite_int: STD_LOGIC;
    
begin
    mips1: mips port map(
        clk => clk,
        reset => rst,
        pc => pc,
        instr => instr,
        memwrite => memwrite_int,
        aluout => aluout,
        writedata => writedata_int,
        readdata => readdata
    );
    
    imem1: imem port map(
        a => pc(7 downto 2),
        rd => instr
    );
    
    dmem1: dmem port map(
        clk => clk,
        we => memwrite_int,
        a => aluout,
        wd => writedata_int,
        rd => readdata
    );
    
    -- Output assignments
    writedata <= writedata_int;
    dataadr <= aluout;
    memwrite <= memwrite_int;
end Behavioral;