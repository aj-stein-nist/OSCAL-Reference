#!/usr/bin/env bash
# List the refs that generated documentation should target (oldest to newest)

set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# The root of the OSCAL-Reference repository
ROOT_DIR="${SCRIPT_DIR}/.."
OSCAL_DIR="${ROOT_DIR}/support/OSCAL"

TAGS=$(cd "${OSCAL_DIR}"; git tag)

# filter out non-version tags (anything that isn't in a vX.X.X, milestones, release candidates, etc.)
TAGGED_REVISIONS=$(echo "${TAGS}" | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$')
# sort tags (which should be in semver-ish format)
TAGGED_REVISIONS=$(echo "${TAGGED_REVISIONS}" | sort -t "." -k1,1n -k2,2n -k3,3n)

# retrieve prefix for branches of prototypes to be listed and published and if
# it is empty, it can be ignored.
PROTOTYPE_BRANCHES_REMOTE=${PROTOTYPE_BRANCHES_REMOTE:-"origin"}
PROTOTYPE_BRANCHES_PREFIX=${PROTOTYPE_BRANCHES_PREFIX:-"prototype"}
# the output of ls-remote is the best for this but doesn't have ready-made
# format or pretty-print options. We need to use sed to filter the output
# output is the following format:
# sha1-hash        refs/heads/branch-name
# 012345abcd012345abcd012345abcd012345abcd        refs/heads/branch-name
PROTOTYPE_BRANCHES=$(cd "${OSCAL_DIR}"; git ls-remote "${PROTOTYPE_BRANCHES_REMOTE}" "${PROTOTYPE_BRANCHES_PREFIX}*" | sed -n -e "s|^.*\(refs/heads/\)\(${PROTOTYPE_BRANCHES_PREFIX}\)|\2|p")
echo "${TAGGED_REVISIONS}" "${PROTOTYPE_BRANCHES}"
