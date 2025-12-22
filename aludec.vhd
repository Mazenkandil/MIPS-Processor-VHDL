library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity aludec is
    port(funct: in STD_LOGIC_VECTOR(5 downto 0);
         aluop: in STD_LOGIC_VECTOR(1 downto 0);
         alucontrol: out STD_LOGIC_VECTOR(3 downto 0));
end aludec;

architecture Behavioral of aludec is
begin
    process(aluop, funct)
    begin
        case aluop is
            when "00" =>   -- lw, sw, addi
                alucontrol <= "0010";  -- ADD
            when "01" =>   -- beq
                alucontrol <= "0110";  -- SUB
            when "10" =>   -- R-type
                case funct is
                    when "100000" => alucontrol <= "0010";  -- ADD
                    when "100010" => alucontrol <= "0110";  -- SUB
                    when "100100" => alucontrol <= "0000";  -- AND
                    when "100101" => alucontrol <= "0001";  -- OR
                    when "101010" => alucontrol <= "0111";  -- SLT
                    when "100111" => alucontrol <= "1100";  -- NOR
                    when others => alucontrol <= "0000";
                end case;
            when others =>
                alucontrol <= "0000";
        end case;
    end process;
end Behavioral;