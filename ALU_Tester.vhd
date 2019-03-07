----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2019 04:46:18 PM
-- Design Name: 
-- Module Name: ALU_Tester - Behavioral
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

entity ALU_Tester is
    Port ( led : out STD_LOGIC_VECTOR (3 downto 0);
           btn : in STD_LOGIC_VECTOR (3 downto 0);
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC);
end ALU_Tester;

architecture Behavioral of ALU_Tester is
signal debounced: std_logic_vector(3 downto 0);
signal temp_A, temp_b, temp_op, temp_reset: std_logic_vector(3 downto 0);

component MY_ALU
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Opcode : in STD_LOGIC_VECTOR (3 downto 0);
           ALUOut : out STD_LOGIC_VECTOR (3 downto 0)); 
end component;

component debounce
    Port( clk : in STD_LOGIC;
       btn : in STD_LOGIC;
       dbnc : out STD_LOGIC);
end component;
begin

assign:Process(clk)
begin
    if(rising_edge(clk)) then
        if(debounced(3) = '1') then
            temp_a <= "0000";
            temp_b <= "0000";
            temp_op <= "0000";
        elsif(debounced(0) = '1') then
            temp_b <= sw(3 downto 0);
        elsif(debounced(1) = '1') then
            temp_a <= sw(3 downto 0);
        elsif(debounced(2) = '1') then
            temp_op <= sw(3 downto 0);
        end if;
    end if;
end process;

Button_Debounce0: debounce
port map(clk => clk,
         btn => btn(0),
         dbnc => debounced(0));

Button_Debounce1: debounce
port map(clk => clk,
         btn => btn(1),
         dbnc => debounced(1));
         
Button_Debounce2: debounce
port map(clk => clk,
         btn => btn(2),
         dbnc => debounced(2));

Button_Debounce3: debounce
port map(clk => clk,
         btn => btn(3),
         dbnc => debounced(3));

ALU: MY_ALU
port map(A(3 downto 0) => temp_A(3 downto 0),
         B(3 downto 0) => Temp_B(3 downto 0),
         opcode(3 downto 0) => Temp_op(3 downto 0),
         ALUOut(3 downto 0) => led(3 downto 0));

end Behavioral;
