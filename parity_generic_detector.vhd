library ieee;
use IEEE.std_logic_1164.all;

entity parity_det is 
    generic (n : integer :=7);
    port(
        input: in bit_vector( n downto 0);
        output : out bit
    );
end parity_det;


architecture parity of parity_det is
    begin
         process(input)
         variable temp : bit;

         begin
            temp := '0';
            for i in input'range LOOP
                temp := temp xor input(i);
         end LOOP;
         output <= temp;
        end process;
         
    end parity;