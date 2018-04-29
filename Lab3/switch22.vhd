library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity switch22 is
  port (
         x: in std_logic_vector(2 downto 0);
         ctrl: in std_logic_vector(2 downto 0);
         y: out std_logic_vector(2 downto 0)
       );
end switch22;

architecture arch_switch22 of switch22 is
  signal cross: std_logic_vector(2 downto 0);
  signal cast0: std_logic_vector(2 downto 0);
  signal cast1: std_logic_vector(2 downto 0);
begin
  y(0) <= x(0) when ctrl = "00" or ctrl = "10" else x(1);
  y(1) <= x(1) when ctrl = "00" or ctrl = "11" else x(0);
end arch_switch22;
