library ieee;
use ieee.std_logic_1164.all;

entity decoder is 
    port(ena : in std_logic;
         sel : in std_logic_vector ( 2 downto 0);
         x : out std_logic_vector(7 downto 0)
         );
end decoder;



architecture generic_decoder of decoder is 
    begin
        process( ena , sel )
        variable temp1 : std_logic_vector ( x'HIGH downto 0);
        variable temp2 : INTEGER RANGE 0 TO x'high;
    begin
        temp1 := ( OTHERS => '1');
        temp2 := 0;
        if( ena  = '1') then
            FOR i in sel'range LOOP --- sel range is 2 downto 0
            if(sel(i)='1') then   -- bit to integer conversion
                temp2 :=2*temp2+1;
            else
                temp2 := 2* temp2;
            end if;
        end LOOP;
        temp1(temp2):='0';
        end if;
        x <= temp1;
    end process;
end generic_decoder;
