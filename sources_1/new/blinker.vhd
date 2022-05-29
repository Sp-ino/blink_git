----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.05.2022 13:13:12
-- Design Name: 
-- Module Name: blinker - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;




entity blinker is
   port ( rst_b: in std_logic;
           ck_b: in std_logic;
           led_out_b: out std_logic);
end blinker;



architecture behavioral of blinker is

    signal count: std_logic_vector (31 downto 0);
    signal present_state, next_state: integer range 0 to 4;
    constant on_duration: integer := 20000000;
    constant off_duration: integer := 40000000;

begin

    compute_next_state: process (rst_b,
                                present_state,
                                count)
    begin
        if rst_b = '1' then
            next_state <= 0;
        else
            case present_state is
                when 0 =>
                    next_state <= 1;
                
                when 1 =>
                    next_state <= 2;
                
                when 2 =>
                    if count < on_duration then 
                        next_state <= 2;
                    else
                        next_state <= 3;
                    end if;
                
                when 3 =>
                    next_state <= 4;
                
                when 4 =>
                    if count < off_duration then
                        next_state <= 4;
                    else
                        next_state <= 1;
                    end if; 
            end case;
        end if;
    end process compute_next_state;


    state_reg: process (ck_b, rst_b)
    begin
        if rst_b = '1' then
            present_state <= 0;
        elsif rising_edge(ck_b) then
                present_state <= next_state;
        end if;
    end process state_reg;


    assign_values: process(ck_b, rst_b)
    begin
        if rst_b = '1' then
            led_out_b <= '0';
        elsif rising_edge(ck_b) then
            case present_state is
                when 0 =>
                    led_out_b <= '1';
                    count <= "00000000000000000000000000000000";
            
                when 1 =>
                    led_out_b <= '1';
                    count <= "00000000000000000000000000000000";
                
                when 2 =>
                    count <= std_logic_vector(unsigned(count) + 1);
                
                when 3 =>
                    led_out_b <= '0';
                    count <= "00000000000000000000000000000000";

                when 4 =>
                    count <= std_logic_vector(unsigned(count) + 1);
            end case;
        end if;
    end process assign_values;

end behavioral;
