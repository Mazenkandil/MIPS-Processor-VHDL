library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regfile is
    port(clk: in STD_LOGIC;
         we3: in STD_LOGIC;
         ra1, ra2, wa3: in STD_LOGIC_VECTOR(4 downto 0);
         wd3: in STD_LOGIC_VECTOR(31 downto 0);
         rd1, rd2: out STD_LOGIC_VECTOR(31 downto 0));
end regfile;

architecture Behavioral of regfile is
    -- Individual registers r0 to r31
    signal r0, r1, r2, r3, r4, r5, r6, r7, r8, r9: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal r10, r11, r12, r13, r14, r15, r16, r17, r18, r19: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal r20, r21, r22, r23, r24, r25, r26, r27, r28, r29: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal r30, r31: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin
    -- Reading process for rd1
    process(ra1, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9,
            r10, r11, r12, r13, r14, r15, r16, r17, r18, r19,
            r20, r21, r22, r23, r24, r25, r26, r27, r28, r29,
            r30, r31)
    begin
        case ra1 is
            when "00000" => rd1 <= X"00000000";
            when "00001" => rd1 <= r1;
            when "00010" => rd1 <= r2;
            when "00011" => rd1 <= r3;
            when "00100" => rd1 <= r4;
            when "00101" => rd1 <= r5;
            when "00110" => rd1 <= r6;
            when "00111" => rd1 <= r7;
            when "01000" => rd1 <= r8;
            when "01001" => rd1 <= r9;
            when "01010" => rd1 <= r10;
            when "01011" => rd1 <= r11;
            when "01100" => rd1 <= r12;
            when "01101" => rd1 <= r13;
            when "01110" => rd1 <= r14;
            when "01111" => rd1 <= r15;
            when "10000" => rd1 <= r16;
            when "10001" => rd1 <= r17;
            when "10010" => rd1 <= r18;
            when "10011" => rd1 <= r19;
            when "10100" => rd1 <= r20;
            when "10101" => rd1 <= r21;
            when "10110" => rd1 <= r22;
            when "10111" => rd1 <= r23;
            when "11000" => rd1 <= r24;
            when "11001" => rd1 <= r25;
            when "11010" => rd1 <= r26;
            when "11011" => rd1 <= r27;
            when "11100" => rd1 <= r28;
            when "11101" => rd1 <= r29;
            when "11110" => rd1 <= r30;
            when "11111" => rd1 <= r31;
            when others => rd1 <= X"00000000";
        end case;
    end process;
    
    -- Reading process for rd2
    process(ra2, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9,
            r10, r11, r12, r13, r14, r15, r16, r17, r18, r19,
            r20, r21, r22, r23, r24, r25, r26, r27, r28, r29,
            r30, r31)
    begin
        case ra2 is
            when "00000" => rd2 <= X"00000000";
            when "00001" => rd2 <= r1;
            when "00010" => rd2 <= r2;
            when "00011" => rd2 <= r3;
            when "00100" => rd2 <= r4;
            when "00101" => rd2 <= r5;
            when "00110" => rd2 <= r6;
            when "00111" => rd2 <= r7;
            when "01000" => rd2 <= r8;
            when "01001" => rd2 <= r9;
            when "01010" => rd2 <= r10;
            when "01011" => rd2 <= r11;
            when "01100" => rd2 <= r12;
            when "01101" => rd2 <= r13;
            when "01110" => rd2 <= r14;
            when "01111" => rd2 <= r15;
            when "10000" => rd2 <= r16;
            when "10001" => rd2 <= r17;
            when "10010" => rd2 <= r18;
            when "10011" => rd2 <= r19;
            when "10100" => rd2 <= r20;
            when "10101" => rd2 <= r21;
            when "10110" => rd2 <= r22;
            when "10111" => rd2 <= r23;
            when "11000" => rd2 <= r24;
            when "11001" => rd2 <= r25;
            when "11010" => rd2 <= r26;
            when "11011" => rd2 <= r27;
            when "11100" => rd2 <= r28;
            when "11101" => rd2 <= r29;
            when "11110" => rd2 <= r30;
            when "11111" => rd2 <= r31;
            when others => rd2 <= X"00000000";
        end case;
    end process;
    
    -- Writing process
    process(clk)
    begin
        if rising_edge(clk) then
            if we3 = '1' then
                case wa3 is
                    when "00001" => r1 <= wd3;
                    when "00010" => r2 <= wd3;
                    when "00011" => r3 <= wd3;
                    when "00100" => r4 <= wd3;
                    when "00101" => r5 <= wd3;
                    when "00110" => r6 <= wd3;
                    when "00111" => r7 <= wd3;
                    when "01000" => r8 <= wd3;
                    when "01001" => r9 <= wd3;
                    when "01010" => r10 <= wd3;
                    when "01011" => r11 <= wd3;
                    when "01100" => r12 <= wd3;
                    when "01101" => r13 <= wd3;
                    when "01110" => r14 <= wd3;
                    when "01111" => r15 <= wd3;
                    when "10000" => r16 <= wd3;
                    when "10001" => r17 <= wd3;
                    when "10010" => r18 <= wd3;
                    when "10011" => r19 <= wd3;
                    when "10100" => r20 <= wd3;
                    when "10101" => r21 <= wd3;
                    when "10110" => r22 <= wd3;
                    when "10111" => r23 <= wd3;
                    when "11000" => r24 <= wd3;
                    when "11001" => r25 <= wd3;
                    when "11010" => r26 <= wd3;
                    when "11011" => r27 <= wd3;
                    when "11100" => r28 <= wd3;
                    when "11101" => r29 <= wd3;
                    when "11110" => r30 <= wd3;
                    when "11111" => r31 <= wd3;
                    when others => null; -- $zero is not writable
                end case;
            end if;
        end if;
    end process;
end Behavioral;