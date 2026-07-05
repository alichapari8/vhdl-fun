library ieee;
use IEEE.std_logic_1164.all;

entity and_bit is 
    port( 
        a , b : in bit;
        x: out bit
    );
end and_bit;

architecture and_bit_behaveir of and_bit is 
    begin
        x <= a and b;
    end and_bit_behaveir;


    entity and_vector is 
        port(
            a , b : in bit_vector( 0 to 3);
            x : out bit_vector(0 to 3)
        );

    end and_vector;

    architecture and_vector_behavier of and_vector is 
        begin
            x<= a and b;
        end and_vector_behavier;

        