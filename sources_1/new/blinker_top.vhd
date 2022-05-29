----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.05.2022 16:40:25
-- Design Name: 
-- Module Name: blinker_top - Behavioral
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

entity blinker_top is
    port ( ck : in STD_LOGIC;
           rst : in STD_LOGIC;
           led_out : out STD_LOGIC;
           ck_out_test : out std_logic);
end blinker_top;



architecture Behavioral of blinker_top is

    component blinker is
    port 
    ( rst_b: in std_logic;
       ck_b: in std_logic;
       led_out_b: out std_logic
    );
    end component;
    
    component ck_wiz_0 is
    port
    (-- Clock in ports
      -- Clock out ports
      clk_out1          : out    std_logic;
      -- Status and control signals
      reset             : in     std_logic;
      locked            : out    std_logic;
      clk_in1           : in     std_logic
    );
    end component;
    
    signal locked: std_logic;
    signal ck_out: std_logic;

begin

    ck_wiz_instance: ck_wiz_0
    port map ( 
    -- Clock out ports  
    clk_out1 => ck_out,
    -- Status and control signals                
    reset => rst,
    locked => locked,
    -- Clock in ports
    clk_in1 => ck
    );
     
     
     blinker_instance: blinker
     port map (
     rst_b => rst,
     ck_b => ck_out,
     led_out_b => led_out
     );
     
     
     ck_out_test <= ck_out;
    
end Behavioral;
