library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maindec is
    port(op: in STD_LOGIC_VECTOR(5 downto 0);
         memtoreg, memwrite: out STD_LOGIC;
         branch, alusrc: out STD_LOGIC;
         regdst, regwrite: out STD_LOGIC;
         jump: out STD_LOGIC;
         aluop: out STD_LOGIC_VECTOR(1 downto 0));
end maindec;

architecture Behavioral of maindec is
begin
    process(op)
    begin
        -- Default values
        memtoreg <= '0'; memwrite <= '0'; branch <= '0';
        alusrc <= '0'; regdst <= '0'; regwrite <= '0';
        jump <= '0'; aluop <= "00";
        
        case op is
            when "000000" =>  -- R-type
                regdst <= '1'; regwrite <= '1'; aluop <= "10";
            when "100011" =>  -- lw
                alusrc <= '1'; memtoreg <= '1'; regwrite <= '1';
                aluop <= "00";
            when "101011" =>  -- sw
                alusrc <= '1'; memwrite <= '1'; aluop <= "00";
            when "000100" =>  -- beq
                branch <= '1'; aluop <= "01";
            when "001000" =>  -- addi
                alusrc <= '1'; regwrite <= '1'; aluop <= "00";
            when "000010" =>  -- j
                jump <= '1';
            when others =>
                -- Handle unknown instructions
        end case;
    end process;
end Behavioral;