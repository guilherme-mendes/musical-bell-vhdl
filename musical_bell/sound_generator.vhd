----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:26:04 06/18/2018 
-- Design Name: 
-- Module Name:    sound_generator - Behavioral 
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
use work.music.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sound_generator is
    Port ( clk1 : in  STD_LOGIC;
           clk4 : in  STD_LOGIC;
           start : in  STD_LOGIC;
           buzzer : out  STD_LOGIC;
	       sound_div : out integer range 0 to 15289);
end sound_generator;

architecture Behavioral of sound_generator is
	signal counter : integer range 0 to 220 := 0; -- Numero maximo de elementos de som na sequencia
	signal div     : integer range 0 to 15289 := 0; -- tnote
	signal clk_out : std_logic;
begin
sound_div <= music_sequence(counter); -- music.vhd
div <= music_sequence(counter)/4;
process(clk4, start)
begin
if start='1' then -- Reinicia sequencia
	counter <= 0;
elsif rising_edge(clk4) then
    if(counter=220)then
        counter <= 0;
    else
	   counter <= counter + 1; 
	end if;
end if;
end process;
divider1:entity work.clock_divider
    Generic map(max=>15289)
    Port map( clk => clk1,
	           div => div,
              clk_out => clk_out);
buzzer <= clk_out when (div/=0) else '0'; -- MUX
end Behavioral;

