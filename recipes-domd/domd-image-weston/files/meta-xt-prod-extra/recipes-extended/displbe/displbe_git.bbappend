################################################################################
# Renesas R-Car
################################################################################
SRCREV_rcar = "e3ea5359b6976bee38956d01899fc5fc2ebdbc00" tag/v0.2.1

SRC_URI_append_rcar = " git://github.com/xen-troops/displ_be.git;protocol=https;branch=master"

DEPENDS += " wayland-ivi-extension wayland-native"

EXTRA_OECMAKE_append_rcar = " -DWITH_DOC=OFF -DWITH_DRM=ON -DWITH_ZCOPY=ON -DWITH_WAYLAND=ON -DWITH_IVI_EXTENSION=ON -DWITH_INPUT=ON"
