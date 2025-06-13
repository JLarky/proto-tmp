#!/usr/bin/env bash
set -e

# Step 1: Change to the Gleam project directory
cd proto_tmp

# Step 2: Compile Gleam to JavaScript
gleam build --target=javascript

# Step 3: Use the correct main JS entry point for bundling
MAIN_JS="build/dev/javascript/proto_tmp/gleam.main.mjs"

# Step 4: Bundle the JS entry point and its dependencies using Bun
bun build "$MAIN_JS" --outfile bins/bundle.js --target bun

# Step 5: Compile the bundled JS to a Deno executable
deno compile --output bins/proto_tmp --allow-all bins/bundle.js

rm bins/bundle.js

VERSION="0.0.1"

tar -czvf bins/proto_tmp_${VERSION}_darwin.tar.gz bins/proto_tmp

shasum -a 256 bins/proto_tmp_${VERSION}_darwin.tar.gz > bins/proto_tmp_${VERSION}_darwin_checksums.txt


echo "Build complete! Executable is ./proto_tmp/bins/proto_tmp" 
