# Print Checklist — Flashforge Adventurer 5M

Everyone who prints on this printer follows this list, every time: people, AI assistants, any computer, any slicer.

## The three golden rules

1. **Every step, every print.** This is a pre-flight checklist. Every single step below must be done again for every single print, even if the print before it was five minutes ago.
2. **Nothing is assumed or carried over.** Answers, checks and confirmations from a previous print, an earlier conversation, a note, a memory or "what you were told last time" do not count. If a step asks a question, ask it again now. If a step asks for a check, check it again now.
3. **Strictly in order.** Do the steps top to bottom. Never do a later step before an earlier one is finished, even if it seems harmless or faster. Example: never open the slicer before the filament is confirmed, because the filament decides the settings.

Before step 1, read OPEN-ISSUES.md in this repository, so you know what is still being worked on and what to watch for.

If you find you did a step out of order, or relied on an old answer, go back to that step, redo it and everything after it, and discard anything prepared in between.

---

Each step says who does it:

- **[SENDER]** — whoever prepares the file and sends it to the printer. This may be an AI assistant or a person at a computer.
- **[AT PRINTER]** — the person physically standing next to the printer. Only they can check anything you need eyes or hands for.
- **[BOTH]** — both must do it or agree on it.

The sender runs the checklist. When a step is for the person at the printer, the sender asks about that one step only, waits for the answer, then moves to the next step. Never hand the person several steps at once. Always read the step number and wording from the current version of this checklist; never number or paraphrase steps from memory.

Do not move to the next step until the current one is done. If a step cannot be done, stop and fix it or ask the owner first.

---

## Rules to know before starting

- This is a Flashforge Adventurer 5M: one 0.4 mm nozzle, 220 × 220 × 220 mm build area, no built-in camera, no automatic colour changer.
- Two phones watch the printer: phone 1 at the front and phone 2 at the side. A recorder on the home network records them, but only while a print is running. Its page is http://192.168.68.10:8790 on the home network: it shows both cameras live, has buttons to start and stop recording and to switch each phone's light on or off or refocus it, and lists past recordings. The same live view is on the Home Assistant dashboard, in the "3D Printer" tab. Recordings are kept for 24 hours; a recording marked "failed" is kept until someone deletes it.
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
9. **[AT PRINTER]** Report how this spool has been stored since it was last used, and for how long: sealed in a bag with a desiccant pack, or left out in the open. Use the Moisture Table at the bottom of this list to decide whether it can be printed as-is, printed with damp-filament adjustments, or must be dried first. The definite dryness test comes later, when the purge line prints (step 49).
10. **[BOTH]** Agree on the material and colour before any settings are chosen.

## Stage 3 — Preparing the file

