----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:33 06/14/2018 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
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

entity clock_divider is
    Generic(max:integer:=100);
    Port ( clk : in  STD_LOGIC;
           div : in  integer range 0 to max-1;
           clk_out : out  STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is
	signal clk_reg : std_logic := '0';
	signal counter : integer := 0;
begin
process(clk)
begin
if rising_edge(clk) then -- divisor de clock
	if(counter>=div)then
		counter <= 0;
		clk_reg <= not(clk_reg);
	else
		counter <= counter + 1;
	end if;
end if;
end process;
clk_out <= clk_reg;
end Behavioral;

