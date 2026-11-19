# Open issues

Problems that have been seen but not yet fixed. When one is fixed, move the fix into the checklist (README.md), note it in CHANGELOG.md, and delete it from this list.

## 1. Tiny nub at the start of each shape
- **Seen:** a very small bit of filament sticking up at the corner where each outline starts, on an otherwise good first layer.
- **Likely causes, most likely first:** pressure advance not tuned for this printer; the nozzle lifting and lowering for travel moves (z-hop); slightly damp filament; retraction amount or priming speed.
- **Next step:** run a pressure advance calibration print for the loaded filament and record the result in the Material Table. If nubs remain, run a retraction calibration.

## 2. Ooze string while heating lands at the start of the purge line
- **Seen (run 4, on camera):** while the nozzle heats to printing temperature (raised, front right), a thin string still oozes out despite the 1.5 mm pull-back. When the nozzle comes down it is laid as a small curl at the start of the purge line that does not stick for a moment.
- **Confirmed fixed:** the backwards wipe over the purge line keeps the nozzle clean; no curl reached the nozzle or the print.
- **Next step:** test a larger pull-back before heating (about 2.5 mm, pushed back by the same amount before the purge). Only change the start code if the curl gets smaller and nothing else gets worse.

## 3. Bed measuring takes about 3 minutes every print
- **Seen:** measuring the whole bed at every print is reliable but slow.
- **Next step:** test measuring only the area under the model (adaptive bed measuring) with a no-print test. Only change the checklist if it works.
