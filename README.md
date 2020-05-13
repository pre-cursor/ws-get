[![license: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/continuul/ws-get/blob/master/LICENSE)

**Contents**

- [ws-get &mdash; introduction](#ws-get--introduction)
- [Examples](#examples)
- [Installing ws](#installing-ws)
- [Updating ws](#updating-ws)
- [Uninstalling ws](#uninstalling-ws)
- [License](#license)

# ws-get &mdash; introduction

**Installs [`ws`][ws]**, the **Developer Workspace Manager**, on Unix-like platforms.
Additionally, install script subcommands `ws-get update` for later on-demand updating of `ws`, and `ws-get uninstall` for uninstalling.

The simplest case is **installation of `ws` with confirmation prompt**:

```shell
curl -L https://git.io/ws-get | bash
```

## Examples

See [Installation options](#installation-options) for details.

* Installation with confirmation prompt to default location `$HOME/ws`:

```shell
curl -L https://git.io/ws-get | bash
```

* Automated installation to default location `$HOME/ws` with no confirmation prompt:

```shell
curl -L https://git.io/ws-get | bash -s -- install -y
```

* Automated, _quiet_ installation to default location `$HOME/ws`; _no status information_
is displayed:

```shell
curl -sL https://git.io/ws-get | bash -s -- install -q
```

## Installing ws

### Installation from GitHub

**Supported platforms and prerequisites**

Among the platforms supported by `ws`, any Unix-like platform with the following is supported:

* [`bash`](http://www.gnu.org/software/bash/)
* [`curl`](http://curl.haxx.se/)
* [`git`](http://git-scm.com/)
* [GNU `make`](http://www.gnu.org/software/make/)

These prerequisites are met by default on OSX and on at least some Linux platforms.

```shell
curl -L https://git.io/ws-get | [WS_PREFIX=<dir>] bash [-s -- [-y] [<subcommand>...]]
```

See below for an explanation of the options; `-s --` is required by Bash itself in order to pass options through to the script piped from stdin.

```nohighlight
$ ws-get --help

SYNOPSIS
  ws-get [-t] [-y|-q] [-n] [<subcommand>...]

DESCRIPTION
  Directly installs ws, the Developer Workspace Manager, which bypasses the need to
  manually manage and search workspaces.

  Additionally, provides subcommands to update ws,
  and to uninstall ws.

  The default installation directory is:

    ~/ws

  which can be overridden by setting environment variable WS_PREFIX to an
  absolute path before invocation; either way, however, the installation
  directory must either not exist yet or be empty.

  If your shell is Bash, Ksh, or Zsh, the relevant initialization file will be
  modified so as to:

   - export environment variable $WS_PREFIX to point to the installation dir.
   - ensure that the directory containing the ws executable, $WS_PREFIX/bin,
     is in the $PATH.

  Note that you either have to open a new terminal tab/window or re-source
  the relevant initialization file before you can use ws.
  For any other shell you'll have to make these modifications yourself.
  You can also explicitly opt out of the modification with -n.

  Options:

  -t
    Merely tests if all installation prerequisites are met, which is signaled
    with an exit code of 0.

  -y
    Assumes yes as the reply to all prompts; in other words: runs unattended
    by auto-confirming the confirmation prompt.

  -q
    Like -y, except that, additionally, all status messages are suppressed.

  -n
    Suppresses updating of the relevant shell initialization file.
    For instance, this allows for custom setups where all exports are
    "out-sourced" to an external file that is then sourced from the
    shell-initialization file; however, note that you'll then have to edit
    the out-sourced file *manually* - instructions will be printed.

  For more information, see https://git.io/ws-get-repo

PREREQUISITES
  bash ... to run this script and n itself.
  curl ... to download helper scripts from GitHub and run ws itself.
  git ... to clone ws's GitHub repository and update ws later.
  GNU make ... to run ws's installation procedure.

EXAMPLES
    # Install ws, with interactive prompt:
  ws-get
```

## Updating ws

Run `ws-get update` on demand to update `ws` itself to the latest version.

```bash
curl -sL https://git.io/ws-get | bash -s -- update -q -y
```

`ws-get update -y` skips the confirmation prompt.

## Uninstalling ws

Run `ws-get remove` to uninstall `ws` without deleting any workspaces.

```bash
curl -sL https://git.io/ws-get | bash -s -- remove -q
```

`ws-get remove -y` skips the confirmation prompt - **use with caution**.

## License

Copyright (c) 2016-2020 continuul.io, released under the [MIT license](https://spdx.org/licenses/MIT#licenseText).

  [ws]: https://github.com/continuul/ws
