library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Datapath is
    Port ( clk, reset : in STD_LOGIC;
           instr : in STD_LOGIC_VECTOR(31 downto 0);
           aluoperation : in STD_LOGIC_VECTOR(3 downto 0);
           zero : out STD_LOGIC;
           regwrite : in STD_LOGIC;
           aluout : buffer STD_LOGIC_VECTOR(31 downto 0));
end Datapath;

architecture Behavioral of Datapath is

    -- Component declarations
    component Register_FILE
        Port ( read_sel1 : in STD_LOGIC_VECTOR(4 downto 0);
               read_sel2 : in STD_LOGIC_VECTOR(4 downto 0);
               write_sel : in STD_LOGIC_VECTOR(4 downto 0);
               write_ena : in STD_LOGIC;
               clk : in STD_LOGIC;
               write_data : in STD_LOGIC_VECTOR(31 downto 0);
               data1 : out STD_LOGIC_VECTOR(31 downto 0);
               data2 : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

    component ALU
        Port ( data1 : in STD_LOGIC_VECTOR(31 downto 0);
               data2 : in STD_LOGIC_VECTOR(31 downto 0);
               aluop : in STD_LOGIC_VECTOR(3 downto 0);
               dataout : out STD_LOGIC_VECTOR(31 downto 0);  
               zflag : out STD_LOGIC);
    end component;

    
    signal read_data1, read_data2 : STD_LOGIC_VECTOR(31 downto 0);
    signal write_data : STD_LOGIC_VECTOR(31 downto 0);
    signal rs, rt, rd : STD_LOGIC_VECTOR(4 downto 0);
    signal alu_result : STD_LOGIC_VECTOR(31 downto 0);  

begin

    -- Extract instruction fields for R-type instructions
    rs <= instr(25 downto 21);  -- source register 1
    rt <= instr(20 downto 16);  -- source register 2
    rd <= instr(15 downto 11);  -- destination register

    -- Connect ALU output to write back data for R-type instructions
    write_data <= alu_result;  
    aluout <= alu_result;      

    -- Register File Instance
    REG_FILE: Register_FILE port map(
        read_sel1 => rs,
        read_sel2 => rt,
        write_sel => rd,
        write_ena => regwrite,
        clk => clk,
        write_data => write_data,
        data1 => read_data1,
        data2 => read_data2
    );

    -- ALU Instance
    ALU_UNIT: ALU port map(
        data1 => read_data1,
        data2 => read_data2,
        aluop => aluoperation,
        dataout => alu_result,  
        zflag => zero
    );

end Behavioral;