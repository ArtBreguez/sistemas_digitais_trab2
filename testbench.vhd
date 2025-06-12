library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_top is
end tb_top;

architecture Behavioral of tb_top is
    signal clk : std_logic := '0';
    signal bcd : std_logic_vector(3 downto 0) := (others => '0');
    signal seg : std_logic_vector(6 downto 0);
    signal sel : std_logic_vector(3 downto 0);

begin
    DUT: entity work.top
        port map (
            clk => clk,
            bcd => bcd,
            seg => seg,
            sel => sel
        );

    -- Geração do clock de 8 MHz
    clock_process: process
    begin
        while true loop
            clk <= '0';
            wait for 62.5 ns;
            clk <= '1';
            wait for 62.5 ns;
        end loop;
    end process;

    test_process: process
    begin
        bcd <= "0000"; -- 0
        wait for 50 ns;

        bcd <= "0001"; -- 1
        wait for 50 ns;

        bcd <= "0010"; -- 2
        wait for 50 ns;

        bcd <= "0011"; -- 3
        wait for 50 ns;

        bcd <= "0100"; -- 4
        wait for 50 ns;

        bcd <= "0101"; -- 5
        wait for 50 ns;

        bcd <= "0110"; -- 6
        wait for 50 ns;

        bcd <= "0111"; -- 7
        wait for 50 ns;

        bcd <= "1000"; -- 8
        wait for 50 ns;

        bcd <= "1001"; -- 9
        wait for 50 ns;

        wait;
    end process;

end Behavioral;
