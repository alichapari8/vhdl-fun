library ieee;
use IEEE.std_logic_1164.all;

entity parity_gen is 
    generic (n: integer := 7);
    port(
        input : in bit_vector(n-1 downto 0);
        output : out bit_vector( n downto 0)
    );
end parity_gen;

architecture parity of parity_gen is 
    begin 
        process ( input)
        variable temp1 : bit;
        variable temp2 : bit_vector ( output'range);

        begin
            temp1 := '0';
            for i in input'range LOOP
                temp1 := temp1 xor input(i);
                temp2(i) := input(i);
        end LOOP;

        temp2 (output'high) := temp1;
        output <= temp2;
    end process;
end parity;