----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:03 06/19/2018 
-- Design Name: 
-- Module Name:    timer - Behavioral 
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

entity timer is
    Port ( clk2 : in  STD_LOGIC;
           clk3 : in  STD_LOGIC;
           start : in  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0));
end timer;

architecture Behavioral of timer is
	signal counter1, counter2, MUX : integer range 0 to 9:=0; -- variavel
	signal carry : std_logic := '0'; -- variavel 
begin
process(clk3, start) -- contador 1 (0 a 9)
begin
if(start='1')then -- start timer
	counter1 <= 0;
	carry <= '0';
elsif rising_edge(clk3) then
	if(counter1 = 9) then -- ate 9
		counter1 <= 0;
		carry <= '1';
	else
		counter1 <= counter1 + 1;
		carry <= '0';
	end if;
end if;
end process;

process(carry, start) -- contador 2 (0 a 9)
begin
if(start='1')then
	counter2 <= 0;
elsif rising_edge(carry) then
	if(counter2 = 9) then
		counter2 <= 0;
	else
		counter2 <= counter2 + 1;
	end if;
end if;
end process;

MUX <= counter1 when clk2='0' else counter2; 
-- binário para 7seg
seg(6 downto 0) <=
        --  gfedcba 
           "1000000" when MUX=0  else--0
           "1001111" when MUX=1  else--1
           "0100100" when MUX=2  else--2
           "0110000" when MUX=3  else--3
           "0011001" when MUX=4  else--4
           "0010010" when MUX=5  else--5
           "0000010" when MUX=6  else--6
           "1111000" when MUX=7  else--7
           "0000000" when MUX=8  else--8
           "0010000" when MUX=9  else--9
           "0001000" when MUX=10 else--A
           "0000011" when MUX=11 else--B
           "1000110" when MUX=12 else--C
           "0100001" when MUX=13 else--D
           "0000110" when MUX=14 else--E
           "0001110" when MUX=15 else--F
           "0000000";-- Todos segmentos desligados -- inicio
an(0) <= clk2;
an(1) <= not(clk2);
an(2) <= '1';
an(3) <= '1';
end Behavioral;

