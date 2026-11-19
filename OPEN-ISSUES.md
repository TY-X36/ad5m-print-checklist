# Open issues

Problems that have been seen but not yet fixed. When one is fixed, move the fix into the checklist (README.md), note it in CHANGELOG.md, and delete it from this list.

## 1. Blob at the seam corner of every part
- **Seen (runs 3 and 4):** a small ragged blob at the same corner of every flow tile, on the back edge where each layer starts and ends (the seam, placed at the back). Visible on top surfaces, not only the first layer.
- **Settings in use when seen:** pressure advance 0.025 (default, untuned), retraction 0.8 mm, z-hop 0.4 mm, wipe on, nozzle 210 °C (215 °C first layer).
- **Likely causes, most likely first:** pressure advance not tuned for this printer and filament; retraction and push-back amounts not tuned; the nozzle lowering (z-hop) onto the seam point; nozzle slightly hot.
- **Pressure advance test done (2026-11-20):** blobs at line starts visible from 0 to about 0.025 and gone from about 0.035; 0.04 chosen and added to the Material Table.
- **Next step:** confirm on the next print that the seam blobs are gone at 0.04. If some remain, run a retraction test, then try a hidden seam option (for example a scarf seam).

## 2. Ooze string while heating lands at the start of the purge line
- **Seen (run 4, on camera):** while the nozzle heats to printing temperature (raised, front right), a thin string still oozes out despite the 1.5 mm pull-back. When the nozzle comes down it is laid as a small curl at the start of the purge line that does not stick for a moment.
- **Confirmed fixed:** the backwards wipe over the purge line keeps the nozzle clean; no curl reached the nozzle or the print.
- **Next step:** test a larger pull-back before heating (about 2.5 mm, pushed back by the same amount before the purge). Only change the start code if the curl gets smaller and nothing else gets worse.

## 3. Bed measuring takes about 3 minutes every print (changed, to confirm)
- **Seen:** measuring the whole bed at every print is reliable but slow.
- **Change made (2026-11-20):** start code now measures a 3 × 3 grid instead of the full grid, at the owner's request.
- **Next step:** confirm on the next print that it takes well under a minute and the first layer is still even across the whole plate. If corners come out thin or thick, try a 4 × 4 grid.

## 4. Parts knocked loose near the top of a print
- **Root cause (run 4, from the camera recording, 1 frame per second):** a small front tile lifted at one edge while its top layers were printing; the nozzle then picked up a blob from it and dragged several tiles across the plate.
- **Contributing causes:** bed lowered from 55 to 50 °C after the first layer; small tiles without a brim; top surfaces and outer walls at 200 mm/s; 5 °C hotter and less pull-back than run 3 (more ooze at each seam).
- **Checklist changes made:** bed stays at one temperature for the whole print; brim on every part under about 30 × 30 mm; outer walls and top surfaces at about 100 mm/s on small parts and calibration tests.
- **Still to confirm:** rerun the flow test with these changes; if it completes with no part lifting, close this issue.

## 5. Printer drops off Wi-Fi during a print
- **Seen (overnight print, 2026-11-20 02:17):** about 20 minutes into the print the printer stopped answering on the network (no ping, no status, no API), while the camera showed it still printing from its own storage.
- **Impact:** status-based watching, pausing over the network and the finish notification stop working; only the cameras still work.
- **Next step:** check whether the printer comes back by itself; consider a fixed address and a stronger Wi-Fi signal near the printer, and check the printer's power-saving or Wi-Fi settings. Watching by camera must not depend on the printer's network.

## 6. Push-on fits come out too loose
- **Seen (overnight black PETG print, 2026-11-20):** the spinner caps were designed with a hole 0.2 mm wider than the 8 mm peg they press onto. They slide on and fall straight off; there is no grip at all.
- **Lesson so far:** a hole made bigger than the peg gives a sliding fit, not a push-on fit. A part meant to stay on needs a hole the same size as the peg or slightly smaller.
- **Next step:** check whether the gear fidget's caps (hole exactly the size of its 5 mm peg) grip. Reprint the spinner caps with a smaller hole, find the size that pushes on firmly by hand and stays, and record the working sizes for each material in the checklist's practical notes.
