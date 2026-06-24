#!/usr/bin/env bash

set -euo pipefail

artifact_path="Artifacts/iTransmissionFramework.xcframework"

if [ -d "${artifact_path}" ]; then
  echo "Using existing XCFramework at ${artifact_path}"
  exit 0
fi

cat <<'EOF'
No in-repo XCFramework build pipeline is available yet.

This repository currently does not contain the engine source or build scripts required
to rebuild Artifacts/iTransmissionFramework.xcframework from scratch in CI.

Current workflow behavior:
1. Try this script first.
2. If no XCFramework is produced, fall back to the latest GitHub Release asset.

To enable true rebuilds on every push, replace this script with the real commands that
produce Artifacts/iTransmissionFramework.xcframework.
EOF

exit 1