11. **[SENDER]** Slice the model yourself, specifically for the Flashforge Adventurer 5M with a 0.4 mm nozzle.
12. **[SENDER]** Use the temperatures in the Material Table at the bottom of this list, not the slicer's defaults; choose the lowest temperature that still prints well. If step 9 placed the spool in the "lightly damp" row of the Moisture Table, also apply the damp-filament adjustments listed there.
13. **[SENDER]** Delete the slicer's own default start code for this printer completely, then paste in `start-code.gcode` from this repository exactly as written. Only replace the two temperature placeholders with your slicer's names for the first-layer bed temperature and first-layer nozzle temperature. Do not change anything else. If the file is unavailable, write a start code that does steps 14 to 20 exactly.
14. **[SENDER]** The start code keeps the nozzle at or below 140 °C while the bed heats to printing temperature, while the printer homes, and while it measures the bed.
15. **[SENDER]** The start code measures the bed every print with `BED_MESH_CALIBRATE`, after homing, with the nozzle at 140 °C. The printer's built-in "level before print" must not be used, because it heats the nozzle to full temperature first. Without a bed measurement the first layer comes out uneven.
16. **[SENDER]** After measuring, the start code raises the nozzle to 10 mm and parks it next to the purge line, at X = 110, Y = -100 (not directly above the line).
17. **[SENDER]** Before heating to printing temperature, the start code pulls the filament back 1.5 mm, then heats the nozzle while it is still raised.
18. **[SENDER]** The start code never lowers the nozzle straight down where it was heated. It comes down at an angle to the start of the purge line (X = 95, Y = -110, height 0.3 mm), so any drip is left on the plate instead of being pushed onto the nozzle, then pushes the filament forward the same 1.5 mm.
19. **[SENDER]** The start code draws two purge lines along the front edge (Y = -110 and Y = -109.6, from X = 95 to X = -55, then back to X = 55), long enough that plastic flows smoothly and in the correct colour.
20. **[SENDER]** Right after the purge lines, the start code pulls the filament back 0.8 mm, wipes quickly backwards over the purge line it just drew (20 mm, from X = 55 to X = 35) so any ooze string sticks to that plastic, then lifts 2 mm before travelling to the print. It must never wipe onward onto bare plate.
21. **[SENDER]** Add a skirt of at least three loops, a few millimetres from the model, so the nozzle is flowing cleanly before it reaches the model.
22. **[SENDER]** Print the first layer slowly, about 30 mm per second.
23. **[SENDER]** Cap travel moves at about 250 mm per second, so small parts do not get knocked loose.
24. **[SENDER]** Place the seam at the back of the model.
25. **[SENDER]** Place the model flat side down, near the centre of the plate.
26. **[SENDER]** Check every area touching the plate; add a brim or small discs ("mouse ears") wherever the contact is tiny.
27. **[SENDER]** Add supports only where the model truly needs them.
28. **[SENDER]** Step through the slicer's layer preview from the first layer up, looking for gaps, floating parts or anything strange.
29. **[SENDER]** Open the sliced file as text and check its start before sending: the first nozzle temperature command is 140 °C; `BED_MESH_CALIBRATE` appears after homing; and nothing heats the nozzle above 140 °C before the bed has been measured. If any check fails, fix the slicer settings and slice again.
30. **[SENDER]** Note the estimated print time and filament weight, and tell the person at the printer.

## Stage 4 — Preparing the printer

31. **[SENDER]** Make sure this print will start with "level before print" turned off. When sending over the network, use the send option that turns leveling off for this print. If the print will be started from the printer's own screen, tell the person at the printer to untick leveling before pressing start.
32. **[AT PRINTER]** Remove everything from the plate: old prints, purge lines and stray strings.
33. **[AT PRINTER]** Wash the plate with warm water and dish soap, rinse it and dry it fully.
34. **[AT PRINTER]** Put the plate back flat on the bed, lined up with its alignment pins, without touching the printing surface.
35. **[AT PRINTER]** For PETG only, apply a thin even layer of glue stick to the plate.
36. **[AT PRINTER]** If the filament was just changed, push plastic through until the new colour comes out clean.
37. **[AT PRINTER]** Check the spool turns freely, with no tangles, crossed loops or snags.
38. **[BOTH]** Set the nozzle to the cleaning temperature for this material (see the Material Table), never to printing temperature. At cleaning temperature old plastic is soft enough to brush off but does not ooze out. If the nozzle is already hotter (for example after purging a filament change), pull the filament back about 2 mm and let it cool to cleaning temperature first.
39. **[AT PRINTER]** At cleaning temperature, look at the tip with a torch and scrub it with a brass brush until no old plastic, burnt residue or blobs remain. If there is no brass brush, a thickly folded paper towel (folded about ten times) can be used with quick, light wipes; then check for paper fibres on the tip. Never wipe with paper at printing temperature.
40. **[AT PRINTER]** Pull off any string still hanging from the tip with tweezers, never fingers.
41. **[BOTH]** Switch the nozzle heater off, let it cool below 140 °C, and check the tip is still clean.
42. **[AT PRINTER]** Make sure no fan, open window or air conditioner is blowing on the printer, and nothing nearby can fall onto the bed. The printer's own fans running is normal: the hotend fan runs whenever the nozzle is warm.
43. **[AT PRINTER]** Tell the sender: "plate clear, nozzle clean, filament confirmed".

