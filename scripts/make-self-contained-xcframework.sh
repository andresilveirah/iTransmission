#!/usr/bin/env bash

set -euo pipefail

artifact_root="${1:-Artifacts/iTransmissionFramework.xcframework}"
curl_root="${2:-third-party/curl.xcframework}"

if [ ! -d "${artifact_root}" ]; then
  echo "Missing XCFramework: ${artifact_root}" >&2
  exit 1
fi

if [ ! -d "${curl_root}" ]; then
  echo "Missing curl XCFramework: ${curl_root}" >&2
  exit 1
fi

merge_slice() {
  local slice="$1"
  local transmission_lib="${artifact_root}/${slice}/libITransmission.a"
  local curl_lib="${curl_root}/${slice}/curl.framework/curl"
  local merged_lib
  merged_lib="$(mktemp "/tmp/libITransmission-${slice}.XXXXXX.a")"

  if [ ! -f "${transmission_lib}" ]; then
    echo "Missing transmission slice library: ${transmission_lib}" >&2
    exit 1
  fi

  if [ ! -f "${curl_lib}" ]; then
    echo "Missing curl slice library: ${curl_lib}" >&2
    exit 1
  fi

  libtool -static -o "${merged_lib}" "${transmission_lib}" "${curl_lib}"
  mv "${merged_lib}" "${transmission_lib}"
}

merge_slice "ios-arm64"
merge_slice "ios-arm64_x86_64-simulator"

echo "XCFramework is now self-contained at ${artifact_root}"
