library ieee;
use ieee.std_logic_1164.all;

entity display_selector is
    port (
        clk      : in std_logic;
        sel_in   : in std_logic_vector(1 downto 0);
        sel_out  : out std_logic_vector(3 downto 0)
    );
end entity;

architecture behavioral of display_selector is
begin
    process(clk)
    begin
        if falling_edge(clk) then
            case sel_in is
                when "00" => sel_out <= "1110"; -- ativa display 0
                when "01" => sel_out <= "1101"; -- ativa display 1
                when "10" => sel_out <= "1011"; -- ativa display 2
                when "11" => sel_out <= "0111"; -- ativa display 3
                when others => sel_out <= "0000"; -- tudo apagado
            end case;
        end if;
    end process;
end architecture;