## Stage 5 — Sending the print

44. **[SENDER]** Do not send anything until you have received "plate clear, nozzle clean, filament confirmed" for this print.
45. **[SENDER]** Check the printer is idle and ready, with no other job running or paused.
46. **[SENDER]** Start the recording on the recorder, giving the model's name and the estimated print time from step 30. Check that it now says it is recording and that both camera pictures show the printer. As a safety net it stops by itself one hour after the estimated time, so use the real estimate. If the recorder cannot be reached, tell the person at the printer and agree whether to print without a recording.
47. **[SENDER]** Send the print and tell the person at the printer it is starting.

## Stage 6 — Watching the start

48. **[AT PRINTER]** While it heats and homes, check the nozzle stays at or below 140 °C while it homes and measures the bed, and only heats up once it is raised next to the purge area. If it heats to full temperature early, stop the print and tell the sender.
49. **[AT PRINTER]** Watch the purge line: it should be smooth, unbroken and the right colour. This is also the dryness check: if the plastic pops, crackles, steams or bubbles, stop the print and dry the spool before trying again.
50. **[AT PRINTER]** Watch the skirt and the entire first layer, about the first three to five minutes.
51. **[AT PRINTER]** A good first layer is flat, slightly squashed, with lines touching each other and stuck firmly to the plate.
52. **[AT PRINTER]** Stop the print immediately if anything lifts, curls, drags, gets knocked loose, piles up in a lump, or the nozzle picks up a blob, then tell the sender what you saw. The sender then goes straight to step 55 and stops the recording, marked failed.

## Stage 7 — During the print

53. **[SENDER]** For the whole print, at least every 5 minutes, take fresh pictures from both cameras and actually look at them, as well as checking the printer's status. Watching the printer's status alone does not count: it cannot see spaghetti, lifting parts or blobs. If a picture is too dark or blurry to judge the print, switch that phone's light on or refocus it; which light and focus settings work best is still being tested, so note what helped in the print record (step 62). Alert the person at the printer if the print pauses, shows an error, the temperatures look wrong, or the pictures show anything lifting, stringing into a tangle or knocked loose.
54. **[AT PRINTER]** Check on the print every so often; someone must be reachable until it finishes.

## Stage 8 — After the print

55. **[SENDER]** As soon as the print finishes, is stopped or fails, stop the recording and mark it: finished OK, failed if anything went wrong, or cancelled if it was stopped for another reason. Never leave a recording running after the print. If a print marked OK turns out bad later, mark its recording failed within 24 hours so it is kept.
56. **[SENDER]** Before anything is taken off the plate, take a picture of the finished print from the cameras and keep it with the print record. If the print is a test or calibration whose result still has to be read, tell the person at the printer to keep every part, and not throw anything away, until the result has been read and written into this checklist.
57. **[AT PRINTER]** Let the plate cool for a few minutes, then flex it to release the print. Never use a scraper on the plate surface.
58. **[AT PRINTER]** Clear the purge line, skirt and leftover strings off the plate.
59. **[AT PRINTER]** Brush the nozzle once more while it is still warm.
60. **[AT PRINTER]** Put opened filament back in a sealed bag with a desiccant pack.
61. **[AT PRINTER]** Report how the print came out, with a photo of the parts if anything is wrong, and always for a test or calibration print.
62. **[SENDER]** Write down what was printed, the material, the settings used, and the result.
63. **[BOTH]** If anything went wrong, find the cause together and add a new step to this checklist so it never happens again.

---

## Material Table (starting values for this printer)

