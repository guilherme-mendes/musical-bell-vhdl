----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:11 06/19/2018 
-- Design Name: 
-- Module Name:    System - Behavioral 
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

entity top_level is
    Port ( clk : in  STD_LOGIC;
           start : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           tempo_sw : in  STD_LOGIC_VECTOR (1 downto 0);
           buzzer : out  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (10 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0));
end top_level;

architecture Behavioral of top_level is
signal   clk1      : STD_LOGIC; -- Sinais auxiliares
signal   clk2      : STD_LOGIC;
signal   clk3      : STD_LOGIC;
signal   clk4      : STD_LOGIC;
signal   sound_div : integer range 0 to 15289;
begin
   comp_clk_divider : entity work.clk_divider
      generic map (
                   freq => 100000000
   )
      port map (
                clk_50mhz => clk,
                start     => start,
                stop      => stop,
                tempo_sw  => tempo_sw,
                clk1      => clk1,
                clk2      => clk2,
                clk3      => clk3,
                clk4      => clk4
   );
   -- Port map declaracao para sound_generator
   comp_sound_generator : entity work.sound_generator
      port map (
                clk1      => clk1,
                clk4      => clk4,
                start     => start,
                buzzer    => buzzer,
                sound_div => sound_div -- saída das notas
   );
   -- Port map declaracao para frequency_indicator
   comp_frequency_indicator : entity work.frequency_indicator
      port map (
                sound_div => sound_div,
                led       => led
   );
   -- Port map declaracao para timer
   comp_timer : entity work.timer
      port map (
                clk2  => clk2,
                clk3  => clk3,
                start => start,
                an    => an,
                seg   => seg
   );
end Behavioral;

