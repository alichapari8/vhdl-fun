
------------- three solution ------------

------------ solution 1 ----------------

library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity multi_divi1 is
    port(
        a : in integer range 0 to 255; --- 8 bit unsigned
        b : in integer range 0 to 255; --- 8 bit unsigned
        x : out integer range 0 to 65025; -- 16 bit result of (255 * 255)
        y : out integer range 0 to 127;  --- 7 bit result of( 255/2)

    );

end multi_divi1;


architecture dataflow of multi_divi1 is
    begin 
        ---multi
        x <= a*b;

        --divi
        y<= a/2;

    end dataflow;






----------------------- solution 2--------------------

entity multi_divi2 is 
    port(
        a : in std_logic_vector(7 downto 0); --- 8 bit input
        b : in std_logic_vector(7 downto 0); --- 8 bit input
        x : out std_logic_vector(15 downto 0); --- 16 bit output 
        y : out std_logic_vector(7 downto 0) --- 8 bit output
    );

end multi_divi2;

ARCHITECTURE dataflow OF multiplier_divider IS
    SIGNAL a_int, b_int : INTEGER RANGE 0 TO 255;
    SIGNAL x_int : INTEGER RANGE 0 TO 65025;
    SIGNAL y_int : INTEGER RANGE 0 TO 127;
BEGIN
    -- 
    a_int <= TO_INTEGER(UNSIGNED(a));
    b_int <= TO_INTEGER(UNSIGNED(b));
    
    
    x_int <= a_int * b_int;
    y_int <= a_int / 2;
    
    -- 
    x <= STD_LOGIC_VECTOR(TO_UNSIGNED(x_int, 16));
    y <= STD_LOGIC_VECTOR(TO_UNSIGNED(y_int, 8));
END dataflow;


---------- solution 3 ---------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY multiplier_divider IS
    PORT (
        a : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        b : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        x : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END multiplier_divider;

ARCHITECTURE dataflow OF multiplier_divider IS
BEGIN
    -
    x <= STD_LOGIC_VECTOR(UNSIGNED(a) * UNSIGNED(b));
    
    -- 
    y <= STD_LOGIC_VECTOR(SHIFT_RIGHT(UNSIGNED(a), 1));
    
    -- 
    -- y <= '0' & a(7 DOWNTO 1);  - an other way for divi
END dataflow;