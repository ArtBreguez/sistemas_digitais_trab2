library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display_selector is
    port (
        clk : in std_logic;
        sel : out std_logic_vector(3 downto 0)
    );
end entity;

architecture behavioral of display_selector is
    signal clk_div : unsigned(12 downto 0) := (others => '0'); -- 1kHz
    signal current_display : unsigned(1 downto 0) := "00";
begin
    process(clk)
    begin
        if rising_edge(clk) then
            clk_div <= clk_div + 1;
            if clk_div = 0 then
                current_display <= current_display + 1;
            end if;
        end if;
    end process;

    process(current_display)
    begin
        case current_display is
            when "00" => sel <= "1110"; -- display 0 ativo
            when "01" => sel <= "1101"; -- display 1 ativo
            when "10" => sel <= "1011"; -- display 2 ativo
            when "11" => sel <= "0111"; -- display 3 ativo
            when others => sel <= "1111";
        end case;
    end process;
end architecture;
