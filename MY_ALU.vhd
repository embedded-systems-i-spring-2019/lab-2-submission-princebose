library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity MY_ALU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Opcode : in STD_LOGIC_VECTOR (3 downto 0);
           ALUOut : out STD_LOGIC_VECTOR (3 downto 0));
end MY_ALU;

architecture Behavioral of MY_ALU is

begin
opcodeselect:process(A,B,opcode)
begin
case opcode is
    when "0000" => ALUOut <= std_logic_vector(unsigned(A) + unsigned(B));
    when "0001" => ALUOut <= std_logic_vector(unsigned(A) - unsigned(B));
    when "0010" => ALUOut <= std_logic_vector(unsigned(A) + 1);
    when "0011" => ALUOut <= std_logic_vector(unsigned(A) - 1);
    when "0100" => ALUOut <= std_logic_vector(0 - unsigned(A));
    when "0101" => 
        if A > B then 
            ALUOut <= "0001"; 
        else 
            ALUOut <= "0000"; 
        end if;
    when "0110" => ALUOut <= std_logic_vector(unsigned(A(2 downto 0)) & '0');
    when "0111" => ALUOut <= std_logic_vector('0' & unsigned(A(3 downto 1)));
    when "1000" => ALUOut <= std_logic_vector(A(3) & unsigned(A(3 downto 1)));
    when "1001" => ALUOut <= std_logic_vector(not (unsigned(A)));
    when "1010" => ALUOut <= std_logic_vector(unsigned(A) and unsigned(B));
    when "1011" => ALUOut <= std_logic_vector(unsigned(A) or unsigned(B));
    when "1100" => ALUOut <= std_logic_vector(unsigned(A) xor unsigned(B));
    when "1101" => ALUOut <= std_logic_vector(unsigned(A) xnor unsigned(B));
    when "1110" => ALUOut <= std_logic_vector(unsigned(A) nand unsigned(B));
    when "1111" => ALUOut <= std_logic_vector(unsigned(A) nor unsigned(B));
end case;            
end process;

end Behavioral;
