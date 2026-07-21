library ieee;
use IEEE.std_logic_1164.all;

entity p_encoder is
    port(
        r: in std_logic_vector (6 downto 0);
        code : out std_logic_vector( 2 downto 0)
    );

end p_encoder;

architecture dataflow of p_encoder is

    signal any_request : sed_logic;

    begin 
        --- -- Detect if any bit is active
    any_request <= r(6) OR r(5) OR r(4) OR r(3) OR 
                   r(2) OR r(1) OR r(0);
    
    -- Priority encoding with WHEN/ELSE
    code <= "111" WHEN r(6) = '1' ELSE
            "110" WHEN r(5) = '1' ELSE
            "101" WHEN r(4) = '1' ELSE
            "100" WHEN r(3) = '1' ELSE
            "011" WHEN r(2) = '1' ELSE
            "010" WHEN r(1) = '1' ELSE
            "001" WHEN r(0) = '1' ELSE
            "000";
END dataflow;
