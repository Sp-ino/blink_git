----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.05.2022 16:20:31
-- Design Name: 
-- Module Name: tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;




entity tb is
end tb;



architecture Behavioral of tb is

    component blinker is
        port ( rst_b: in std_logic;
            ck_b: in std_logic;
            led_out_b: out std_logic);
    end component;

    constant Tck: time := 10 ns;
    signal clock: std_logic;
    signal reset: std_logic;
    signal output: std_logic;

begin

    blinker_instance: blinker
    port map (
        rst_b => reset,      
        ck_b => clock,
        led_out_b => output
    );


    clk_gen: process
    begin
        clock <= '1';
        wait for Tck/2;
        clock <= '0';
        wait for Tck/2;
    end process clk_gen;


    tester: process
    begin
        wait for Tck;
        reset <= '1';
        wait for Tck/2;
        reset <= '0';

        wait for Tck*1000000000; 
        reset <= '1';    
    end process tester;

end Behavioral;
