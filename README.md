# Bunbrush in Operation Friendship Repair

Welcome to the monorepo for my 2025 N64Brew Game Jam entry.

This repository consists of:

- The game's source code
- The ScummC compiler
- ScummVM v1.9.0

In addition you'll also need Docker, [ucon64](https://ucon64.sourceforge.io/), the [ScummVM N64 Toolchain](https://hub.docker.com/layers/scummvm/dockerized-toolchains/n64/images/sha256-7c6069c8f3f938c851566d593dd041c9e62ee8d7c11fd0fa837a4aa4e029f81e) as well as the dependencies outlined in the [ScummC README](scummc/README.md).

## How to build

- First build the ScummC compiler
- Next cd into `game_jam-n64` and run `make tentacle`
- From a second terminal:
  - `cd scummvm`
  - `docker run -v .:/data/scummvm -w /data/scummvm -it scummvm/dockerized-toolchains:n64 /bin/bash`
  - `scummvm_configure --host=n64 --disable-all-engines --enable-engine=scumm --disable-hq-scalers --disable-scalers --disable-16bit --disable-taskbar --enable-release --enable-tremor --disable-highres`
  - `make n64-dist`
- Copy `tentacle.000`, `tentacle.001` and all `Track**.ogg` files from `game_jam-n64` to `scummvm/n64-dist/scummvm/romfs`
- From your Docker terminal, re-run `make n64-dist`
- From your first terminal, cd back into the repository root and run `ucon64 --n64 --chk scummvm/scummscummvm.v64` until ucon64 reports **OK** on both Checksums
- Run the ROM with your emulator or copy it to your FlashCart

## Note about `make tentacle`

Don't worry if **scc** throws `cp: cannot stat 'tentacle.sou': No such file or directory`. The game doesn't use it and the build should still have succeeded.


## How my title tries to adhere to the theme:

The theme is "Repair" and my game is all about repairing things, be it physical items or disrupted relationships.

The full version of my game will see the protagonist repair a bridge to the other side of the river, fix a friendship that fell apart over the destruction of a special item, as well as see the repair of said item.

Unfortunately, I wasn't able to work on this entry for more than a week out of the entire 64Brew submission period due to my dire private situation.

If you'd like to see more of my work, check out my [YouTube](https://youtube.com/@markbauermeister5449).