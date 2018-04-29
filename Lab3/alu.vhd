library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- when ctrl(2) = 0, result = src0 + 1
-- when ctrl = 100 , result = src0 + src1
-- when ctrl = 101, result = src0 – src1
-- when ctrl = 110, result = src0 and src1
-- when ctrl = 111, result = src0 or src1

entity alu is
  port (
    src0: in std_logic_vector(3 downto 0);
    src1: in std_logic_vector(3 downto 0);
    ctrl: in std_logic_vector(2 downto 0);
    result: out std_logic_vector(3 downto 0)
  );
-- TODO: Check if alu is mandatory here
end alu;

architecture arch_alu of alu is
  signal inc, sum, diff: std_logic_vector(3 downto 0);
begin
  inc <= std_logic_vector(signed(src0) + 1);
  sum <= std_logic_vector(signed(src0) + signed(src1));
  diff <= std_logic_vector(signed(src0) - signed(src1));
  -- with ctrl select
    -- result <= inc when "000"|"001"|"010"|"011",
    --           sum when "100",
    --           diff when "101",
    --           src0 and src1 when "110",
    --           src0 or src1 when others;
  result <= inc when ctrl(0) = '0' else
            sum when ctrl = "100" else
            diff when ctrl = "101" else
            src0 and src1 when ctrl = "110" else
            src0 or src1;
end arch_alu;
