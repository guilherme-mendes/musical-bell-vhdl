library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.notes.all;
package music is
   -- Número máximo de elementos de som na sequência
   constant sound_index_max : integer:=220;
   -- Type sound
   type tsound is array(0 to sound_index_max) of tnote;
   -- Sequência musical (Memória ROM)
   -- No inicio e no final da sequência, coloque um silêncio
   constant music_sequence: tsound :=(nSC,nE5,nE5,nSC,nE5,nSC,nC5,nE5,nSC,nG5,nSC,nSC,nSC,nG4,nSC,nSC,nSC,nC5,nSC,nSC,nG4,nSC,nSC,nE4,nSC,nSC,nA4,nSC,nB4,nSC,nAs1,nA4,nSC,nC5,nE5,nSC,nG5,nA5,nSC,nF5,nG5,nSC,nE5,nSC,nC5,nD5,nB4,nSC,nSC,nC5,nSC,nSC,nG4,nSC,nSC,nE4,nSC,nSC,nA4,nSC,nB4,nSC,nAs1,nA4,nSC,nC5,nE5,nSC,nG5,nA5,nSC,nF5,nG5,nSC,nE5,nSC,nC5,nD5,nB4,nSC,nSC,nG5,nFs1,nF5,nDs1,nSC,nE5,nSC,nGs1,nA4,nC5,nSC,nA4,nC5,nD5,nSC,nSC,nG5,nFs1,nF5,nDs1,nSC,nE5,nSC,nC6,nSC,nC6,nC6,nSC,nSC,nSC,nSC,nG5,nFs1,nF5,nDs1,nSC,nE5,nSC,nGs1,nA4,nC5,nSC,nA4,nC5,nD5,nSC,nSC,nDs1,nSC,nSC,nD5,nSC,nSC,nC5,nSC,nSC,nSC,nSC,nSC,nC5,nC5,nSC,nC5,nSC,nC5,nD5,nSC,nE5,nC5,nSC,nA4,nG4,nSC,nSC,nC5,nC5,nSC,nC5,nSC,nC5,nD5,nSC,nE5,nSC,nSC,nSC,nSC,nC5,nC5,nSC,nC5,nSC,nC5,nD5,nSC,nE5,nC5,nSC,nA4,nG4,nSC,nSC,nSC,nE5,nE5,nSC,nE5,nSC,nC5,nE5,nSC,nG5,nSC,nSC,nSC,nG4,nSC,nSC,nB6,nE7,nSC,nB6,nE7,nSC,nB6,nE7,nSC,nB6,nE7,nSC,nB6,nE7,nSC,nE6,nG6,nE7,nC7,nD7,nG7,nSC);
end music;
