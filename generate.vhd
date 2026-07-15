library ieee;
use IEEE.std_logic_1164.all;


entity shifter is 
    port(
        inp : in std_logic_vector ( 3 downto 0);
        sel : in integer 0 to 4;
        outp: out std_logic_vector ( 7 downto 0)
    );
end entity;


architecture shifter of shifter is 
    subtype vector is std_logic_vector ( 7 downto 0);
    type matrix is array ( 4 downto 0) of vector;
    signal row: matrix;
    begin
        row(0) <= "0000" & inp;
        G1 : for i in 1 to 4 generate
         row(i) < row(i-1) (6 downto 0) & '0'active
    end generate;

    outp < row(sel);
end shifter;