# Set library search path
set_db init_lib_search_path /home/install/FOUNDRY/digital/90nm/dig/lib/
set_db library slow.lib

# Set HDL search path (directory, not file)
set_db init_hdl_search_path {./booths_multiplier.v}

# Read RTL files
read_hdl booths_multiplier.v

# If the top module name inside the file is different, change it here
elaborate booths_multiplier

# Read timing constraints
read_sdc input_constraints.sdc

# Run synthesis
syn_generic
syn_map
syn_opt

# Write output netlist/SDF/SDC
write_hdl > outputs/booths_multiplier_netlist.v
write_sdf > outputs/booths_multiplier.sdf
write_sdc > outputs/booths_multiplier_syn.sdc

# Reports
report_area   > reports/area.rpt
report_timing > reports/timing.rpt
report_power  > reports/power.rpt

# Optional GUI
gui_show
