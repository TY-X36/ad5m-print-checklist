# Print Checklist — Flashforge Adventurer 5M

Everyone who prints on this printer follows this list, every time: people, AI assistants, any computer, any slicer.

This file is only for printing. How the checklist is tested, changed and improved is in IMPROVING.md.

## The golden rules

1. **Every step, every print.** This is a pre-flight checklist. Every single step below must be done again for every single print, even if the print before it was five minutes ago.
2. **Nothing is assumed or carried over.** Answers, checks and confirmations from a previous print, an earlier conversation, a note, a memory or "what you were told last time" do not count. If a step asks a question, ask it again now. If a step asks for a check, check it again now.
3. **Strictly in order.** Do the steps top to bottom. Never do a later step before an earlier one is finished, even if it seems harmless or faster. Example: never open the slicer before the filament is confirmed, because the filament decides the settings.
4. **No defect is cosmetic.** Every blob, string, hook, gap, lifted corner or rough surface that anyone sees is written down in OPEN-ISSUES.md, with what it looked like and the settings in use. Small defects are early warnings of bigger failures.
5. **Stop after any failure.** If a print fails or shows a new defect, the next print may only be one that helps find the cause. Normal printing resumes only when the root cause is found and this checklist has been changed to prevent it, following IMPROVING.md. Writing the problem down is not the same as fixing it.

Before step 1, read OPEN-ISSUES.md and the last few rows of PRINT-LOG.md in this repository, so you know what is still being worked on and how recent prints went.

If you find you did a step out of order, or relied on an old answer, go back to that step, redo it and everything after it, and discard anything prepared in between.

---

Each step says who does it:

- **[SENDER]** — whoever prepares the file and sends it to the printer. This may be an AI assistant or a person at a computer.
- **[AT PRINTER]** — the person physically standing next to the printer. Only they can check anything you need eyes or hands for.
- **[BOTH]** — both must do it or agree on it.

The sender runs the checklist. When a step is for the person at the printer, the sender asks about that one step only, waits for the answer, then moves to the next step. Never hand the person several steps at once. Always read the step number and wording from the current version of this checklist; never number or paraphrase steps from memory.

Before asking the person anything that a camera can show (where a print failed, whether the first layer is stuck, what the plate looks like), the sender looks at the camera pictures or recording first, and asks only what the cameras cannot answer.

Every question to the person at the printer must have a clear yes/no or pick-one answer that can be seen or checked on the spot. Never ask for a judgement call such as "does it feel dry?".

Do not move to the next step until the current one is done. If a step cannot be done, stop and fix it or ask the owner first.

---

## Rules to know before starting

- This is a Flashforge Adventurer 5M: one 0.4 mm nozzle, 220 × 220 × 220 mm build area, no built-in camera, no automatic colour changer.
- Two phones watch the printer: phone 1 at the front and phone 2 at the side. A recorder on the home network records them, but only while a print is running. Its page is http://192.168.68.10:8790 on the home network: it shows both cameras live, has buttons to start and stop recording and to switch each phone's light on or off or refocus it, and lists past recordings. When a recording starts, the recorder switches both phone lights on and keeps them on until the recording stops (it switches a light back on if it goes off, for example after a phone app restart); a light someone switches off on purpose during a print stays off for that print. When the recording stops, both lights go off. The same live view is on the Home Assistant dashboard, in the "3D Printer" tab. Recordings are kept for 24 hours; a recording marked "failed" is kept until someone deletes it.
- It measures the bed by pressing the nozzle itself onto the plate, so anything stuck to the nozzle ruins the measurement and the first layer.
- A hot nozzle leaks plastic ("ooze"). Ooze on the nozzle during homing or bed measuring is the number one cause of failed prints on this printer.
- The nozzle must never be above 140 °C while the printer homes or measures the bed.
- The plate's coordinates run from -110 to +110 in both directions, with 0,0 at the centre. The front edge is Y = -110.
- This printer measures the bed with the command `BED_MESH_CALIBRATE`, which can be run from inside a print file.
- The tested start code lives next to this checklist, in the file `start-code.gcode` in this repository.

---

## Stage 1 — Choosing what to print

