----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:30 06/19/2018 
-- Design Name: 
-- Module Name:    frequency_indicator - Behavioral 
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

entity frequency_indicator is
    Port ( sound_div : in  integer range 0 to 15289; -- Divisor de frequencia (A)
           led : out  STD_LOGIC_VECTOR (10 downto 0));
end frequency_indicator;

architecture Behavioral of frequency_indicator is
	type limite_type is array (0 to 9) of integer range 0 to 15625;
	constant limite : limite_type :=(
		31, 63, 125, 250, 500, 1000, 2000, 4000, 7813, 15625
	); -- B
	signal comp : std_logic_vector(9 downto 0):=(others=>'0');
begin
comp_array : for i in 0 to 9 generate -- Comparadores
	comp(i) <= '1' when (sound_div <= limite(i)) else '0';
end generate comp_array;

led(0) <= comp(0);
led(10) <= not(comp(9));
led_array : for i in 1 to 9 generate -- array leds
	led(i) <= not(comp(i-1)) and comp(i); -- contagem a partir do 0 (ligar apenas um led)
end generate led_array;
end Behavioral;

