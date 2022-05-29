create_clock -add -name sys_clk_pin -period 10.00 [get_ports ck_b]

set_property PACKAGE_PIN W5 [get_ports ck_b]
set_property IOSTANDARD LVCMOS33 [get_ports ck_b] 

set_property PACKAGE_PIN W19 [get_ports rst_b] 
set_property IOSTANDARD LVCMOS33 [get_ports rst_b] 

set_property PACKAGE_PIN U16 [get_ports led_out_b] 
set_property IOSTANDARD LVCMOS33 [get_ports led_out_b] 

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]