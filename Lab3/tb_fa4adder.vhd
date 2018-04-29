library ieee;
library vunit_lib;
context vunit_lib.vunit_context; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_fa4adder is
  generic (runner_cfg : string);
end tb_fa4adder;

architecture arch_tb_fa4adder of tb_fa4adder is
  component fa4adder
    port (
           cin: in std_logic;
           a: in std_logic_vector(3 downto 0);
           b: in std_logic_vector(3 downto 0);
           s: out std_logic_vector(3 downto 0);
           cout: out std_logic
         );
  end component;

  -- inputs 
  signal cin: std_logic;
  signal a: std_logic_vector(3 downto 0);
  signal b: std_logic_vector(3 downto 0);

  -- outputs
  signal s: std_logic_vector(3 downto 0);
  signal cout: std_logic;

begin

  -- unit under test
  uut: fa4adder port map(
                          cin => cin,
                          a => a,
                          b => b,
                          s => s,
                          cout => cout
                        );

  main: process
  begin
    test_runner_setup(runner, runner_cfg);
    a <= "1001";
    b <= "0001";
    cin <= '0';
    wait for 1 ns;
    check_match("1010", s);

    a <= "1111";
    b <= "0000";
    cin <= '1';
    wait for 1 ns;
    check_match("0000", s);
    check_match('1', cout);

    a <= "1111";
    b <= "0001";
    cin <= '1';
    wait for 1 ns;
    check_match("0001", s);
    check_match('1', cout);

    test_runner_cleanup(runner); -- Simulation ends here
  end process;
end;














