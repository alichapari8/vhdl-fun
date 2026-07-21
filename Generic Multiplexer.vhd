library ieee;
use IEEE.std_logic_1164.all;

------ sloution 1----------

entity generic_mux is 
    generic(
        n : integer := 4; --- number of selection bits
        m : integer := 8 --- number of bits per input
    );

    port(
        x : in bit_vector ( m*2**n downto 0);
        sel : in integer range 0 to 2**n-1;
        y : out bit_vector ( m-1 downto 0)
    );
end generic_mux;

architecture generic_mux of generic_mux is
    begin
        gen : FOR i in m-1 downto 0 generate
            y(i) <= x(m*sel+i);
    end generate gen;
end generic_mux;

-----------------------------------------------

---------------- sloution 2------ user defined type is employed---------

--- package ------------
package my_data_type is 
    type matrix is array ( natural range <> , natural range <> ) of bit;
end package my_data_type;


---- main code---------
use work.my_data_type.all;

entity generic_mux2 is
    generic(
        inputs : integer := 16;
        size : integer := 8
    );

    port(
        x: in matrix (0 to inputs-1 , size-1 downto 0);
        sel : in integer range 0 to inputs-1;
        y : out bit_vector( size-1 downto 0)
    );

end generic_mux2;

architecture arch of generic_mux2 is
    begin
        gen : for i in size-1 downto 0 generate
        y(i) <= x(sel,i);
    end generate gen;

end arch;