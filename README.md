# Print Checklist — Flashforge Adventurer 5M

Everyone who prints on this printer follows this list, every time: people, AI assistants, any computer, any slicer.

## The three golden rules

1. **Every step, every print.** This is a pre-flight checklist. Every single step below must be done again for every single print, even if the print before it was five minutes ago.
2. **Nothing is assumed or carried over.** Answers, checks and confirmations from a previous print, an earlier conversation, a note, a memory or "what you were told last time" do not count. If a step asks a question, ask it again now. If a step asks for a check, check it again now.
3. **Strictly in order.** Do the steps top to bottom. Never do a later step before an earlier one is finished, even if it seems harmless or faster. Example: never open the slicer before the filament is confirmed, because the filament decides the settings.

If you find you did a step out of order, or relied on an old answer, go back to that step, redo it and everything after it, and discard anything prepared in between.

---

Each step says who does it:

- **[SENDER]** — whoever prepares the file and sends it to the printer. This may be an AI assistant or a person at a computer.
- **[AT PRINTER]** — the person physically standing next to the printer. Only they can check anything you need eyes or hands for.
- **[BOTH]** — both must do it or agree on it.

The sender runs the checklist. When a step is for the person at the printer, the sender asks about that one step only, waits for the answer, then moves to the next step. Never hand the person several steps at once.

Do not move to the next step until the current one is done. If a step cannot be done, stop and fix it or ask the owner first.

---

## Rules to know before starting

- This is a Flashforge Adventurer 5M: one 0.4 mm nozzle, 220 × 220 × 220 mm build area, no camera, no automatic colour changer.
- It measures the bed by pressing the nozzle itself onto the plate, so anything stuck to the nozzle ruins the measurement and the first layer.
- A hot nozzle leaks plastic ("ooze"). Ooze on the nozzle during homing or bed measuring is the number one cause of failed prints on this printer.
- The nozzle must never be above 140 °C while the printer homes or measures the bed.

---

## Stage 1 — Choosing what to print

1. **[SENDER]** Confirm the model fits inside 220 × 220 × 220 mm at the intended size.
2. **[SENDER]** Read the designer's notes for required settings, minimum size, supports, brim and plate type.
3. **[SENDER]** Do not scale a model below the designer's minimum size, especially one with moving joints.
4. **[SENDER]** If the model is multi-colour, agree with the person at the printer whether to print it in one colour or do manual colour swaps.
5. **[SENDER]** Never use a file already sliced for a different printer, even if it says "ready to print"; get the original model file instead.

## Stage 2 — Agreeing on the filament

6. **[SENDER]** Ask the person at the printer exactly which filament is loaded: material, brand and colour. Ask fresh for every print; never assume it is the same as last time. Do not open the slicer until this is answered.
7. **[AT PRINTER]** Report the loaded filament, and whether there is clearly enough left on the spool for the job.
8. **[AT PRINTER]** Report how this spool has been stored since it was last used, and for how long: sealed in a bag with a desiccant pack, or left out in the open. Use the Moisture Table at the bottom of this list to decide whether it can be printed as-is, printed with damp-filament adjustments, or must be dried first. The definite dryness test comes later, when the purge line prints (step 45).
9. **[BOTH]** Agree on the material and colour before any settings are chosen.

## Stage 3 — Preparing the file

