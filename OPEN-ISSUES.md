# Open issues

Problems that have been seen but not yet fixed. When one is fixed, move the fix into the checklist (README.md), note it in CHANGELOG.md, and delete it from this list.

## 1. Blob at the seam corner of every part
- **Seen (runs 3 and 4):** a small ragged blob at the same corner of every flow tile, on the back edge where each layer starts and ends (the seam, placed at the back). Visible on top surfaces, not only the first layer.
- **Settings in use when seen:** pressure advance 0.025 (default, untuned), retraction 0.8 mm, z-hop 0.4 mm, wipe on, nozzle 210 °C (215 °C first layer).
- **Likely causes, most likely first:** pressure advance not tuned for this printer and filament; retraction and push-back amounts not tuned; the nozzle lowering (z-hop) onto the seam point; nozzle slightly hot.
- **Next step:** run a pressure advance calibration for the loaded filament and record the value in the Material Table. If blobs remain, run a retraction calibration, then try a hidden seam option (for example a scarf seam) on the next test.

## 2. Ooze string while heating lands at the start of the purge line
- **Seen (run 4, on camera):** while the nozzle heats to printing temperature (raised, front right), a thin string still oozes out despite the 1.5 mm pull-back. When the nozzle comes down it is laid as a small curl at the start of the purge line that does not stick for a moment.
- **Confirmed fixed:** the backwards wipe over the purge line keeps the nozzle clean; no curl reached the nozzle or the print.
- **Next step:** test a larger pull-back before heating (about 2.5 mm, pushed back by the same amount before the purge). Only change the start code if the curl gets smaller and nothing else gets worse.

## 3. Bed measuring takes about 3 minutes every print
- **Seen:** measuring the whole bed at every print is reliable but slow.
- **Next step:** test measuring only the area under the model (adaptive bed measuring) with a no-print test. Only change the checklist if it works.
