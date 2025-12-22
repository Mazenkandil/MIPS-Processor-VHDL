library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controller is
    port(op, funct: in STD_LOGIC_VECTOR(5 downto 0);
         zero: in STD_LOGIC;
         memtoreg, memwrite: out STD_LOGIC;
         pcsrc, alusrc: out STD_LOGIC;
         regdst, regwrite: out STD_LOGIC;
         jump: out STD_LOGIC;
         alucontrol: out STD_LOGIC_VECTOR(3 downto 0));
end controller;

architecture Behavioral of controller is
    component maindec
        port(op: in STD_LOGIC_VECTOR(5 downto 0);
             memtoreg, memwrite: out STD_LOGIC;
             branch, alusrc: out STD_LOGIC;
             regdst, regwrite: out STD_LOGIC;
             jump: out STD_LOGIC;
             aluop: out STD_LOGIC_VECTOR(1 downto 0));
    end component;
    
    component aludec
        port(funct: in STD_LOGIC_VECTOR(5 downto 0);
             aluop: in STD_LOGIC_VECTOR(1 downto 0);
             alucontrol: out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    signal aluop: STD_LOGIC_VECTOR(1 downto 0);
    signal branch: STD_LOGIC;
begin
    md: maindec port map(
        op => op,
        memtoreg => memtoreg,
        memwrite => memwrite,
        branch => branch,
        alusrc => alusrc,
        regdst => regdst,
        regwrite => regwrite,
        jump => jump,
        aluop => aluop
    );
    
    ad: aludec port map(
        funct => funct,
        aluop => aluop,
        alucontrol => alucontrol
    );
    
    -- PC source (branch and zero)
    pcsrc <= branch and zero;
end Behavioral;