library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
    generic(width: integer := 32);
    port(d0, d1: in STD_LOGIC_VECTOR(width-1 downto 0);
         s: in STD_LOGIC;
         y: out STD_LOGIC_VECTOR(width-1 downto 0));
end mux2;

architecture Behavioral of mux2 is
begin
    y <= d0 when s = '0' else d1;
end Behavioral;