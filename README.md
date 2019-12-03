# path-utils

A few simple Windows git-related utilities. Clone into a folder, add it to PATH and you're done.
Requires `sh` (for example from Git-for-Windows)

# Utilities
## `prune-branches`
Removes all local branches whose upstream is either `gone` or `deleted`.

## `refetch`
Runs `git fetch`, hard resets to match upstream. Useful when coming back to a branch and wanting its state to be the same as on the upstream.

## `reserver`
The same as `refetch`, but starts the joker server afterwards.

## `server`
Starts the ROIHunter server. Takes one argument with the backend name, if not supplied lists all available backends.
