library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_comp is
end tb_comp;

architecture Behavioral of tb_comp is
  component comp
    port (
      a: in std_logic;
      b: in std_logic;
      c: in std_logic;
      z: out std_logic
    );
  end component;
  signal a : std_logic;
  signal b : std_logic;
  signal c : std_logic;
  signal z : std_logic; 
begin
  uut: comp port map (
    a => a,
    b => b,
    c => c,
    z => z
  );
  generator : process
  begin
      wait for 5 fs;
  end process;
end;


