library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity VGA_Driver is
    Port ( 
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        vga_r, vga_g, vga_b : out STD_LOGIC_VECTOR(7 downto 0);
        h_sync, v_sync, pixel_on : out STD_LOGIC
    );
end VGA_Driver;

architecture Behavioral of VGA_Driver is
    constant H_RES : integer := 640;  -- Horizontal resolution
    constant V_RES : integer := 480;  -- Vertical resolution

    signal h_counter : integer range 0 to H_RES - 1 := 0;
    signal v_counter : integer range 0 to V_RES - 1 := 0;

    signal h_sync_counter : integer := 0;
    signal v_sync_counter : integer := 0;

    signal active_pixel : boolean := false;

    constant H_SYNC_CYCLES : integer := 96;  -- Number of cycles for horizontal sync pulse
    constant H_BACK_PORCH : integer := 48;  -- Number of cycles for horizontal back porch
    constant H_FRONT_PORCH : integer := 16; -- Number of cycles for horizontal front porch

    constant V_SYNC_LINES : integer := 2;   -- Number of lines for vertical sync pulse
    constant V_BACK_PORCH : integer := 33;  -- Number of lines for vertical back porch
    constant V_FRONT_PORCH : integer := 10; -- Number of lines for vertical front porch

begin
    process(clk, rst)
    begin
        if rst = '1' then
            h_counter <= 0;
            v_counter <= 0;
            h_sync_counter <= 0;
            v_sync_counter <= 0;
            active_pixel <= false;
        elsif rising_edge(clk) then
            -- Horizontal counter
            if h_counter < H_RES - 1 then
                h_counter <= h_counter + 1;
            else
                h_counter <= 0;
                
                -- Vertical counter
                if v_counter < V_RES - 1 then
                    v_counter <= v_counter + 1;
                else
                    v_counter <= 0;
                end if;
            end if;

            -- Horizontal sync
            if h_sync_counter < H_SYNC_CYCLES then
                h_sync <= '1';
                h_sync_counter <= h_sync_counter + 1;
            else
                h_sync <= '0';
            end if;

            -- Vertical sync
            if v_sync_counter < V_SYNC_LINES then
                v_sync <= '1';
                v_sync_counter <= v_sync_counter + 1;
            else
                v_sync <= '0';
            end if;

            -- Pixel enable
            if h_counter >= H_FRONT_PORCH and h_counter < H_RES - H_BACK_PORCH and
               v_counter >= V_FRONT_PORCH and v_counter < V_RES - V_BACK_PORCH then
                pixel_on <= '1';
            else
                pixel_on <= '0';
            end if;

            -- Active pixel colors (replace with your logic)
            if active_pixel then
                vga_r <= (others => '1');  -- Red color
                vga_g <= (others => '0');  -- Green color
                vga_b <= (others => '0');  -- Blue color
            else
                vga_r <= (others => '0');
                vga_g <= (others => '0');
                vga_b <= (others => '0');
            end if;

            -- Toggle active pixel each clock cycle
            active_pixel <= not active_pixel;
        end if;
    end process;

end Behavioral;