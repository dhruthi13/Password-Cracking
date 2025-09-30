
---

### `TASK3-Password-Cracking/john_run.sh`
```bash
#!/usr/bin/env bash
# john_run.sh - run John the Ripper with standard options
# Usage: ./john_run.sh sample_hashes/hashes.txt
set -e

HASHFILE="${1:-sample_hashes/hashes.txt}"
OUTDIR="results"
POTFILE="${OUTDIR}/john.pot"
CRACKED="${OUTDIR}/john_cracked.txt"

mkdir -p "$OUTDIR"

echo "[+] Running John the Ripper on $HASHFILE"
# default: rockyou + rules; change --format as needed for your hash type
john --wordlist=/usr/share/wordlists/rockyou.txt --rules --format=raw-md5 "$HASHFILE" --pot="$POTFILE"

echo "[+] Exporting cracked passwords to $CRACKED"
john --show --pot="$POTFILE" "$HASHFILE" > "$CRACKED"

echo "[+] Done. Results: $CRACKED"
