library ieee;
library vunit_lib;
context vunit_lib.vunit_context; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_shifter is
  generic (runner_cfg : string);
end tb_shifter;

architecture arch_tb_shifter of tb_shifter is
  component shifter is
    port (
      a: in std_logic_vector(7 downto 0);
      ctrl: in std_logic_vector(2 downto 0);
      b: out std_logic_vector(7 downto 0)
    );
  end component;

begin

end arch_tb_shifter ; -- arch_tb_shifter