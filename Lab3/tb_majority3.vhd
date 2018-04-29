library ieee;
library vunit_lib;
context vunit_lib.vunit_context; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_majority3 is
  generic (runner_cfg : string);
end tb_majority3;

architecture tb_arch of tb_majority3 is
  component majority3
    port(
      x1, x2, x3: in std_logic; 
      f: out std_logic);
  end component;

  signal test_x1: std_logic;
  signal test_x2: std_logic;
  signal test_x3: std_logic;

  signal test_f: std_logic;

  function to_int ( s : std_logic ) return natural is
  begin
    if s = '1' then
      return 1;
    else
      return 0;
    end if;
  end function;
  

begin
  -- Instantiate the unit under test
  uut: majority3
    port map (
               x1 => test_x1,
               x2 => test_x2,
               x3 => test_x3,
               f  => test_f
             );

  -- Test code generator
  main: process
  begin
    test_runner_setup(runner, runner_cfg);
    
    test_x1 <= '0';
    test_x2 <= '0';
    test_x3 <= '0';
    wait for 2 ns;
    test_x1 <= '1';
    test_x2 <= '1';
    test_x3 <= '0';
    wait for 2 ns;
    test_runner_cleanup(runner); -- Simulation ends here
    
  end process;

  -- Verifier
  process
    variable error_status: boolean;
    variable sum: integer;
  begin
    wait on test_x1, test_x2, test_x3;
    wait for 1 ns;
    sum := to_int(test_x1) + to_int(test_x2) + to_int(test_x3);

    if (sum > 1 and test_f = '1') then
      error_status := true;
    end if;

    if (sum < 2 and test_f = '1') then
      error_status := true;
    else
      error_status := false;
    end if;

    -- Error reporting
    assert not error_status;
    end process;
    
end tb_arch;



