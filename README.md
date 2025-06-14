This CLI is using proto to distribute the binary.

If you want to use it without proto, feel free to download binaries from the [releases](https://github.com/JLarky/proto-tmp/releases) page.

## install proto

To install proto:

```bash
bash <(curl -fsSL https://moonrepo.dev/install/proto.sh)
```

or more options: https://moonrepo.dev/docs/proto/install

## install tmp

To install `tmp` binary:

```bash
proto plugin add --to global tmp https://raw.githubusercontent.com/JLarky/proto-tmp/refs/heads/main/tmp.toml
proto install -c global tmp
```

![Image](https://github.com/user-attachments/assets/7ecacd73-6bac-4135-9cc1-9feecdc3cfd4)

## configure your shell

add this alias to your shell (if you don't the command will still create the directory in `/tmp` but you'd have to cd to it manually):

```bash
alias tmp='cd $(~/.proto/shims/tmp)'
```

## use it

```bash
tmp
```

![Image](https://github.com/user-attachments/assets/8779f9fa-c725-4f1a-a545-373f080e38bb)

## uninstall tmp

```bash
proto uninstall --yes -c global tmp
proto plugin remove --from global tmp
```

## uninstall proto

remove `~/.proto` and remove `$PROTO_HOME` from your shell.

See more https://moonrepo.dev/docs/proto/install#uninstalling
