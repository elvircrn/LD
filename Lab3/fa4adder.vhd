library ieee;
use ieee.std_logic_1164.all;

entity fa4adder is
  port (
         cin: in std_logic;
         a: in std_logic_vector(3 downto 0);
         b: in std_logic_vector(3 downto 0);
         s: out std_logic_vector(3 downto 0);
         cout: out std_logic
       );
end fa4adder;

architecture arch_fa4adder of fa4adder is 
  component fa1adder
    port(
          cin: in std_logic;
          a: in std_logic;
          b: in std_logic;
          s: out std_logic;
          cout: out std_logic
        );
  end component;
  signal c1, c2, c3, c4: std_logic;
begin
  add1: fa1adder port map(cin, a(0), b(0), s(0), c1);
  add2: fa1adder port map(c1, a(1), b(1), s(1), c2);
  add3: fa1adder port map(c2, a(2), b(2), s(2), c3);
  add4: fa1adder port map(c3, a(3), b(3), s(3), c4); 

  cout <= c4;

end arch_fa4adder;



