# Set clock period to 10ns (100MHz)
create_clock -name clk -period 10 [get_ports clk]

# Input/output delay for primary inputs/outputs
set_input_delay 2 [get_ports mc]
set_input_delay 2 [get_ports mp]
set_output_delay 2 [get_ports prod]

# Set drive strength and load (optional, example values)
set_drive 4 [get_ports mc]
set_load 10 [get_ports prod]
