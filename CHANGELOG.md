# Changelog

Every change to the checklist is recorded here with the reason for it.

## 2026-11-19 — Start code made reproducible for any sender

- Added `start-code.gcode`: the tested clean-start sequence. Step 13 says to paste it in exactly, changing only the two temperature placeholders.
- Steps 14–20 now describe the start code precisely (temperatures, positions, heights, amounts), so it can be rebuilt if the file is unavailable.
- New step 29: open the sliced file and verify the start before sending.
- New step 6: never re-print a stored file unless it was prepared with this checklist.
- Rules section: plate coordinates, the bed-measuring command, and where the start code lives.
- Reason: plain-English steps alone let different agents build different start sequences; the printer's firmware cannot hold the routine (community firmware does not support this printer version yet).

## 2026-11-19 — First published version

- Three golden rules: every step every print, nothing assumed or carried over, strictly in order.
- 57 numbered steps in eight stages, each labelled [SENDER], [AT PRINTER] or [BOTH].
- Clean start of print (steps 12–18): bed measured with the nozzle at or below 140 °C, filament pulled back before heating, heating while raised, angled approach, purge and wipe. Reason: ooze being pressed onto the nozzle during leveling and at the purge spot ruined the first layers of earlier prints.
- Nozzle cleaning at a material-specific cleaning temperature instead of printing temperature. Reason: a nozzle at printing temperature keeps oozing, so it cannot be cleaned.
- Dryness checked on the purge line; Moisture Table added with damp-filament adjustments.
- Material Table with nozzle, first-layer, cleaning and bed temperatures.
