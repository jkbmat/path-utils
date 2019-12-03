@echo off
git fetch -p > NUL && sh -c "for branch in `git for-each-ref --format '%%(refname) %%(upstream:track)' refs/heads | awk '$2 == \"[gone]\" || $2 == \"[deleted]\" {sub(\"refs/heads/\", \"\", $1); print $1}'`; do git branch -D $branch; done"
