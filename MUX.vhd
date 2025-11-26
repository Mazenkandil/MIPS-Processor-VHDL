----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:33:47 11/25/2025 
-- Design Name: 
-- Module Name:    MUX - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX is
    Port ( sel : in  STD_LOGIC_VECTOR (4 downto 0);
           I0 : in  STD_LOGIC_VECTOR (31 downto 0);
           I1 : in  STD_LOGIC_VECTOR (31 downto 0);
           I2 : in  STD_LOGIC_VECTOR (31 downto 0);
           I3 : in  STD_LOGIC_VECTOR (31 downto 0);
           I4 : in  STD_LOGIC_VECTOR (31 downto 0);
           I5 : in  STD_LOGIC_VECTOR (31 downto 0);
           I6 : in  STD_LOGIC_VECTOR (31 downto 0);
           I7 : in  STD_LOGIC_VECTOR (31 downto 0);
           I8 : in  STD_LOGIC_VECTOR (31 downto 0);
           I9 : in  STD_LOGIC_VECTOR (31 downto 0);
           I10 : in  STD_LOGIC_VECTOR (31 downto 0);
           I11 : in  STD_LOGIC_VECTOR (31 downto 0);
           I12 : in  STD_LOGIC_VECTOR (31 downto 0);
           I13 : in  STD_LOGIC_VECTOR (31 downto 0);
           I14 : in  STD_LOGIC_VECTOR (31 downto 0);
           I15 : in  STD_LOGIC_VECTOR (31 downto 0);
           I16 : in  STD_LOGIC_VECTOR (31 downto 0);
           I17 : in  STD_LOGIC_VECTOR (31 downto 0);
           I18 : in  STD_LOGIC_VECTOR (31 downto 0);
           I19 : in  STD_LOGIC_VECTOR (31 downto 0);
           I20 : in  STD_LOGIC_VECTOR (31 downto 0);
           I21 : in  STD_LOGIC_VECTOR (31 downto 0);
           I22 : in  STD_LOGIC_VECTOR (31 downto 0);
           I23 : in  STD_LOGIC_VECTOR (31 downto 0);
           I24 : in  STD_LOGIC_VECTOR (31 downto 0);
           I25 : in  STD_LOGIC_VECTOR (31 downto 0);
           I26 : in  STD_LOGIC_VECTOR (31 downto 0);
           I27 : in  STD_LOGIC_VECTOR (31 downto 0);
           I28 : in  STD_LOGIC_VECTOR (31 downto 0);
           I29 : in  STD_LOGIC_VECTOR (31 downto 0);
           I30 : in  STD_LOGIC_VECTOR (31 downto 0);
           I31 : in  STD_LOGIC_VECTOR (31 downto 0);
           O : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX;

architecture Behavioral of MUX is

begin

 with sel select
        O <= I0  when "00000",
             I1  when "00001",
             I2  when "00010",
             I3  when "00011",
             I4  when "00100",
             I5  when "00101",
             I6  when "00110",
             I7  when "00111",
             I8  when "01000",
             I9  when "01001",
             I10 when "01010",
             I11 when "01011",
             I12 when "01100",
             I13 when "01101",
             I14 when "01110",
             I15 when "01111",
             I16 when "10000",
             I17 when "10001",
             I18 when "10010",
             I19 when "10011",
             I20 when "10100",
             I21 when "10101",
             I22 when "10110",
             I23 when "10111",
             I24 when "11000",
             I25 when "11001",
             I26 when "11010",
             I27 when "11011",
             I28 when "11100",
             I29 when "11101",
             I30 when "11110",
             I31 when "11111";
end Behavioral;