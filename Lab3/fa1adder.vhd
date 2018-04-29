library ieee;
use ieee.std_logic_1164.all;

entity fa1adder is
	port (
		cin: in std_logic;
		a: in std_logic;
		b: in std_logic;
		s: out std_logic;
		cout: out std_logic
	);
end fa1adder;

architecture arch_fa1adder of fa1adder is 
begin
	s <= cin xor a xor b;
	cout <= (a and b) or (a and cin) or (b and cin);
end arch_fa1adder;


