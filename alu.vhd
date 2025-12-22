library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
    port(a, b: in STD_LOGIC_VECTOR(31 downto 0);
         alucontrol: in STD_LOGIC_VECTOR(3 downto 0);
         result: out STD_LOGIC_VECTOR(31 downto 0);
         zero: out STD_LOGIC);
end alu;

architecture Behavioral of alu is
    signal res: STD_LOGIC_VECTOR(31 downto 0);
begin
    process(a, b, alucontrol)
    begin
        case alucontrol is
            when "0000" =>  -- AND
                res <= a and b;
            when "0001" =>  -- OR
                res <= a or b;
            when "0010" =>  -- ADD
                res <= a + b;
            when "0110" =>  -- SUB
                res <= a - b;
            when "1100" =>  -- NOR
                res <= not (a or b);
            when "0111" =>  -- SLT
                if a < b then
                    res <= X"00000001";
                else
                    res <= X"00000000";
                end if;
            when others =>
                res <= X"00000000";
        end case;
    end process;
    
    result <= res;
    zero <= '1' when res = X"00000000" else '0';
end Behavioral;