1. **[SENDER]** Confirm the model fits inside 220 × 220 × 220 mm at the intended size.
2. **[SENDER]** Read the designer's notes for required settings, minimum size, supports, brim and plate type.
3. **[SENDER]** Do not scale a model below the designer's minimum size, especially one with moving joints.
4. **[SENDER]** If the model is multi-colour, agree with the person at the printer whether to print it in one colour or do manual colour swaps.
5. **[SENDER]** Never use a file already sliced for a different printer, even if it says "ready to print"; get the original model file instead.
6. **[SENDER]** Never re-print a file already stored on the printer, from the screen or over the network, unless it was prepared with this checklist. If in doubt, slice it again.

## Stage 2 — Agreeing on the filament

7. **[SENDER]** Ask the person at the printer exactly which filament is loaded: material, brand and colour. Ask fresh for every print; never assume it is the same as last time. Do not open the slicer until this is answered.
8. **[AT PRINTER]** Report the loaded filament, and whether there is clearly enough left on the spool for the job.
9. **[AT PRINTER]** Report how this spool has been stored since it was last used, and for how long: sealed in a bag with a desiccant pack, or left out in the open. Use the Moisture Table at the bottom of this list to decide whether it can be printed as-is, printed with damp-filament adjustments, or must be dried first. The definite dryness test comes later, when the purge line prints (step 50).
10. **[BOTH]** Agree on the material and colour before any settings are chosen.

## Stage 3 — Preparing the file

11. **[SENDER]** Slice the model yourself, specifically for the Flashforge Adventurer 5M with a 0.4 mm nozzle.
12. **[SENDER]** Use the temperatures in the Material Table at the bottom of this list, not the slicer's defaults; choose the lowest temperature that still prints well. If step 9 placed the spool in the "lightly damp" row of the Moisture Table, also apply the damp-filament adjustments listed there.
13. **[SENDER]** Delete the slicer's own default start code for this printer completely, then paste in `start-code.gcode` from this repository exactly as written. Only replace the two temperature placeholders with your slicer's names for the first-layer bed temperature and first-layer nozzle temperature. Do not change anything else. If the file is unavailable, write a start code that does steps 14 to 20 exactly.
14. **[SENDER]** The start code keeps the nozzle at or below 140 °C while the bed heats to printing temperature, while the printer homes, and while it measures the bed.
15. **[SENDER]** The start code measures the bed every print with a quick 3 × 3 measurement (`BED_MESH_CALIBRATE PROBE_COUNT=3,3`, about half a minute), after homing, with the nozzle at 140 °C. The printer's built-in "level before print" must not be used, because it heats the nozzle to full temperature first. Without a bed measurement the first layer comes out uneven.
16. **[SENDER]** After measuring, the start code raises the nozzle to 10 mm and parks it next to the purge line, at X = 110, Y = -100 (not directly above the line).
17. **[SENDER]** Before heating to printing temperature, the start code pulls the filament back 1.5 mm, then heats the nozzle while it is still raised.
18. **[SENDER]** The start code never lowers the nozzle straight down where it was heated. It comes down at an angle to the start of the purge line (X = 95, Y = -110, height 0.3 mm), so any drip is left on the plate instead of being pushed onto the nozzle, then pushes the filament forward the same 1.5 mm.
19. **[SENDER]** The start code draws two purge lines along the front edge (Y = -110 and Y = -109.6, from X = 95 to X = -55, then back to X = 55), long enough that plastic flows smoothly and in the correct colour.
20. **[SENDER]** Right after the purge lines, the start code pulls the filament back 0.8 mm, wipes quickly backwards over the purge line it just drew (20 mm, from X = 55 to X = 35) so any ooze string sticks to that plastic, then lifts 2 mm before travelling to the print. It must never wipe onward onto bare plate.
21. **[SENDER]** Add a skirt of at least three loops, a few millimetres from the model, so the nozzle is flowing cleanly before it reaches the model.
22. **[SENDER]** Print the first layer slowly, about 30 mm per second.
23. **[SENDER]** Cap travel moves at about 250 mm per second, so small parts do not get knocked loose.
24. **[SENDER]** When the plate holds small parts (any footprint under about 30 × 30 mm) or a calibration test, slow the outer walls and top surfaces to about 100 mm per second. A fast nozzle pushes sideways on every small part it passes over.
25. **[SENDER]** Place the seam at the back of the model.
26. **[SENDER]** Place the model flat side down, near the centre of the plate.
27. **[SENDER]** Check every part touching the plate. Any part whose footprint is smaller than about 30 × 30 mm, or that is taller than it is wide, gets a brim about 4 mm wide. If the designer says no brim (for example a print-in-place model whose joints a brim would fuse), use small discs ("mouse ears") under the corners instead. Large parts with a big flat base need neither.
28. **[SENDER]** Add supports only where the model truly needs them.
29. **[SENDER]** Step through the slicer's layer preview from the first layer up, looking for gaps, floating parts or anything strange.
30. **[SENDER]** Open the sliced file as text and check it before sending. The start: the first nozzle temperature command is 140 °C; `BED_MESH_CALIBRATE` appears after homing; nothing heats the nozzle above 140 °C before the bed has been measured; the wipe back over the purge line is present. The settings, each against the Material Table and the steps above: nozzle and first-layer temperatures, bed temperature (the same for the first layer and the rest), pressure advance, brim where step 27 needs one, first-layer, wall, top-surface and travel speeds, skirt and seam. The file must also contain a preview picture (thumbnail, 140 × 110) so the printer's screen shows what is printing; if it has none, add one before sending. Do not trust the slicer's settings screen; check the file itself. If any check fails, fix the slicer settings and slice again.
31. **[SENDER]** Note the estimated print time and filament weight, and tell the person at the printer.

