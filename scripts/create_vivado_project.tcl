# In Vivado Tcl Console, cd to this extracted folder, then:
# set FPGA_PART <exact Artix-7 part for your board>
# source scripts/create_vivado_project.tcl
if {![info exists FPGA_PART]} {
 set FPGA_PART "xc7a35tcpg236-1"
 puts "WARNING: example part selected; confirm/change for your board."
}
set project_name "Low_Power_CSLA"
set project_dir [file normalize [file join [pwd] $project_name]]
create_project $project_name $project_dir -part $FPGA_PART -force
set_property target_language Verilog [current_project]
set src [file normalize [file join [pwd] "Low Power CSLA.srcs"]]
add_files -norecurse [list \
 [file join $src sources_1 new ripple_carry_adder.v] \
 [file join $src sources_1 new bec_incrementer.v] \
 [file join $src sources_1 new low_power_csla16.v] \
 [file join $src sources_1 new conventional_rca16.v] \
 [file join $src sources_1 new csla_demo_top.v]]
add_files -fileset sim_1 -norecurse [file join $src sim_1 new low_power_csla16_tb.v]
set_property top csla_demo_top [current_fileset]
set_property top low_power_csla16_tb [get_filesets sim_1]
add_files -fileset constrs_1 -norecurse [file normalize [file join [pwd] constraints artix7_switch_led_template.xdc]]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
puts "Created $project_dir. Edit XDC placeholders before implementation."
