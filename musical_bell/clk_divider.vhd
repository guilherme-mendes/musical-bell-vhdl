----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:48:04 06/17/2018 
-- Design Name: 
-- Module Name:    clk_divider - Behavioral 
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

entity clk_divider is
    Generic(freq : integer := 50000000); -- Constante do divisor de clock
    Port ( clk_50mhz : in  STD_LOGIC;
           start : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           tempo_sw : in  STD_LOGIC_VECTOR(1 downto 0);
           clk1 : out  STD_LOGIC;
		   clk2 : out  STD_LOGIC;
		   clk3 : out  STD_LOGIC;
           clk4 : out  STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is
    signal clk_1hz     : std_logic;
	signal clk_1mhz    : std_logic;
	signal clk_50hz_gated : std_logic;
	signal enable      : std_logic;
	signal clk_50hz    : std_logic;
	constant div1 : integer := (freq/1000000)/2 - 1; -- 1 MHz (começar a contar do 0)
	constant div2 : integer := (1000000/50)/2 - 1;
	constant div3 : integer := (50/1)/2 - 1;
	signal tempo_div : integer range 0 to 19 := 0;
begin
PROCESS(clk_50mhz)
variable tmp: std_logic; -- variavel temporária
begin
if(clk_50mhz='1' and clk_50mhz'EVENT) then -- Tabela SR (SET E RESET)
	if(start='0' and stop='0')then
		tmp:=tmp;
	elsif(start='1' and stop='1')then
		tmp:='0';
	elsif(start='0' and stop='1')then
		tmp:='0';
	else
		tmp:='1';
	end if;
end if;
enable <= tmp;
end PROCESS;

divider1:entity work.clock_divider -- Divisor de clock generico
    Generic map(max=>div1)
    Port map( clk => clk_50mhz,
	           div => div1,
              clk_out => clk_1mhz);
divider2:entity work.clock_divider
    Generic map(max=>div2)
    Port map( clk => clk_1mhz,
	           div => div2,
              clk_out => clk_50hz);
divider3:entity work.clock_divider
    Generic map(max=>div3)
    Port map( clk => clk_50hz_gated,
	           div => div3,
              clk_out => clk_1hz);
divider4:entity work.clock_divider
    Generic map(max=>19)
    Port map( clk => clk_50hz_gated,
	           div => tempo_div,
              clk_out => clk4);
tempo_div <= 4   when tempo_sw = "10" else -- MUX  tempo_div (MUX)
             9   when tempo_sw = "00" else
		     19  when tempo_sw = "01" else
		     19;

clk_50hz_gated <= clk_50hz and enable;
clk1 <= clk_1mhz and enable;
clk2 <= clk_50hz;
clk3 <= clk_1hz;

end Behavioral;

