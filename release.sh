#!/usr/bin/env bash
set -e

# Step 1: Build the project and artifacts
./build.sh

# Step 2: Set version and tag
VERSION="0.0.1"
TAG="v$VERSION"

# Step 3: Create a git tag if it doesn't exist
git fetch --tags
if ! git rev-parse "$TAG" >/dev/null 2>&1; then
  git tag "$TAG"
  git push origin "$TAG"
fi

# Step 4: Create a GitHub release if it doesn't exist
if ! gh release view "$TAG" >/dev/null 2>&1; then
  gh release create "$TAG" \
    --title "$TAG" \
    --notes "Release $TAG"
fi

# Step 5: Upload artifacts to the release
gh release upload "$TAG" \
  proto_tmp/bins/proto_tmp_${VERSION}_darwin.tar.gz \
  proto_tmp/bins/proto_tmp_${VERSION}_darwin_checksums.txt \
  --clobber

echo "Release $TAG created and artifacts uploaded." 
