# Open issues

Problems that have been seen but not yet fixed. When one is fixed, move the fix into the checklist (README.md), note it in CHANGELOG.md, and delete it from this list.

## 1. Tiny nub at the start of each shape
- **Seen:** a very small bit of filament sticking up at the corner where each outline starts, on an otherwise good first layer.
- **Likely causes, most likely first:** pressure advance not tuned for this printer; the nozzle lifting and lowering for travel moves (z-hop); slightly damp filament; retraction amount or priming speed.
- **Next step:** run a pressure advance calibration print for the loaded filament and record the result in the Material Table. If nubs remain, run a retraction calibration.

## 2. Curl of filament onto the nozzle between the purge line and the print
- **Seen:** a small curl got onto the outside of the nozzle after the purge line, on the way to the print.
- **Change made:** the wipe now goes backwards over the purge line and lifts 2 mm (start code and step 20).
- **Next step:** confirm on the next print that no curl reaches the nozzle. If it is gone, delete this item.

## 3. Bed measuring takes about 3 minutes every print
- **Seen:** measuring the whole bed at every print is reliable but slow.
- **Next step:** test measuring only the area under the model (adaptive bed measuring) with a no-print test. Only change the checklist if it works.
