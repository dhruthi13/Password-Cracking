#!/usr/bin/env bash
# hashcat_run.sh - run hashcat (local or docker)
# Usage: ./hashcat_run.sh sample_hashes/hashes.txt 0
# 2nd arg = hash mode (0=MD5, 1000=NTLM, 1400=SHA256, etc.)
set -e

HASHFILE="${1:-sample_hashes/hashes.txt}"
HASHMODE="${2:-0}"
OUTDIR="results"
POTFILE="${OUTDIR}/hashcat.pot"
OUTFILE="${OUTDIR}/hashcat_cracked.txt"

mkdir -p "$OUTDIR"

# prefer local hashcat if available
if command -v hashcat >/dev/null 2>&1; then
  echo "[+] Found local hashcat. Running attack..."
  hashcat -m "$HASHMODE" -a 0 "$HASHFILE" /usr/share/wordlists/rockyou.txt --potfile-path "$POTFILE" -o "$OUTFILE"
  echo "[+] Exporting cracked entries..."
  hashcat --show -m "$HASHMODE" "$HASHFILE" --potfile-path "$POTFILE" > "$OUTFILE"
else
  echo "[+] Local hashcat not found. Trying docker..."
  docker run --rm -v "$(pwd)/sample_hashes:/data" -v "$(pwd)/results:/results" hashcat/hashcat:latest \
    hashcat -m "$HASHMODE" -a 0 /data/$(basename "$HASHFILE") /usr/share/wordlists/rockyou.txt --potfile-path /results/hashcat.pot -o /results/hashcat_cracked.txt
  docker run --rm -v "$(pwd)/sample_hashes:/data" -v "$(pwd)/results:/results" hashcat/hashcat:latest \
    hashcat --show -m "$HASHMODE" /data/$(basename "$HASHFILE") --potfile-path /results/hashcat.pot > /results/hashcat_cracked.txt
fi

echo "[+] Results saved to $OUTFILE"
