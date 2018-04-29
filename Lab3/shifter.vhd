library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shifter is
  port (
    a: in std_logic_vector(7 downto 0);
    ctrl: in std_logic_vector(2 downto 0);
    b: out std_logic_vector(7 downto 0)
  );
end;

architecture arch_shifter of shifter is
	signal shifted: std_logic_vector(7 downto 0);
begin
  shifted <= std_logic_vector(shift_left(signed(a), to_integer(unsigned(ctrl))));
	b <= shifted;
end arch_shifter ; -- arch_shifter