## Stage 4 — Preparing the printer

32. **[SENDER]** Make sure this print will start with "level before print" turned off. When sending over the network, use the send option that turns leveling off for this print. If the print will be started from the printer's own screen, tell the person at the printer to untick leveling before pressing start.
33. **[AT PRINTER]** Remove everything from the plate: old prints, purge lines and stray strings.
34. **[AT PRINTER]** Wash the plate with warm water and dish soap, rinse it and dry it fully.
35. **[AT PRINTER]** Put the plate back flat on the bed, lined up with its alignment pins, without touching the printing surface.
36. **[AT PRINTER]** For PETG only, apply a thin even layer of glue stick everywhere the print and the purge line will touch the plate. A thin layer dries almost invisible on a textured plate, so a colour-changing glue stick (coloured when wet) helps confirm coverage.
37. **[AT PRINTER]** If the filament agreed in step 10 is not the one in the printer, load it now from the printer's menu. After any filament change, push plastic through until the new colour comes out clean.
38. **[AT PRINTER]** Check the spool turns freely, with no tangles, crossed loops or snags.
39. **[BOTH]** Set the nozzle to the cleaning temperature for this material (see the Material Table), never to printing temperature. At cleaning temperature old plastic is soft enough to brush off but does not ooze out. If the nozzle is already hotter (for example after purging a filament change), pull the filament back about 2 mm and let it cool to cleaning temperature first.
40. **[AT PRINTER]** At cleaning temperature, look at the tip with a torch and scrub it with a brass brush until no old plastic, burnt residue or blobs remain. If there is no brass brush, a thickly folded paper towel (folded about ten times) can be used with quick, light wipes; then check for paper fibres on the tip. Never wipe with paper at printing temperature.
41. **[AT PRINTER]** Pull off any string still hanging from the tip with tweezers, never fingers.
42. **[BOTH]** Switch the nozzle heater off, let it cool below 140 °C, and check the tip is still clean.
43. **[AT PRINTER]** Make sure no fan, open window or air conditioner is blowing on the printer, and nothing nearby can fall onto the bed. The printer's own fans running is normal: the hotend fan runs whenever the nozzle is warm.
44. **[AT PRINTER]** Tell the sender: "plate clear, nozzle clean, filament confirmed".

## Stage 5 — Sending the print

45. **[SENDER]** Do not send anything until you have received "plate clear, nozzle clean, filament confirmed" for this print.
46. **[SENDER]** Check the printer is idle and ready, with no other job running or paused.
47. **[SENDER]** Start the recording on the recorder, giving the model's name and the estimated print time from step 31. Check that it now says it is recording and that both camera pictures show the printer. As a safety net it stops by itself one hour after the estimated time, so use the real estimate. If the recorder cannot be reached, tell the person at the printer and agree whether to print without a recording.
48. **[SENDER]** Send the print and tell the person at the printer it is starting.

## Stage 6 — Watching the start