10. **[SENDER]** Slice the model yourself, specifically for the Flashforge Adventurer 5M with a 0.4 mm nozzle.
11. **[SENDER]** Use the temperatures in the Material Table at the bottom of this list, not the slicer's defaults; choose the lowest temperature that still prints well. If step 8 placed the spool in the "lightly damp" row of the Moisture Table, also apply the damp-filament adjustments listed there.
12. **[SENDER]** Make sure the bed is measured (leveled) at the start of this print with a clean nozzle at or below 140 °C. The printer's built-in "level before print" heats the nozzle to full temperature first, so it must not be used; the start of the print must do the bed measuring itself, with the nozzle at or below 140 °C. Without a bed measurement the first layer comes out uneven.
13. **[SENDER]** Set the start of the print so the nozzle stays at or below 140 °C while the bed heats, the printer homes and the bed is measured.
14. **[SENDER]** Before the nozzle heats to printing temperature, pull the filament back about 1.5 mm so it does not drip while heating.
15. **[SENDER]** Heat the nozzle to printing temperature with it raised well clear of the plate (about 10 mm), next to the purge area at the front edge.
16. **[SENDER]** Never lower the nozzle straight down onto the spot where it was heated. Bring it down at an angle while moving sideways, so any drip is left on the plate instead of being pushed up onto the nozzle. Then push the filament forward by the same amount it was pulled back.
17. **[SENDER]** Include a purge line long enough that plastic is flowing smoothly and in the correct colour.
18. **[SENDER]** Right after the purge line, pull the filament back slightly and make a fast sideways wipe so any ooze string snaps off the nozzle.
19. **[SENDER]** Add a skirt of at least three loops, a few millimetres from the model, so the nozzle is flowing cleanly before it reaches the model.
20. **[SENDER]** Print the first layer slowly, about 30 mm per second.
21. **[SENDER]** Cap travel moves at about 250 mm per second, so small parts do not get knocked loose.
22. **[SENDER]** Place the seam at the back of the model.
23. **[SENDER]** Place the model flat side down, near the centre of the plate.
24. **[SENDER]** Check every area touching the plate; add a brim or small discs ("mouse ears") wherever the contact is tiny.
25. **[SENDER]** Add supports only where the model truly needs them.
26. **[SENDER]** Step through the slicer's layer preview from the first layer up, looking for gaps, floating parts or anything strange.
27. **[SENDER]** Note the estimated print time and filament weight, and tell the person at the printer.

## Stage 4 — Preparing the printer

28. **[SENDER]** Make sure this print will start with "level before print" turned off. When sending over the network, use the send option that turns leveling off for this print. If the print will be started from the printer's own screen, tell the person at the printer to untick leveling before pressing start.
29. **[AT PRINTER]** Remove everything from the plate: old prints, purge lines and stray strings.
30. **[AT PRINTER]** Wash the plate with warm water and dish soap, rinse it and dry it fully.
31. **[AT PRINTER]** Put the plate back flat on the bed, lined up with its alignment pins, without touching the printing surface.
32. **[AT PRINTER]** For PETG only, apply a thin even layer of glue stick to the plate.
33. **[AT PRINTER]** If the filament was just changed, push plastic through until the new colour comes out clean.
34. **[AT PRINTER]** Check the spool turns freely, with no tangles, crossed loops or snags.
35. **[BOTH]** Set the nozzle to the cleaning temperature for this material (see the Material Table), never to printing temperature. At cleaning temperature old plastic is soft enough to brush off but does not ooze out. If the nozzle is already hotter (for example after purging a filament change), pull the filament back about 2 mm and let it cool to cleaning temperature first.
36. **[AT PRINTER]** At cleaning temperature, look at the tip with a torch and scrub it with a brass brush until no old plastic, burnt residue or blobs remain.
37. **[AT PRINTER]** Pull off any string still hanging from the tip with tweezers, never fingers.
38. **[BOTH]** Switch the nozzle heater off, let it cool below 140 °C, and check the tip is still clean.
39. **[AT PRINTER]** Make sure no fan, open window or air conditioner is blowing on the printer, and nothing nearby can fall onto the bed. The printer's own fans running is normal: the hotend fan runs whenever the nozzle is warm.
40. **[AT PRINTER]** Tell the sender: "plate clear, nozzle clean, filament confirmed".

## Stage 5 — Sending the print

41. **[SENDER]** Do not send anything until you have received "plate clear, nozzle clean, filament confirmed" for this print.
42. **[SENDER]** Check the printer is idle and ready, with no other job running or paused.
43. **[SENDER]** Send the print and tell the person at the printer it is starting.

## Stage 6 — Watching the start

44. **[AT PRINTER]** While it heats and homes, check the nozzle stays at or below 140 °C while it homes and measures the bed, and only heats up once it is raised next to the purge area. If it heats to full temperature early, stop the print and tell the sender.
45. **[AT PRINTER]** Watch the purge line: it should be smooth, unbroken and the right colour. This is also the dryness check: if the plastic pops, crackles, steams or bubbles, stop the print and dry the spool before trying again.
46. **[AT PRINTER]** Watch the skirt and the entire first layer, about the first three to five minutes.
47. **[AT PRINTER]** A good first layer is flat, slightly squashed, with lines touching each other and stuck firmly to the plate.
48. **[AT PRINTER]** Stop the print immediately if anything lifts, curls, drags, gets knocked loose, piles up in a lump, or the nozzle picks up a blob, then tell the sender what you saw.

