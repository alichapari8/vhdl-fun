library ieee;
use IEEE.std_logic_1164.all;

entity tri_state is 
    prot(
        ena : in std_logic;
        input : in std_logic_vector (7 downto 0);
        output : out std_logic_vector ( 7 downto 0);
    )
end tri_state;


architecture tri_state of tri_state is 
    begin
    output <= input when (ena='0') else
                (OTHERS => 'Z');
    end tri_state;

    