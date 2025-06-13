#!/usr/bin/env bash
set -e

# Step 1: Change to the Gleam project directory
cd proto_tmp

# Step 2: Compile Gleam to JavaScript
gleam build --target=javascript

# Step 3: Use the correct main JS entry point for bundling
MAIN_JS="build/dev/javascript/proto_tmp/gleam.main.mjs"

# Step 4: Bundle the JS entry point and its dependencies using Bun
bun build "$MAIN_JS" --outfile bundle.js --target bun

# Step 5: Compile the bundled JS to a Deno executable
deno compile --output proto_tmp --allow-all bundle.js

echo "Build complete! Executable is ./proto_tmp/proto_tmp" 
