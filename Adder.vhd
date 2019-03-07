library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Adder_1bit is
Port (  Cin : in std_logic;
        A : in std_logic;
        B : in std_logic;
        Sumout : out std_logic;
        Cout: out std_logic);
end Adder_1bit;

architecture Behavioral of Adder_1bit is
begin

Sumout <= A xor B xor Cin;
Cout <= (((A xor B) and Cin) or (A and B));

end Behavioral;