49. **[AT PRINTER]** While it heats and homes, check the nozzle stays at or below 140 °C while it homes and measures the bed, and only heats up once it is raised next to the purge area. If it heats to full temperature early, stop the print and tell the sender.
50. **[AT PRINTER]** Watch the purge line: it should be smooth, unbroken and the right colour. This is also the dryness check: if the plastic pops, crackles, steams or bubbles, stop the print and dry the spool before trying again.
51. **[AT PRINTER]** Watch the skirt and the entire first layer, about the first three to five minutes.
52. **[AT PRINTER]** A good first layer is flat, slightly squashed, with lines touching each other and stuck firmly to the plate.
53. **[AT PRINTER]** Stop the print immediately if anything lifts, curls, drags, gets knocked loose, piles up in a lump, or the nozzle picks up a blob, then tell the sender what you saw. The sender then goes straight to step 56 and stops the recording, marked failed.

## Stage 7 — During the print

54. **[SENDER]** For the whole print, keep the cameras watched continuously: an automatic watcher (for example a second, low-cost AI assistant) looks at a fresh camera picture about every 10 seconds and alerts the sender the moment anything looks wrong; the sender then looks for themselves. If no automatic watcher is available, the sender takes fresh pictures from both cameras at least every 5 minutes and actually looks at them, as well as checking the printer's status. Watching the printer's status alone does not count: it cannot see spaghetti, lifting parts or blobs. Both phone lights should be on for the whole print; if a light is off, switch it on. If a picture is still too dark or blurry to judge the print, refocus that phone or try its night mode; which light and focus settings work best is still being tested, so note what helped in the print record (step 63). Dark filament on a dark plate at night can look like an empty or finished plate to an automatic watcher, so give it a picture bright enough to tell the print from the plate (light or night mode). The watcher must answer each picture with one fixed verdict word (OK, PROBLEM, FINISHED or CAMERA) that a script can read; at least once early in the print, read its log and make sure every answer contains one. Alert the person at the printer if the print pauses, shows an error, the temperatures look wrong, or the pictures show anything lifting, stringing into a tangle or knocked loose.
55. **[AT PRINTER]** Check on the print every so often; someone must be reachable until it finishes.

## Stage 8 — After the print

56. **[SENDER]** As soon as the print finishes, is stopped or fails, stop the recording and mark it: finished OK, failed if anything went wrong, or cancelled if it was stopped for another reason. Never leave a recording running after the print. If a print marked OK turns out bad later, mark its recording failed within 24 hours so it is kept.
57. **[SENDER]** Before anything is taken off the plate, take a picture of the finished print from the cameras and keep it with the print record. If the print is a test or calibration whose result still has to be read, tell the person at the printer to keep every part, and not throw anything away, until the result has been read and written into this checklist.
58. **[AT PRINTER]** Let the plate cool for a few minutes, then flex it to release the print. Never use a scraper on the plate surface.
59. **[AT PRINTER]** Clear the purge line, skirt and leftover strings off the plate.
60. **[AT PRINTER]** Brush the nozzle once more while it is still warm.
61. **[AT PRINTER]** Put opened filament back in a sealed bag with a desiccant pack.
62. **[AT PRINTER]** Report how the print came out, with a photo of the parts if anything is wrong, and always for a test or calibration print.
63. **[SENDER]** Add a row to PRINT-LOG.md: date, what was printed, filament, what changed since the last print, the result, and where the photos and recording are.
64. **[BOTH]** If anything went wrong, add it to OPEN-ISSUES.md, then find the cause together and change this checklist as described in IMPROVING.md, so it never happens again.

---

## Material Table (starting values for this printer)

| Material | Nozzle | First layer nozzle | Cleaning temp | Bed (whole print) | Part cooling fan | Pressure advance | Notes |
|---|---|---|---|---|---|---|---|
| PLA (basic) | 205–210 °C | 215 °C | 160 °C (170 °C if residue will not soften) | 55 °C | Full | 0.04 (tested on PLA Basic, 2026-11-20) | Default choice; best for small or detailed parts. |
| Silk PLA | 210–215 °C | 220 °C | 160 °C (170 °C if residue will not soften) | 55 °C | Full | Not tested: run a pressure advance test first | Print slower; shiny but weaker; expect some stringing. |
| PETG | 235–240 °C | 240 °C | 190 °C | 75 °C | 30–50% | Not tested: run a pressure advance test first | Glue stick on the plate; strong and heat-resistant. |

Use the pressure advance value from this table for every print; without it, every line starts with a blob. A material with no tested value must have a pressure advance test before its first real print.

Keep the bed at the same temperature for the whole print. Do not let the slicer lower it after the first layer: parts lose grip exactly when they are tallest.

When a material is tested and better values are found, update this table.

---

## Moisture Table (how to treat a spool based on how it was stored)

