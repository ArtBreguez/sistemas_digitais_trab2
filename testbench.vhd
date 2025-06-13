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

    signal idx : integer := 0; 

    type bcd_array is array (0 to 9) of std_logic_vector(3 downto 0);
    constant bcd_values : bcd_array := (
        "0000", -- 0
        "0001", -- 1
        "0010", -- 2
        "0011", -- 3
        "0100", -- 4
        "0101", -- 5
        "0110", -- 6
        "0111", -- 7
        "1000", -- 8
        "1001"  -- 9
    );

    type sel_array is array (0 to 9) of std_logic_vector(1 downto 0);
    constant sel_values : sel_array := (
        "00", -- 0
        "01", -- 1
        "10", -- 2
        "11", -- 3
        "00", -- 0
        "01", -- 1
        "10", -- 2
        "11", -- 3
        "00", -- 0
        "01"  -- 1
    );

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

    stimulus_process: process(clk)
    begin
        if rising_edge(clk) then
            if idx <= 9 then
                sel_in <= sel_values(idx); -- Atualiza o display na subida
            end if;
        elsif falling_edge(clk) then
            if idx <= 9 then
                bcd <= bcd_values(idx);    -- Atualiza o BCD na descida
                idx <= idx + 1;          
            end if;
        end if;
    end process;

end Behavioral;
