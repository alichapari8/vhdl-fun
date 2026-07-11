library ieee;
use IEEE.std_logic_1164.all;


entity encoder is 
    port(
        x: in std_logic_vector ( 7 downto 0);
        y: out std_logic_vector(2 downto 0)
    );

end encoder;


--------------- s1 with when / else  -----------------

architecture encoder1 of encoder is
    begin

        y <= "000" when x = "00000001";
        "001" WHEN x="00000010" ELSE
        "010" WHEN X="00000100" ELSE
        "011" WHEN X="00001000" ELSE
        "100" WHEN X="00010000" ELSE
        "101" WHEN X="00100000" ELSE
        "110" WHEN X="01000000" ELSE    
        "111" WHEN X="10000000" ELSE
        "ZZZ";
    end encoder1;

------------------- s2 with with/select/when -----------------\

architecture encoder2 of encoder is 
    begin
        wiht x SELECT 
            y <= "000" when "00000001",
            "001" WHEN "00000010",
            "010" WHEN "00000100",
            "011" WHEN "00001000",
            "100" WHEN "00010000",
            "101" WHEN "00100000",
            "110" WHEN "01000000",
            "111" WHEN "10000000",
            "ZZZ" WHEN OTHERS;

    end encoder2;