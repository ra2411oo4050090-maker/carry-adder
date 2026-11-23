## TEMPLATE ONLY: replace placeholders using your exact board's official master XDC.
## Demo ports: sw[15:0], led[8:0]. No clock is required (combinational design).
# set_property -dict { PACKAGE_PIN <SW0_PIN> IOSTANDARD LVCMOS33 } [get_ports {sw[0]}]
# Repeat for sw[1] through sw[15].
# set_property -dict { PACKAGE_PIN <LED0_PIN> IOSTANDARD LVCMOS33 } [get_ports {led[0]}]
# Repeat for led[1] through led[8].
