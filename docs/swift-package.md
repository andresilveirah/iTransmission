# Swift Package distribution

This repo ships `iTransmissionFramework.xcframework` to SwiftPM as binary product `iTransmissionBinary` through GitHub Release asset download.

## Automation

GitHub Actions workflow:

- Runs on every push to `main`
- Tries `scripts/build-xcframework.sh` first
- If that script does not produce `Artifacts/iTransmissionFramework.xcframework`, it falls back to latest published release asset
- Zips XCFramework
- Computes SwiftPM checksum
- Updates `Package.swift`
- Commits manifest change back to `main`
- Creates tag
- Publishes matching GitHub Release with ZIP asset

Current limitation:

- This repo still does not include engine source or build commands needed to rebuild XCFramework from scratch in CI.
- Replace `scripts/build-xcframework.sh` with real build steps when that pipeline is available.

## How Muuvie should consume it

Preferred distribution flow:

1. Push this repo to remote Git host.
2. Build `iTransmissionFramework.xcframework` locally.
3. Zip it as `iTransmissionFramework.xcframework.zip`.
4. Create Git tag, for example `1.0.0`.
5. Upload ZIP to GitHub Release for that tag.
6. In Muuvie, add package by Git URL and depend on product `iTransmissionBinary`.

Development-only option:

- Use local path package while iterating on same machine.

This package **does** depend on release ZIP artifact. SwiftPM downloads binary from:

- `https://github.com/andresilveirah/iTransmission/releases/download/<tag>/iTransmissionFramework.xcframework.zip`

## Rebuild or update XCFramework

Update flow:

1. Rebuild `iTransmissionFramework.xcframework` from existing engine build pipeline.
2. Zip it with parent folder preserved:

```sh
ditto -c -k --sequesterRsrc --keepParent Artifacts/iTransmissionFramework.xcframework iTransmissionFramework.xcframework.zip
```

3. Compute new checksum:

```sh
swift package compute-checksum iTransmissionFramework.xcframework.zip
```

4. Update `Package.swift` with new release URL and checksum.
5. Commit manifest/docs changes.
6. Create and push new Git tag.
7. Upload ZIP to GitHub Release for same tag.

## Why no Git LFS

This repository is a public fork on GitHub.com. GitHub does not allow pushing Git LFS objects to public forks there, so release assets are used instead of in-repo LFS-tracked XCFramework blobs.

For local app work in this repo, keep artifact untracked at:

- `Artifacts/iTransmissionFramework.xcframework`

## Validation

Quick local validation:

```sh
swift package describe
```

If that succeeds, SwiftPM can resolve manifest and release-asset binary target metadata.