## Stage 7 — During the print

49. **[SENDER]** If you can see the printer's status remotely, check it regularly and alert the person at the printer if it pauses, shows an error or the temperatures look wrong.
50. **[AT PRINTER]** Check on the print every so often; someone must be reachable until it finishes.

## Stage 8 — After the print

51. **[AT PRINTER]** Let the plate cool for a few minutes, then flex it to release the print. Never use a scraper on the plate surface.
52. **[AT PRINTER]** Clear the purge line, skirt and leftover strings off the plate.
53. **[AT PRINTER]** Brush the nozzle once more while it is still warm.
54. **[AT PRINTER]** Put opened filament back in a sealed bag with a desiccant pack.
55. **[AT PRINTER]** Report how the print came out, with a photo if anything is wrong.
56. **[SENDER]** Write down what was printed, the material, the settings used, and the result.
57. **[BOTH]** If anything went wrong, find the cause together and add a new step to this checklist so it never happens again.

---

## Material Table (starting values for this printer)

| Material | Nozzle | First layer nozzle | Cleaning temp | Bed | Part cooling fan | Notes |
|---|---|---|---|---|---|---|
| PLA (basic) | 205–210 °C | 215 °C | 170 °C | 55 °C | Full | Default choice; best for small or detailed parts. |
| Silk PLA | 210–215 °C | 220 °C | 170 °C | 55 °C | Full | Print slower; shiny but weaker; expect some stringing. |
| PETG | 235–240 °C | 240 °C | 190 °C | 75 °C | 30–50% | Glue stick on the plate; strong and heat-resistant. |

When a material is tested and better values are found, update this table.

---

## Moisture Table (how to treat a spool based on how it was stored)

| Material | How it was stored | What to do |
|---|---|---|
| Any | Sealed in a bag with desiccant | Print normally. |
| PLA or Silk PLA | Left out 1 to 4 weeks | "Lightly damp": print with damp-filament adjustments (below). |
| PLA or Silk PLA | Left out more than 4 weeks | Dry before printing. |
| PETG | Left out more than 3 days | Dry before printing. |
| Any | Pops, crackles, steams or bubbles on the purge line (step 45) | Dry before printing, no matter how it was stored. |

**Damp-filament adjustments:** lower the nozzle temperature by about 5 °C, increase retraction by about 0.2 mm, and turn on "avoid crossing walls" (or the slicer's equivalent) so travel moves stay over the part. These reduce stringing and ooze but do not remove the moisture.

**How to dry a spool:** a filament dryer, a food dehydrator, or an oven that can hold a low temperature accurately: about 45–50 °C for PLA and Silk PLA, about 60–65 °C for PETG, for 4–6 hours. Afterwards, store it sealed with desiccant.

---

## Lessons learned (why these rules exist)

- Early prints failed because the printer heated to full temperature, oozed, then pressed the oozing nozzle onto the plate to measure it. The ooze smeared the tip and spoiled the bed measurement, so the first layers came out wrong.
- Files sliced for a different printer brand gave wrong temperatures, speeds and start routines.
- Silk filament, small parts and fast travel moves led to parts being knocked loose and turning into a tangled mess.
- Small hooks, blobs or hairs at the start of each shape are a warning sign of ooze, not a cosmetic detail. Never ignore them.
- An AI assistant once prepared a print file before confirming which filament was loaded, because it "remembered" the filament from an earlier print. Temperature, cooling, bed heat and flow all depend on the exact filament, so that file was invalid. This is why the golden rules exist: nothing is carried over from a previous print, steps are never done out of order, and any file sliced before step 9 must be thrown away and sliced again.
- Cleaning the nozzle at printing temperature does not work: a hot nozzle keeps oozing, so the tip is dirty again straight away. Clean it at the lower cleaning temperature instead, and check for damp filament on the purge line.
- A start sequence once heated the nozzle to printing temperature directly above the purge spot and then lowered straight down. The drip that formed while heating was pushed up onto the nozzle and smeared across the plate. This is why the filament is pulled back before heating and the nozzle comes down at an angle.
- When the printer's built-in leveling was switched off and nothing else measured the bed, the first layer came out uneven: almost see-through in places and normal in others. The bed must still be measured every print, just with a clean nozzle at or below 140 °C.