| Material | How it was stored | What to do |
|---|---|---|
| Any | Sealed in a bag with desiccant | Print normally. |
| PLA or Silk PLA | Left out less than 1 week | Print normally. |
| PETG | Left out up to 3 days | Print normally. |
| PLA or Silk PLA | Left out 1 to 4 weeks | "Lightly damp": print with damp-filament adjustments (below). |
| PLA or Silk PLA | Left out more than 4 weeks | Dry before printing. |
| PETG | Left out more than 3 days | Dry before printing. |
| Any | Pops, crackles, steams or bubbles on the purge line (step 50) | Dry before printing, no matter how it was stored. |

**Damp-filament adjustments:** lower the nozzle temperature by about 5 °C, increase retraction by about 0.2 mm, and turn on "avoid crossing walls" (or the slicer's equivalent) so travel moves stay over the part. These reduce stringing and ooze but do not remove the moisture.

**How to dry a spool:** a filament dryer, a food dehydrator, or an oven that can hold a low temperature accurately: about 45–50 °C for PLA and Silk PLA, about 60–65 °C for PETG, for 4–6 hours. Afterwards, store it sealed with desiccant.

---

## Doing it on this printer (practical notes for a new sender)

- **Finding the printer:** it is on the home Wi-Fi and calls itself "AD5M - read checklist first" in network discovery. Its address can change; search for it rather than relying on an old address. Its serial number is shown in its discovery reply and on its screen.
- **Sending without the printer's own leveling:** OrcaSlicer's built-in "send to Flashforge" turned the printer's own leveling on in testing, which breaks step 14 (nozzle at or below 140 °C while the bed is measured). Send through the printer's network interface instead with "print now" on and "leveling before print" off, or, if starting from the printer's screen, untick leveling before pressing start.
- **Cameras:** two phones watch the printer, one at the front and one at the side. A recorder on the home network records them while a print runs and shows a live view; the person at the printer can tell a new sender where to find it.
- **OrcaSlicer quirk:** square brackets in start-code comments are read as placeholders and stop slicing.
- **OrcaSlicer from the command line:** it ignores the plate type and uses its first one (Cool Plate), which can set the wrong bed temperature; set the same bed temperature for every plate type in the filament settings. An exit with an error can still write a file, often because the skirt or brim runs off the 220 mm bed when many parts are arranged; check that nothing in the file goes past ±110 mm before sending.
- **Thumbnail:** OrcaSlicer's window adds a 140 × 110 preview picture to every file, but its command line does not (it cannot draw without a screen). For a file without one, add a block right after the file's header block, in this form: a line `; THUMBNAIL_BLOCK_START`, a line `; thumbnail begin 140x110 N` (N is the number of base64 characters), the base64 text of a 140 × 110 PNG picture of the plate split into lines that each start with `; `, then `; thumbnail end` and `; THUMBNAIL_BLOCK_END`.
- **Print time is set by how much plastic there is:** the hotend can melt only about 12–18 mm³ per second of PETG, so the printer's speed button cannot make a heavy part print much faster. To save time, use less plastic (thinner walls, less infill) or split the plate.
- **Moving filament:** never push or pull filament unless the nozzle is at printing temperature, and read the temperature first. Below about 170 °C the printer refuses and goes into an error state (seen as E0006).
- **After a print finishes:** the printer stays on its "print completed" screen and refuses a new job ("printer is busy") until that is cleared, either by pressing the button on its screen or, over the network, with the "clear platform" command of its control interface.
- **Homing:** homing lowers the bed away from the nozzle and does not touch the plate, so it is safe with a dirty nozzle. Moves are ignored until the printer has been homed (for example after loading filament).
- **Cleaning the nozzle without hands:** heat it, purge a small blob in a plate corner outside the print and outside the bed-measuring area, drag the nozzle through the blob so any string sticks to it, pull the filament back about 2 mm while still hot, lift, and let it cool. The blob must then be removed before the print.
- **Seeing clearly on camera:** when something cannot be seen clearly, the sender moves it towards the camera: move the head to the front and lower the bed for the nozzle, raise the bed for the plate. Do this only when no print is running, or during a paused print move the head sideways only (never the bed), then resume.
- In one session the sender tried to pull filament back while the nozzle had cooled to 48 °C, which put the printer into an error state; the filament agreed for a print was never formally loaded because no step said so; and glue stick coverage could not be confirmed on camera. Each now has a step or a practical note.
