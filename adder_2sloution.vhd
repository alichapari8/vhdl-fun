---- solution 1 -----------in/out = signed -----------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity adder1 is 
    port(
        a,b : in signed ( 3 downto 0);
        sum : out signed( 3 downto 0)
    );
end adder1;

architecture adder1 of adder1 is 
    begin
        sum <= a + b;
    end adder1;


------solution 2 --------- out = interger ----------

library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity adder2 is 
    port(
        a , b : in signed(3 downto 0);
        sum : out integer range -16 to 15
    );
end adder2;

architecture adder2  of adder2 is 
    begin 
        sum <= CONV_INTEGER(a + b);
    end adder2;

    