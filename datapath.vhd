library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapath is
    port(clk, reset: in STD_LOGIC;
         memtoreg, pcsrc: in STD_LOGIC;
         alusrc, regdst: in STD_LOGIC;
         regwrite, jump: in STD_LOGIC;
         alucontrol: in STD_LOGIC_VECTOR(3 downto 0);
         zero: out STD_LOGIC;
         pc: out STD_LOGIC_VECTOR(31 downto 0);
         instr: in STD_LOGIC_VECTOR(31 downto 0);
         aluout, writedata: out STD_LOGIC_VECTOR(31 downto 0);
         readdata: in STD_LOGIC_VECTOR(31 downto 0));
end datapath;

architecture Behavioral of datapath is
    component flopr
        generic(width: integer := 32);
        port(clk, reset: in STD_LOGIC;
             d: in STD_LOGIC_VECTOR(width-1 downto 0);
             q: out STD_LOGIC_VECTOR(width-1 downto 0));
    end component;
    
    component adder
        port(a, b: in STD_LOGIC_VECTOR(31 downto 0);
             y: out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component mux2
        generic(width: integer := 32);
        port(d0, d1: in STD_LOGIC_VECTOR(width-1 downto 0);
             s: in STD_LOGIC;
             y: out STD_LOGIC_VECTOR(width-1 downto 0));
    end component;
    
    component regfile
        port(clk: in STD_LOGIC;
             we3: in STD_LOGIC;
             ra1, ra2, wa3: in STD_LOGIC_VECTOR(4 downto 0);
             wd3: in STD_LOGIC_VECTOR(31 downto 0);
             rd1, rd2: out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component signext
        port(a: in STD_LOGIC_VECTOR(15 downto 0);
             y: out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component sl2
        port(a: in STD_LOGIC_VECTOR(31 downto 0);
             y: out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component alu
        port(a, b: in STD_LOGIC_VECTOR(31 downto 0);
             alucontrol: in STD_LOGIC_VECTOR(3 downto 0);
             result: out STD_LOGIC_VECTOR(31 downto 0);
             zero: out STD_LOGIC);
    end component;
    
    -- Internal signals
    signal pc_internal, pcnext, pcnextbr, pcplus4, pcbranch: STD_LOGIC_VECTOR(31 downto 0);
    signal signimm, signimmsh: STD_LOGIC_VECTOR(31 downto 0);
    signal srca, srcb, result, aluout_internal: STD_LOGIC_VECTOR(31 downto 0);
    signal wd3: STD_LOGIC_VECTOR(31 downto 0);
    signal wa3: STD_LOGIC_VECTOR(4 downto 0);
    signal rd1, rd2_internal: STD_LOGIC_VECTOR(31 downto 0);
    
begin
    -- Program Counter
    pcreg: flopr generic map(32) 
                 port map(clk => clk, reset => reset, d => pcnext, q => pc_internal);
    
    -- PC + 4
    pcadd1: adder port map(a => pc_internal, b => X"00000004", y => pcplus4);
    
    -- Sign extend and shift left 2
    se: signext port map(a => instr(15 downto 0), y => signimm);
    immsh: sl2 port map(a => signimm, y => signimmsh);
    
    -- Branch address calculation
    pcadd2: adder port map(a => pcplus4, b => signimmsh, y => pcbranch);
    
    -- Branch MUX
    pcbrmux: mux2 generic map(32) 
                 port map(d0 => pcplus4, d1 => pcbranch, s => pcsrc, y => pcnextbr);
    
    -- Jump MUX
    pcmux: mux2 generic map(32) 
               port map(d0 => pcnextbr, 
                       d1 => pcplus4(31 downto 28) & instr(25 downto 0) & "00", 
                       s => jump, y => pcnext);
    
    -- Register File
    rf: regfile port map(clk => clk, we3 => regwrite, 
                        ra1 => instr(25 downto 21), ra2 => instr(20 downto 16),
                        wa3 => wa3, wd3 => wd3, rd1 => rd1, rd2 => rd2_internal);
    
    -- Write register MUX
    wrmux: mux2 generic map(5) 
               port map(d0 => instr(20 downto 16), d1 => instr(15 downto 11), 
                       s => regdst, y => wa3);
    
    -- Write data MUX (ALU result or memory read)
    resmux: mux2 generic map(32) 
                port map(d0 => aluout_internal, d1 => readdata, 
                        s => memtoreg, y => wd3);
    
    -- ALU source B MUX
    srcbmux: mux2 generic map(32) 
                 port map(d0 => rd2_internal, d1 => signimm, 
                         s => alusrc, y => srcb);
    
    -- ALU
    alu_unit: alu port map(a => rd1, b => srcb, alucontrol => alucontrol,
                          result => aluout_internal, zero => zero);
    
    -- Output assignments
    pc <= pc_internal;
    aluout <= aluout_internal;
    writedata <= rd2_internal;
    result <= aluout_internal;
end Behavioral;