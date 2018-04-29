# Shifting
``` 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

shifted <= to_stdlogicvector (to_bitvector (a) sll 	(signed(ctrl)));
shifted <= std_logic_vector(shift_left(signed(a), to_integer(unsigned(ctrl))));

```

