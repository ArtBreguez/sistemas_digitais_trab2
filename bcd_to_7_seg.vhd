library ieee;
use ieee.std_logic_1164.all;

entity bcd_to_7seg is
    port (
        clk : in std_logic;
        bcd : in std_logic_vector(3 downto 0);
        seg : out std_logic_vector(6 downto 0) -- A-G
    );
end entity;

architecture behavioral of bcd_to_7seg is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            case bcd is
                when "0000" => seg <= "1111110"; -- 0
                when "0001" => seg <= "0110000"; -- 1
                when "0010" => seg <= "1101101"; -- 2
                when "0011" => seg <= "1111001"; -- 3
                when "0100" => seg <= "0110011"; -- 4
                when "0101" => seg <= "1011011"; -- 5
                when "0110" => seg <= "1011111"; -- 6
                when "0111" => seg <= "1110000"; -- 7
                when "1000" => seg <= "1111111"; -- 8
                when "1001" => seg <= "1111011"; -- 9
                when others => seg <= "0000000"; -- tudo apagado
            end case;
        end if;
    end process;
end architecture;
