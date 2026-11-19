; Clean start for the Flashforge Adventurer 5M (stock firmware)
; Tested 2026-11-19. Use exactly as written.
; Only replace the two placeholders in [square brackets] with your slicer's names for:
;   [bed_temperature_initial_layer_single] = bed temperature for the first layer
;   [nozzle_temperature_initial_layer]     = nozzle temperature for the first layer
; Delete your slicer's default start code before pasting this in.
; Coordinates: X and Y run from -110 to +110, 0,0 is the centre, Y = -110 is the front edge.
M104 S140 ; nozzle warm but below ooze temperature
M190 S[bed_temperature_initial_layer_single] ; heat bed fully first
M109 S140 ; hold nozzle at 140 for homing and bed measuring
G90 ; absolute positions
M83 ; relative extrusion
G28 ; home, nozzle at 140
BED_MESH_CALIBRATE ; measure the bed every print, nozzle clean and at 140
G1 Z10 F3000 ; raise well clear of the plate
G1 X110 Y-100 F6000 ; park next to (not over) the purge line
G1 E-1.5 F1800 ; pull filament back before heating so it does not drip
M109 S[nozzle_temperature_initial_layer] ; heat to print temperature while raised
G1 X95 Y-110 Z0.3 F3000 ; come down at an angle, away from any drip
G1 E1.5 F1200 ; push filament back the same amount
G1 X55 E6 F1200 ; slow prime into the purge line
G1 X-55 E10 F2400 ; purge line
G1 Y-109.6 F2400
G1 X55 E6 F2400 ; second purge line
G1 E-0.8 F2100 ; retract
G1 X75 F12000 ; fast sideways wipe snaps off any string
G1 Z1 F3000
G92 E0
