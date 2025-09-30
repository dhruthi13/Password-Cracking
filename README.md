# Password-Cracking

# Task 3 — Password Cracking

**Objective**  
Use John the Ripper and Hashcat to crack password hashes in a controlled lab. This folder contains scripts and a report template for safe, repeatable password cracking exercises.

**Contents**
- `lab_instructions.md` — step-by-step usage for John & Hashcat (with safe options).
- `lab_report_template.md` — report template ready for submission.
- `john_run.sh` — wrapper to run John the Ripper with common options.
- `hashcat_run.sh` — wrapper to run Hashcat (local or docker).
- `sample_hashes/` — place sample hash files here (do not commit real credentials).
- `.gitignore` — recommended ignores.

**Ethics & safety**
- Only crack hashes you own or have written permission to crack (lab hashes).
- Never upload real credential dumps to public repos.
- Sanitize outputs before committing.
