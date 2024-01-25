rm -rf ./.tmp
meson --buildtype release ./.tmp
ninja install -C ./.tmp
