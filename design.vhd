library ieee;
use ieee.std_logic_1164.all;

entity top is
    port (
        clk : in std_logic;
        bcd : in std_logic_vector(3 downto 0);
        seg : out std_logic_vector(6 downto 0);
        sel : out std_logic_vector(3 downto 0)
    );
end entity;

architecture structural of top is
    component bcd_to_7seg
        port (bcd : in std_logic_vector(3 downto 0);
              seg : out std_logic_vector(6 downto 0));
    end component;

    component display_selector
        port (clk : in std_logic;
              sel : out std_logic_vector(3 downto 0));
    end component;
begin
    decodificador: bcd_to_7seg port map(bcd => bcd, seg => seg);
    seletor: display_selector port map(clk => clk, sel => sel);
end architecture;
