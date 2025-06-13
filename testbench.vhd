library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_top is
end tb_top;

architecture Behavioral of tb_top is
    signal clk : std_logic := '0';
    signal bcd : std_logic_vector(3 downto 0) := (others => '0');
    signal seg : std_logic_vector(6 downto 0);
    signal sel_in  : std_logic_vector(1 downto 0) := "00";
    signal sel_out : std_logic_vector(3 downto 0);

begin
    DUT: entity work.top
        port map (
            clk => clk,
            bcd => bcd,
            seg => seg,
            sel_in => sel_in,
            sel_out => sel_out
        );

    display_sel_tb: entity work.display_selector
        port map (
            clk      => clk,
            sel_in   => sel_in,
            sel_out  => sel_out
        );

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
        wait for 62.5 ns;
        sel_in <= "00"; -- Display 0
        bcd <= "0000"; -- 0
        wait for 62.5 ns;

        bcd <= "0001"; -- 1
        wait for 62.5 ns;

        bcd <= "0010"; -- 2
        sel_in <= "01"; -- Display 1
        wait for 62.5 ns;

        bcd <= "0011"; -- 3
        wait for 62.5 ns;

        bcd <= "0100"; -- 4
        sel_in <= "10"; -- Display 2
        wait for 62.5 ns;

        bcd <= "0101"; -- 5
        wait for 62.5 ns;

        bcd <= "0110"; -- 6
        sel_in <= "11"; -- Display 3
        wait for 62.5 ns;

        bcd <= "0111"; -- 7
        wait for 62.5 ns;

        bcd <= "1000"; -- 8
        wait for 62.5 ns;

        bcd <= "1001"; -- 9
        wait for 62.5 ns;

        wait;
    end process;
end Behavioral;
