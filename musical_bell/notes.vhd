----------------------------------------------------------------------------------
-- Create Date: 24.05.2018 23:57:41
-- Design Name: Notas musicais
-- Module Name: notes - packed
-- Project Name: campainha musical
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

package notes is
    -- Frequence divisor of octave 1 notes => freq clk1 / (freq nota*2)
    -- when the count end, the sound out change the state (freq is 2freq nota)
    subtype tnote is integer range 0 to 15289;
                                        -- Octava  Nota Musical
    constant nSC    : tnote :=0;        --    -       silence                          
    constant nC1    : tnote :=15289;    --    1	      C
    constant nCs1   : tnote :=14431;    --    1	      C#/Db
    constant nD1    : tnote :=13621;    --    1	      D
    constant nDs1   : tnote :=12857;    --    1	      D#/Eb
    constant nE1    : tnote :=12135;    --    1	      E
    constant nF1    : tnote :=11454;    --    1	      F
    constant nFs1   : tnote :=10811;    --    1	      F#/Gb
    constant nG1    : tnote :=10204;    --    1	      G
    constant nGs1   : tnote :=9631 ;    --    1	      G#/Ab
    constant nA1    : tnote :=9091 ;    --    1	      A
    constant nAs1   : tnote :=8581 ;    --    1	      A#/Bb
    constant nB1    : tnote :=8099 ;    --    1	      B
    constant nC2    : tnote :=7645 ;    --    2	      C
    constant nCs2   : tnote :=7216 ;    --    2	      C#/Db
    constant nD2    : tnote :=6811 ;    --    2	      D
    constant nDs2   : tnote :=6428 ;    --    2	      D#/Eb
    constant nE2    : tnote :=6068 ;    --    2	      E
    constant nF2    : tnote :=5727 ;    --    2	      F
    constant nFs2   : tnote :=5406 ;    --    2	      F#/Gb
    constant nG2    : tnote :=5102 ;    --    2	      G
    constant nGs2   : tnote :=4816 ;    --    2	      G#/Ab
    constant nA2    : tnote :=4545 ;    --    2	      A
    constant nAs2   : tnote :=4290 ;    --    2	      A#/Bb
    constant nB2    : tnote :=4050 ;    --    2	      B
    constant nC3    : tnote :=3822 ;    --    3	      C
    constant nCs3   : tnote :=3608 ;    --    3	      C#/Db
    constant nD3    : tnote :=3405 ;    --    3	      D
    constant nDs3   : tnote :=3214 ;    --    3	      D#/Eb
    constant nE3    : tnote :=3034 ;    --    3	      E
    constant nF3    : tnote :=2863 ;    --    3	      F
    constant nFs3   : tnote :=2703 ;    --    3	      F#/Gb
    constant nG3    : tnote :=2551 ;    --    3	      G
    constant nGs3   : tnote :=2408 ;    --    3	      G#/Ab
    constant nA3    : tnote :=2273 ;    --    3	      A
    constant nAs3   : tnote :=2145 ;    --    3	      A#/Bb
    constant nB3    : tnote :=2025 ;    --    3	      B
    constant nC4    : tnote :=1911 ;    --    4	      C
    constant nCs4   : tnote :=1804 ;    --    4	      C#/Db
    constant nD4    : tnote :=1703 ;    --    4	      D
    constant nDs4   : tnote :=1607 ;    --    4	      D#/Eb
    constant nE4    : tnote :=1517 ;    --    4	      E
    constant nF4    : tnote :=1432 ;    --    4	      F
    constant nFs4   : tnote :=1351 ;    --    4	      F#/Gb
    constant nG4    : tnote :=1276 ;    --    4	      G
    constant nGs4   : tnote :=1204 ;    --    4	      G#/Ab
    constant nA4    : tnote :=1136 ;    --    4	      A
    constant nAs4   : tnote :=1073 ;    --    4	      A#/Bb
    constant nB4    : tnote :=1012 ;    --    4	      B
    constant nC5    : tnote :=956  ;    --    5	      C
    constant nCs5   : tnote :=902  ;    --    5	      C#/Db
    constant nD5    : tnote :=851  ;    --    5	      D
    constant nDs5   : tnote :=804  ;    --    5	      D#/Eb
    constant nE5    : tnote :=758  ;    --    5	      E
    constant nF5    : tnote :=716  ;    --    5	      F
    constant nFs5   : tnote :=676  ;    --    5	      F#/Gb
    constant nG5    : tnote :=638  ;    --    5	      G
    constant nGs5   : tnote :=602  ;    --    5	      G#/Ab
    constant nA5    : tnote :=568  ;    --    5	      A
    constant nAs5   : tnote :=536  ;    --    5	      A#/Bb
    constant nB5    : tnote :=506  ;    --    5	      B
    constant nC6    : tnote :=478  ;    --    6	      C
    constant nCs6   : tnote :=451  ;    --    6	      C#/Db
    constant nD6    : tnote :=426  ;    --    6	      D
    constant nDs6   : tnote :=402  ;    --    6	      D#/Eb
    constant nE6    : tnote :=379  ;    --    6	      E
    constant nF6    : tnote :=358  ;    --    6	      F
    constant nFs6   : tnote :=338  ;    --    6	      F#/Gb
    constant nG6    : tnote :=319  ;    --    6	      G
    constant nGs6   : tnote :=301  ;    --    6	      G#/Ab
    constant nA6    : tnote :=284  ;    --    6	      A
    constant nAs6   : tnote :=268  ;    --    6	      A#/Bb
    constant nB6    : tnote :=253  ;    --    6	      B
    constant nC7    : tnote :=239  ;    --    7	      C
    constant nCs7   : tnote :=225  ;    --    7	      C#/Db
    constant nD7    : tnote :=213  ;    --    7	      D
    constant nDs7   : tnote :=201  ;    --    7	      D#/Eb
    constant nE7    : tnote :=190  ;    --    7	      E
    constant nF7    : tnote :=179  ;    --    7	      F
    constant nFs7   : tnote :=169  ;    --    7	      F#/Gb
    constant nG7    : tnote :=159  ;    --    7	      G
    constant nGs7   : tnote :=150  ;    --    7	      G#/Ab
    constant nA7    : tnote :=142  ;    --    7	      A
    constant nAs7   : tnote :=134  ;    --    7	      A#/Bb
    constant nB7    : tnote :=127  ;    --    7	      B
    constant nC8    : tnote :=119  ;    --    8	      C
    constant nCs8   : tnote :=113  ;    --    8	      C#/Db
    constant nD8    : tnote :=106  ;    --    8	      D
    constant nDs8   : tnote :=100  ;    --    8	      D#/Eb
    constant nE8    : tnote :=95   ;    --    8	      E
    constant nF8    : tnote :=89   ;    --    8	      F
    constant nFs8   : tnote :=84   ;    --    8	      F#/Gb
    constant nG8    : tnote :=80   ;    --    8	      G
    constant nGs8   : tnote :=75   ;    --    8	      G#/Ab
    constant nA8    : tnote :=71   ;    --    8	      A
    constant nAs8   : tnote :=67   ;    --    8	      A#/Bb
    constant nB8    : tnote :=63   ;    --    8	      B
    constant nC9    : tnote :=60   ;    --    9	      C
    constant nCs9   : tnote :=56   ;    --    9	      C#/Db
    constant nD9    : tnote :=53   ;    --    9	      D
    constant nDs9   : tnote :=50   ;    --    9	      D#/Eb
    constant nE9    : tnote :=47   ;    --    9	      E
    constant nF9    : tnote :=45   ;    --    9	      F
    constant nFs9   : tnote :=42   ;    --    9	      F#/Gb
    constant nG9    : tnote :=40   ;    --    9	      G
    constant nGs9   : tnote :=38   ;    --    9	      G#/Ab
    constant nA9    : tnote :=36   ;    --    9	      A
    constant nAs9   : tnote :=34   ;    --    9	      A#/Bb
    constant nB9    : tnote :=32   ;    --    9	      B
end notes;
