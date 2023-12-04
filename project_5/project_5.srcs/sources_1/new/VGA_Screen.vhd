library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;






entity VGA_Screen is
    port (
        clk : in std_logic;
        reaction_time : in std_logic_vector(15 downto 0);
        vga_output : out std_logic_vector(3 downto 0);
        h_sync, v_sync : out std_logic
    );
end entity VGA_Screen;

architecture Behavioral of VGA_Screen is
    signal vga_r, vga_g, vga_b : std_logic_vector(7 downto 0);
    signal pixel_on : std_logic;

    signal message : string(1 to 13);
    signal message_color : std_logic_vector(2 downto 0);

    constant GOOD_REFLEXES : string := "Well Done";
    constant AVERAGE_REFLEXES : string := "Not Bad";
    constant BAD_REFLEXES : string := "Bad Reflexes";

begin
    -- VGA driver instantiation (replace "work" with your library name)
    vga_driver_inst : entity work.VGA_Driver
        port map (
            clk => clk,
            rst => '0',  -- VGA driver may have a reset input
            vga_r => vga_r,
            vga_g => vga_g,
            vga_b => vga_b,
            h_sync => h_sync,
            v_sync => v_sync,
            pixel_on => pixel_on
        );

    -- Message determination
    process(reaction_time)
    begin
        if reaction_time(15) = '0' and reaction_time(14 downto 12) = "000" then
            message <= GOOD_REFLEXES;
            message_color <= "111";  -- White color
        elsif reaction_time(15 downto 14) = "01" or (reaction_time(15) = '0' and reaction_time(14 downto 12) /= "000") then
            message <= AVERAGE_REFLEXES;
            message_color <= "110";  -- Yellow color
        else
            message <= BAD_REFLEXES;
            message_color <= "100";  -- Red color
        end if;
    end process;

    -- Display message on VGA
    process(clk)
    begin
        if rising_edge(clk) then
            if pixel_on = '1' then
                case message_color is
                    when "111" =>
                        vga_output <= "1111";  -- White color
                    when "110" =>
                        vga_output <= "0011";  -- Yellow color
                    when others =>
                        vga_output <= "1000";  -- Red color
                end case;
            else
                vga_output <= "0000";  -- Black color
            end if;
        end if;
    end process;

end Behavioral;