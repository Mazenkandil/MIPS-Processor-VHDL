----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:37:21 11/24/2025 
-- Design Name: 
-- Module Name:    Register_FILE - Behavioral 
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
library work;
use work.floprP.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_FILE is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_FILE;

architecture Behavioral of Register_FILE is

signal R0, R1, R2, R3, R4, R5, R6, R7,R8, R9, R10, R11, R12, R13, R14, R15: STD_LOGIC_VECTOR(31 downto 0);
signal R16, R17, R18, R19, R20, R21, R22, R23,R24, R25, R26, R27, R28, R29, R30, R31 : STD_LOGIC_VECTOR(31 downto 0);          
           
           
signal W0, W1, W2, W3, W4, W5, W6, W7,W8, W9, W10, W11, W12, W13,W14,W15: STD_LOGIC_VECTOR(31 downto 0);
signal W16,W17,W18,W19,W20,W21,W22,W23,W24,W25,W26,W27,W28,W29,W30,W31: STD_LOGIC_VECTOR(31 downto 0);

signal write_en: STD_LOGIC_VECTOR(31 downto 0);

begin

DEC:Decoder port map(
    sel =>write_sel,
	 ena =>write_ena,
	 O => write_en
	 );

W0  <= (others => '0');  
W1  <= write_data when write_en(1)  = '1' else R1;
W2  <= write_data when write_en(2)  = '1' else R2;
W3  <= write_data when write_en(3)  = '1' else R3;
W4  <= write_data when write_en(4)  = '1' else R4;
W5  <= write_data when write_en(5)  = '1' else R5;
W6  <= write_data when write_en(6)  = '1' else R6;
W7  <= write_data when write_en(7)  = '1' else R7;
W8  <= write_data when write_en(8)  = '1' else R8;
W9  <= write_data when write_en(9)  = '1' else R9;
W10 <= write_data when write_en(10) = '1' else R10;
W11 <= write_data when write_en(11) = '1' else R11;
W12 <= write_data when write_en(12) = '1' else R12;
W13 <= write_data when write_en(13) = '1' else R13;
W14 <= write_data when write_en(14) = '1' else R14;
W15 <= write_data when write_en(15) = '1' else R15;
W16 <= write_data when write_en(16) = '1' else R16;
W17 <= write_data when write_en(17) = '1' else R17;
W18 <= write_data when write_en(18) = '1' else R18;
W19 <= write_data when write_en(19) = '1' else R19;
W20 <= write_data when write_en(20) = '1' else R20;
W21 <= write_data when write_en(21) = '1' else R21;
W22 <= write_data when write_en(22) = '1' else R22;
W23 <= write_data when write_en(23) = '1' else R23;
W24 <= write_data when write_en(24) = '1' else R24;
W25 <= write_data when write_en(25) = '1' else R25;
W26 <= write_data when write_en(26) = '1' else R26;
W27 <= write_data when write_en(27) = '1' else R27;
W28 <= write_data when write_en(28) = '1' else R28;
W29 <= write_data when write_en(29) = '1' else R29;
W30 <= write_data when write_en(30) = '1' else R30;
W31 <= write_data when write_en(31) = '1' else R31;


	 
	 
REG0:  flopr port map(clk => clk, reset => '0', d => W0,  q => R0);
REG1:  flopr port map(clk => clk, reset => '0', d => W1,  q => R1);
REG2:  flopr port map(clk => clk, reset => '0', d => W2,  q => R2);
REG3:  flopr port map(clk => clk, reset => '0', d => W3,  q => R3);
REG4:  flopr port map(clk => clk, reset => '0', d => W4,  q => R4);
REG5:  flopr port map(clk => clk, reset => '0', d => W5,  q => R5);
REG6:  flopr port map(clk => clk, reset => '0', d => W6,  q => R6);
REG7:  flopr port map(clk => clk, reset => '0', d => W7,  q => R7);
REG8:  flopr port map(clk => clk, reset => '0', d => W8,  q => R8);
REG9:  flopr port map(clk => clk, reset => '0', d => W9,  q => R9);
REG10: flopr port map(clk => clk, reset => '0', d => W10, q => R10);
REG11: flopr port map(clk => clk, reset => '0', d => W11, q => R11);
REG12: flopr port map(clk => clk, reset => '0', d => W12, q => R12);
REG13: flopr port map(clk => clk, reset => '0', d => W13, q => R13);
REG14: flopr port map(clk => clk, reset => '0', d => W14, q => R14);
REG15: flopr port map(clk => clk, reset => '0', d => W15, q => R15);
REG16: flopr port map(clk => clk, reset => '0', d => W16, q => R16);
REG17: flopr port map(clk => clk, reset => '0', d => W17, q => R17);
REG18: flopr port map(clk => clk, reset => '0', d => W18, q => R18);
REG19: flopr port map(clk => clk, reset => '0', d => W19, q => R19);
REG20: flopr port map(clk => clk, reset => '0', d => W20, q => R20);
REG21: flopr port map(clk => clk, reset => '0', d => W21, q => R21);
REG22: flopr port map(clk => clk, reset => '0', d => W22, q => R22);
REG23: flopr port map(clk => clk, reset => '0', d => W23, q => R23);
REG24: flopr port map(clk => clk, reset => '0', d => W24, q => R24);
REG25: flopr port map(clk => clk, reset => '0', d => W25, q => R25);
REG26: flopr port map(clk => clk, reset => '0', d => W26, q => R26);
REG27: flopr port map(clk => clk, reset => '0', d => W27, q => R27);
REG28: flopr port map(clk => clk, reset => '0', d => W28, q => R28);
REG29: flopr port map(clk => clk, reset => '0', d => W29, q => R29);
REG30: flopr port map(clk => clk, reset => '0', d => W30, q => R30);
REG31: flopr port map(clk => clk, reset => '0', d => W31, q => R31);

MUX1: MUX port map(
         sel=>read_sel1,
			I0  =>R0,
			I1  =>R1,
			I2  =>R2,
			I3  =>R3,
			I4  =>R4,
			I5  =>R5,
			I6  =>R6,
			I7  =>R7,
			I8  =>R8,
			I9  =>R9,
			I10 =>R10,
			I11 =>R11,
			I12 =>R12,
			I13 =>R13,
			I14 =>R14,
			I15 =>R15,
			I16 =>R16,
			I17 =>R17,
			I18 =>R18,
			I19 =>R19,
			I20 =>R20,
			I21 =>R21,
			I22 =>R22,
			I23 =>R23,
			I24 =>R24,
			I25 =>R25,
			I26 =>R26,
			I27 =>R27,
			I28 =>R28,
			I29 =>R29,
			I30 =>R30,
			I31 =>R31,
			O =>data1);
			
MUX2: MUX port map(
         sel=>read_sel2,
			I0  =>R0,
			I1  =>R1,
			I2  =>R2,
			I3  =>R3,
			I4  =>R4,
			I5  =>R5,
			I6  =>R6,
			I7  =>R7,
			I8  =>R8,
			I9  =>R9,
			I10 =>R10,
			I11 =>R11,
			I12 =>R12,
			I13 =>R13,
			I14 =>R14,
			I15 =>R15,
			I16 =>R16,
			I17 =>R17,
			I18 =>R18,
			I19 =>R19,
			I20 =>R20,
			I21 =>R21,
			I22 =>R22,
			I23 =>R23,
			I24 =>R24,
			I25 =>R25,
			I26 =>R26,
			I27 =>R27,
			I28 =>R28,
			I29 =>R29,
			I30 =>R30,
			I31 =>R31,
			O =>data2);
			
end Behavioral;