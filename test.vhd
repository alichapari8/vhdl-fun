library ieee;
use ieee.std_logic_1164.all;

entity nand is
    port(
        a , b : in bit;
        c : out bit
    );
end nand;

architecture myarch of nand is 
    begin
       x <= a nand b;
    end myarch;
     