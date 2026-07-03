library ieee;
use IEEE.std_logic_1164.all;

entity dff is 
port(
    a,b,clk : in bit;
    q : out bit
);
end dff;

architecture myarch of dff is 
signal temp : bit;

begin 

temp <= a nand b;

process (clk)
begin
    if(clk'event and clk='1') then q <= temp;
    end if;
end process;
end myarch;
