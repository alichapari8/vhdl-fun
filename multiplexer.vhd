library ieee;
use IEEE.std_logic_1164.all


-- simple way to make a mux---
entity mux is 
    port( a , b , c ,d , s1 , s0 : in std_logic ; 
          y: out std_logic);
end mux;


architecture pure_logic of mux is 
    begin
        y <= (a and not s1 and not s0) or
             (b and not s1 and s0) or
             (c and s1 and not s0) or
             (d and s1 and s0);
    end pure_logic;



----- solution 1 : with when/else ---------

entity mux_2 is 
    port(
        a , b , c , d : in std_logic;
        sel : in std_logic_vector ( 1 downto 0);
        y : out std_logic
    );

end mux_2;

architecture mux_2 of mux_2 is 
    begin
    y <= a when sel="00" else
         b when sel="01" else
         c when sel="10" else
         d;
         end mux_2;


------- solution 2 : with  with/select/when ------------

entity mux_3 is 
    port(
        a, b, c, d : in std_logic;
        sel : in std_logic_vector (1 downto 0);
        y : out std_logic;
    );

end mux_3;

architecture mux_3 of mux_3 is 
    begin 
        with sel select
        y <= a when "00",   --
             b when "01",
             c when "10",
             d when OTHERS;

    end mux_3;