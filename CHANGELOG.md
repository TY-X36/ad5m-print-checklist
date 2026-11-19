# Changelog

Every change to the checklist is recorded here with the reason for it.

## 2026-11-19 — Start code would not slice in OrcaSlicer

- Removed square brackets from the comments in `start-code.gcode`; the commands are unchanged.
- Reason: OrcaSlicer treats any square-bracketed text, even in comments, as a placeholder and refused to slice the file as published.

## 2026-11-19 — Moisture Table covers every storage time

- Added rows: PLA and Silk PLA left out less than 1 week, and PETG left out up to 3 days: print normally.
- Reason: a spool left out for two days matched no row in the table.

## 2026-11-19 — Keep test results until they are read

- New step 56: picture of the finished print before anything leaves the plate; test parts are kept until their result is written into the checklist. Step 61 asks for a photo of every test print.
- Reason: the third flow test's tiles were lost before the result was read.

## 2026-11-19 — Cameras and print recording

- Rules section: two phones now watch the printer, and a recorder on the home network records them only while a print runs (kept 24 hours; recordings marked failed are kept until deleted). Its page shows both cameras live and has buttons to start and stop recording, switch the phone lights and refocus.
- New step 46: start the recording before sending, with the estimated print time (it stops by itself one hour after the estimate as a safety net).
- New step 55: stop the recording as soon as the print ends, marked finished OK, failed or cancelled. Step 52 (stopping a bad first layer) now points to it.
- Step 53: the sender checks the camera pictures as well as the printer status, and may switch the phone lights on or refocus to see better; the best settings are still being tested.
- Steps from the old 46 onward are renumbered (+1, and +2 from the old 54); the purge-line dryness check is now step 49.
- Reason: when a print fails, there should be a video of how it failed, without recording an idle printer.

## 2026-11-19 — Open issues list

- Added OPEN-ISSUES.md and a rule to read it before step 1. Reason: problems seen during a print must not be forgotten before they are fixed.
- Confirmed on the third run: measuring the bed at 140 °C at the start of the print gave a flat, even first layer (the earlier see-through skirt is fixed).

## 2026-11-19 — Wipe over the purge line, not onto bare plate

- `start-code.gcode` and step 20: after the purge lines, wipe backwards over the purge line (X 55 to 35), then lift 2 mm (was: wipe onward to X 75 onto bare plate, lift 1 mm).
- Reason: a small curl of filament between the purge line and the print got onto the outside of the nozzle. Not yet proven by a print; to be confirmed on the next run.

## 2026-11-19 — Lessons from the third checklist run

- Nozzle cleaning: a thickly folded paper towel is allowed when there is no brass brush. Reason: no brush was available.
- PLA and Silk PLA cleaning temperature lowered from 170 °C to 160 °C. Reason: a string formed at 170 °C.
- The sender must read step numbers and wording from the current checklist. Reason: steps were mislabelled from memory.
- Material Table shows first-layer and later-layer bed temperatures. Reason: the bed drops after the first layer and that looked like an error.

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
