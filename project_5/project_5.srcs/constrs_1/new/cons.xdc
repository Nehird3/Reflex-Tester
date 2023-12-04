set_property PACKAGE_PIN W5 [get_ports clk]
		set_property IOSTANDARD LVCMOS33 [get_ports clk]
		create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]

# Switches
set_property PACKAGE_PIN T18 [get_ports BTN0]
set_property IOSTANDARD LVCMOS33 [get_ports BTN0]



# LEDs
set_property PACKAGE_PIN V13 [get_ports LD0]
set_property IOSTANDARD LVCMOS33 [get_ports LD0]

 #7 segment display
    set_property PACKAGE_PIN W7 [get_ports {Ca[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Ca[0]}]
    set_property PACKAGE_PIN W6 [get_ports {Ca[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Ca[1]}]
    set_property PACKAGE_PIN U8 [get_ports {Ca[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Ca[2]}]
    set_property PACKAGE_PIN V8 [get_ports {Ca[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Ca[3]}]
    set_property PACKAGE_PIN U5 [get_ports {Ca[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Ca[4]}]
    set_property PACKAGE_PIN V5 [get_ports {Ca[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Ca[5]}]
    set_property PACKAGE_PIN U7 [get_ports {Ca[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Ca[6]}]
   
   
set_property PACKAGE_PIN V7 [get_ports Ca[7]]
set_property IOSTANDARD LVCMOS33 [get_ports Ca[7]]
  
   set_property PACKAGE_PIN U2 [get_ports {An[0]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {An[0]}]
   set_property PACKAGE_PIN U4 [get_ports {An[1]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {An[1]}]
   set_property PACKAGE_PIN V4 [get_ports {An[2]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {An[2]}]
   set_property PACKAGE_PIN W4 [get_ports {An[3]}]
   set_property IOSTANDARD LVCMOS33 [get_ports {An[3]}]
  

# Others (BITSTREAM, CONFIG)
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]