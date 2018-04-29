library ieee;
library vunit_lib;
context vunit_lib.vunit_context; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_fa1adder is
  generic (runner_cfg : string);
end tb_fa1adder;

architecture arch_tb_fa1adder of tb_fa1adder is 

	-- component declaration for the unit under test (uut)
	component fa1adder
	port(
		cin: in std_logic;
		a: in std_logic;
		b: in std_logic;
		s: out std_logic;
    cout: out std_logic
	);
	end component;

	-- inputs
	signal cin:  std_logic;
	signal a:  std_logic;
	signal b:  std_logic;

	-- outputs
	signal s:  std_logic;
	signal cout:  std_logic;

begin

	-- instantiate the unit under test (uut)
	uut: fa1adder port map(
		cin => cin,
		a => a,
		b => b,
    s => s,
    cout => cout
	);

	main : process
	begin
    test_runner_setup(runner, runner_cfg);

		a <= '1';
		b <= '1';
		cin <= '0';
		wait for 1 ns;
    check_equal(s, '0');
    check_equal(cout, '1');
		
		wait for 1 ns;
		
		a <= '0';
    b <= '1';
    cin <= '0';
		wait for 1 ns;
    check_equal(s, '1');
    check_equal(cout, '0');

    test_runner_cleanup(runner); -- Simulation ends here
	end process;

end;


