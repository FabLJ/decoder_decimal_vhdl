----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2020 00:41:29
-- Design Name: 
-- Module Name: decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
  Port (
    clk : in std_logic;
    sw0:in std_logic;
    sw1: in std_logic;
    sw2: in std_logic;
    sw3: in std_logic;
    
    led: out std_logic_vector(0 to 3);
    display0: out std_logic_vector(0 to 6);
    display1: out std_logic_vector(0 to 6)
 );
end decoder;

architecture Behavioral of decoder is
constant divider_c : integer :=10000000;
signal s_sw: std_logic_vector(0 to 3):="0000";
signal cnt_s : integer range 0 to divider_c :=0;
signal val: std_logic_vector(0 to 3):="0000";
signal val1: std_logic_vector(0 to 3):="0000";
signal val2: std_logic_vector(0 to 3):="0000";
signal cont : integer range 0 to 15 :=0;
signal cont1 : integer range 0 to 9 :=0;
signal cont2 : integer range 0 to 9 :=0;
begin
s_sw(0) <= sw0;
s_sw(1) <= sw1;
s_sw(2) <= sw2;
s_sw(3) <= sw3;


val1 <= std_logic_vector(to_unsigned(cont1,val1'length));
val2 <= std_logic_vector(to_unsigned(cont2,val2'length));

    WITH val1 SELECT
    display0 <= "1111110" WHEN "0000",
                 "0110000" WHEN "0001",
                 "1101101" WHEN "0010",
                 "1111001" WHEN "0011",
                 "0110011" WHEN "0100",
                 "1011011" WHEN "0101",
                 "1011111" WHEN "0110",
                 "1110000" WHEN "0111",
                 "1111111" WHEN "1000",
                 "1111011" WHEN "1001",
                 "0000000" WHEN OTHERS;
WITH val2 SELECT
    display1 <= "1111110" WHEN "0000",
                 "0110000" WHEN "0001",
                 "1101101" WHEN "0010",
                 "1111001" WHEN "0011",
                 "0110011" WHEN "0100",
                 "1011011" WHEN "0101",
                 "1011111" WHEN "0110",
                 "1110000" WHEN "0111",
                 "1111111" WHEN "1000",
                 "1111011" WHEN "1001",
                 "0000000" WHEN OTHERS;
    process(clk)
    begin
    
    if rising_edge(clk)then
        if (cnt_s = divider_c)then
     
        cont <= to_integer(unsigned(s_sw));
        led<=s_sw;
        if(cont > 9)then 
        cont1<= cont /10;
        cont2<= cont -10;
        else 
        cont1 <=0;
        cont2 <= cont;
        end if;
        
        cnt_s<=0;
        end if;
        cnt_s<= cnt_s +1;
        
    end if;
    end process;

end Behavioral;