| Material | Nozzle | First layer nozzle | Cleaning temp | Bed (first layer / rest) | Part cooling fan | Notes |
|---|---|---|---|---|---|---|
| PLA (basic) | 205–210 °C | 215 °C | 160 °C (170 °C if residue will not soften) | 55 °C / 50 °C | Full | Default choice; best for small or detailed parts. |
| Silk PLA | 210–215 °C | 220 °C | 160 °C (170 °C if residue will not soften) | 55 °C / 50 °C | Full | Print slower; shiny but weaker; expect some stringing. |
| PETG | 235–240 °C | 240 °C | 190 °C | 75 °C / 70 °C | 30–50% | Glue stick on the plate; strong and heat-resistant. |

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
| Any | Pops, crackles, steams or bubbles on the purge line (step 49) | Dry before printing, no matter how it was stored. |

**Damp-filament adjustments:** lower the nozzle temperature by about 5 °C, increase retraction by about 0.2 mm, and turn on "avoid crossing walls" (or the slicer's equivalent) so travel moves stay over the part. These reduce stringing and ooze but do not remove the moisture.

**How to dry a spool:** a filament dryer, a food dehydrator, or an oven that can hold a low temperature accurately: about 45–50 °C for PLA and Silk PLA, about 60–65 °C for PETG, for 4–6 hours. Afterwards, store it sealed with desiccant.

---

## Lessons learned (why these rules exist)

- Early prints failed because the printer heated to full temperature, oozed, then pressed the oozing nozzle onto the plate to measure it. The ooze smeared the tip and spoiled the bed measurement, so the first layers came out wrong.
- Files sliced for a different printer brand gave wrong temperatures, speeds and start routines.
- Silk filament, small parts and fast travel moves led to parts being knocked loose and turning into a tangled mess.
- Small hooks, blobs or hairs at the start of each shape are a warning sign of ooze, not a cosmetic detail. Never ignore them.
- An AI assistant once prepared a print file before confirming which filament was loaded, because it "remembered" the filament from an earlier print. Temperature, cooling, bed heat and flow all depend on the exact filament, so that file was invalid. This is why the golden rules exist: nothing is carried over from a previous print, steps are never done out of order, and any file sliced before step 10 must be thrown away and sliced again.
- Cleaning the nozzle at printing temperature does not work: a hot nozzle keeps oozing, so the tip is dirty again straight away. Clean it at the lower cleaning temperature instead, and check for damp filament on the purge line.
- A start sequence once heated the nozzle to printing temperature directly above the purge spot and then lowered straight down. The drip that formed while heating was pushed up onto the nozzle and smeared across the plate. This is why the filament is pulled back before heating and the nozzle comes down at an angle.
- When the printer's built-in leveling was switched off and nothing else measured the bed, the first layer came out uneven: almost see-through in places and normal in others. The bed must still be measured every print, just with a clean nozzle at or below 140 °C.
- During a checklist run the sender labelled steps with the wrong numbers because it numbered them from memory after the checklist had changed. Step numbers and wording must always be read from the current checklist.
- A tiny string formed while cleaning PLA at 170 °C, so the PLA cleaning temperature was lowered to 160 °C.
- The start code once ended by wiping onward onto bare plate. The ooze string had nothing to stick to, curled up and wrapped onto the outside of the nozzle on the way to the print. The wipe now goes backwards over the fresh purge line and lifts higher.
- The parts of a flow calibration print were removed and lost before their result was read, so the whole test had to be repeated. A picture is now taken before anything leaves the plate, and test parts are kept until their result is written down.
- The Moisture Table once had no row for PLA left out for less than a week, so a spool left out for two days could not be classified. Every storage time now has a row.
- The start code file once had square brackets inside its instruction comments. OrcaSlicer read them as placeholders and refused to slice. Comments in the start code must never contain square brackets.
- During a print the sender only watched the printer's status, which cannot see what is on the plate, and looked at the cameras only when asked. The camera check is now a fixed 5-minute interval.
