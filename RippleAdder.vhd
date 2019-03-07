----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2019 03:51:53 PM
-- Design Name: 
-- Module Name: RippleAdder - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity RippleAdder is
    Port ( A : in std_logic_vector (3 downto 0);
           B : in std_logic_vector (3 downto 0);
           Cin: in std_logic;
           Cout : out std_logic;
           S : out std_logic_vector (3 downto 0));
end RippleAdder;

architecture Behavioral of RippleAdder is
component Adder_1bit
Port (  Cin : in std_logic;
        A : in std_logic;
        B : in std_logic;
        Sumout : out std_logic;
        Cout: out std_logic);
end component;

signal c1,c2,c3 : std_logic;

begin

FA0: Adder_1bit
Port map(   Cin => Cin,
            A => A(0),
            B => B(0),
            Sumout => S(0),
            Cout => c1);

FA1: Adder_1bit
Port map(   Cin => c1,
            A => A(1),
            B => B(1),
            Sumout => S(1),
            Cout => c2);

FA2: Adder_1bit
Port map(   Cin => c2,
            A => A(2),
            B => B(2),
            Sumout => S(2),
            Cout => c3);

FA3: Adder_1bit
Port map(   Cin => c3,
            A => A(3),
            B => B(3),
            Sumout => S(3),
            Cout => Cout);

end Behavioral;
