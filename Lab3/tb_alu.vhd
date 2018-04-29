library ieee;
library vunit_lib;
context vunit_lib.vunit_context; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_alu is
  generic (runner_cfg : string);
end tb_alu;

architecture arch_tb_alu of tb_alu is
  component alu
    port (
           src0: in std_logic_vector(3 downto 0);
           src1: in std_logic_vector(3 downto 0);
           ctrl: in std_logic_vector(2 downto 0);
           result: out std_logic_vector(3 downto 0)
         );
  end component;

  signal src0, src1, result : std_logic_vector(3 downto 0);
  signal ctrl : std_logic_vector(2 downto 0);

begin
  uut: alu port map( 
                     src0 => src0,
                     src1 => src1,
                     ctrl => ctrl,
                     result => result
                   );
  main: process
  begin
    test_runner_setup(runner, runner_cfg);
    src0 <= "0101";
    src1 <= "0001";
    ctrl <= "100";
    wait for 1 ns;
    check_match("0110", result);

    src0 <= "0101";
    src1 <= "0001";
    ctrl <= "101";
    wait for 1 ns;
    check_match("0100", result);


    src0 <= "0101";
    src1 <= "0001";
    ctrl <= "000";
    wait for 1 ns;
    check_match("0110", result);

    src0 <= "0101";
    src1 <= "0001";
    ctrl <= "010";
    wait for 1 ns;
    check_match("0110", result);
    test_runner_cleanup(runner); -- Simulation ends here
  end process;
end;



