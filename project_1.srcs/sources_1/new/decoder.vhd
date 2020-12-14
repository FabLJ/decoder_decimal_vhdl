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
    clk : in std_logic; -- clock para o process
    sw0:in std_logic; -- switch 0
    sw1: in std_logic;-- switch 1
    sw2: in std_logic;-- switch 2
    sw3: in std_logic;-- switch 3
    
    led: out std_logic_vector(0 to 3); -- vetor dos leds built-in
    display0: out std_logic_vector(0 to 6); -- vetor logico para o display mais significativo
    display1: out std_logic_vector(0 to 6) -- vetor logico para o display menos significativo
 );
end decoder;

architecture Behavioral of decoder is
constant divider_c : integer :=10000000; -- constante divisor para 100ms
signal s_sw: std_logic_vector(0 to 3):="0000"; -- variavel de vetor logico para switchs
signal cnt_s : integer range 0 to divider_c :=0; -- contados para periodo de 100ms
signal val1: std_logic_vector(0 to 3):="0000"; -- valor base o decoder do display 0
signal val2: std_logic_vector(0 to 3):="0000"; -- valor base para o decoder do display 1
signal cont : integer range 0 to 15 :=0; -- inteiro para verificar o valor a ser apresentado em display
signal cont1 : integer range 0 to 9 :=0; -- fracao de cont para display 0
signal cont2 : integer range 0 to 9 :=0; -- fracao de cont para display 1
begin
--atribui leituras dos switches para variaveis
s_sw(0) <= sw0;
s_sw(1) <= sw1;
s_sw(2) <= sw2;
s_sw(3) <= sw3;

--converte os valores inteiros para 2 vetores logicos
val1 <= std_logic_vector(to_unsigned(cont1,val1'length));
val2 <= std_logic_vector(to_unsigned(cont2,val2'length));
--decodifica para o display mais significativo
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
--decodifica para o display menos significativo                 
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
    --inicia sequencial
    process(clk)
    begin
    
    if rising_edge(clk)then
        if (cnt_s = divider_c)then --cada 100ms entra  na codnicao
     
        cont <= to_integer(unsigned(s_sw)); -- atribui um vetor logico convertido para inteiro
        led<=s_sw;   -- liga os leds para controle dos switchs ativos
        if(cont > 9)then  -- se o valor base for maior que 9 vai precisar 2 casas decimais
        cont1<= cont /10;
        cont2<= cont -10;
        else  -- se nao, so precisa da casa unitaria
        cont1 <=0;
        cont2 <= cont;
        end if;
        
        cnt_s<=0; -- zera contador quando entra na condição (100ms)
        end if;
        cnt_s<= cnt_s +1; -- conta ate 100ms
        
    end if;
    end process; -- fim da ordem sequencial

end Behavioral;
