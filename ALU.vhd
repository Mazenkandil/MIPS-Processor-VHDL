library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (3 downto 0);
           dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           zflag : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
    signal a, b :STD_LOGIC_VECTOR(31 downto 0);
    signal result :STD_LOGIC_VECTOR(31 downto 0);
begin

a <=(data1);
b <=(data2);

result <= a and b      when aluop ="0000" else
          a or b       when aluop ="0001" else
			 a + b        when aluop ="0010" else
			 a - b        when aluop ="0110" else
			 not(a or b)  when aluop ="1100" else
			 x"00000001" when aluop = "0111" and ( a < b ) and b(31) /= a(31) else
			 x"00000001" when aluop = "0111" and ( a < b ) and b(31)= a(31) else
			 x"00000000";
			 
dataout <= STD_LOGIC_VECTOR(result);
zflag <= '1' 
when (result= x"00000000" and 
(aluop ="0000" or aluop ="0001" or aluop="0010" or aluop ="0110" or aluop ="1100" or aluop ="0111") )
else '0';
			 
end Behavioral;