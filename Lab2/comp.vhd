library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity comp is
  port (
    a: in std_logic;
    b: in std_logic;
    c: in std_logic;
    z: out std_logic
  );
end comp;

architecture Behavioral of comp is
begin
  z <= (a and (b or c));
end Behavioral;

