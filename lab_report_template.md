# Lab Report — Task 3: Password Cracking

**Name:**  
**Date:**  
**Target (hash file):** `sample_hashes/hashes.txt`  
**Lab snapshot ID:**  

## 1. Objective
Briefly state the goal: test cracking techniques with John and Hashcat on lab hashes.

## 2. Tools & environment
- John the Ripper (version: )  
- Hashcat (version: )  
- Wordlists: `/usr/share/wordlists/rockyou.txt` (sanitized subset)  
- Hardware: CPU / GPU notes

## 3. Commands executed
./john_run.sh sample_hashes/hashes.txt
./hashcat_run.sh sample_hashes/hashes.txt 0

markdown
Copy code

## 4. Results (table)
| Hash | Cracked? | Plaintext | Method (john/hashcat/rule/mask) | Time taken |
|------|----------|-----------|----------------------------------|------------|
| (redacted) | Yes | password123 | john + rockyou + rules | 00:02:34 |

## 5. Observations
- Which methods were most successful.
- Rate (hashes/sec) if measurable.
- Any salts or complexities observed.

## 6. Mitigation & recommendations
- Use strong, slow hashing algorithms (bcrypt/argon2), per-user salts, rate-limiting, MFA.
- Do not store reversible encryption.

## 7. Evidence
- `results/john_cracked.txt`
- `results/hashcat_cracked.txt`
- Screenshots showing commands and success.

## 8. Conclusion
Short summary of findings and recommended next steps.
