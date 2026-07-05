library ieee;
use ieee.std_logic_1164.all

entity gates is 
    port(
        a , b , c : in std_logic;
        d : out std_logic
    );
end gates;


architecture behaveir of gates is 
    signal and_gate : std_logic;
    signal or_gate : std_logic;
    begin
        and_gate <= a and b;

        or_gate <= and_gate or (not c);
        
        d <= a nand or_gate;

    end behaveir;
        