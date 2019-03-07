----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2019 03:59:42 PM
-- Design Name: 
-- Module Name: tb_RippleAdder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_RippleAdder is
end tb_RippleAdder;

architecture Behavioral of tb_RippleAdder is
component RippleAdder
Port ( A : in std_logic_vector (3 downto 0);
           B : in std_logic_vector (3 downto 0);
           Cin: in std_logic;
           Cout : out std_logic;
           S : out std_logic_vector (3 downto 0));
end component;

signal tb_A : std_logic_vector(3 downto 0) := "0101";
signal tb_B : std_logic_vector(3 downto 0) := "1010";
signal tb_C : std_logic := '0';
signal S : std_logic_vector(3 downto 0) := "0000";
signal Cout : std_logic;

begin

inputgen: process
begin

wait for 100 ns;
tb_A <= "0000";
tb_B <= "0001";
tb_C <= '0';

wait for 100 ns;
tb_A <= "1000";
tb_B <= "0101";
tb_C <= '1';

wait for 100 ns;
tb_A <= "1111";
tb_B <= "0100";
tb_C <= '1';

wait for 100 ns;
tb_A <= "0000";
tb_B <= "0000";
tb_C <= '1';

end process;

testDev: RippleAdder
Port map(   A => tb_A,
            B => tb_B,
            Cin => tb_C,
            Cout => Cout,
            S => S);

end Behavioral;
