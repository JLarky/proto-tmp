This CLI is using proto to distribute the binary.

Feel free to download binaries from the [releases](https://github.com/JLarky/proto-tmp/releases) page.

To install proto:

```bash
bash <(curl -fsSL https://moonrepo.dev/install/proto.sh)
```

or more options: https://moonrepo.dev/docs/proto/install

To install `tmp` binary:

```bash
proto plugin add --to user tmp https://raw.githubusercontent.com/JLarky/proto-tmp/refs/heads/main/tmp.toml
proto install tmp
```

Now you should be able to run `tmp` from the command line.
