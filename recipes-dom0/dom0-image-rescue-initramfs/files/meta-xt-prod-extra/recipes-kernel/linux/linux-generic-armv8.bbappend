FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

BRANCH = "master"

SRCREV = "d6ea261d10b1f7eac577210761b7b7ce9f5f29d6" tag/v4.14/rcar-3.6.2-xt0.1

SRC_URI_append = " \
    git://github.com/xen-troops/linux.git;branch=${BRANCH} \
    file://defconfig \
  "

###############################################################################
# Salvator-X M3
###############################################################################
SRC_URI_append_salvator-x-m3-xt = " \
    file://r8a7796-salvator-x-dom0.dts;subdir=git/arch/${ARCH}/boot/dts/renesas \
"

KERNEL_DEVICETREE_salvator-x-m3-xt = " \
    renesas/r8a7796-salvator-x-dom0.dtb \
"

###############################################################################
# Salvator-X H3
###############################################################################
SRC_URI_append_salvator-x-h3-xt = " \
    file://r8a7795-salvator-x-dom0.dts;subdir=git/arch/${ARCH}/boot/dts/renesas \
"

KERNEL_DEVICETREE_salvator-x-h3-xt = " \
    renesas/r8a7795-salvator-x-dom0.dtb \
"

do_deploy_append() {
    for DTB in ${KERNEL_DEVICETREE}
        do
              DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
              DTB_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
              DTB_SYMLINK_NAME=`echo ${DTB_NAME##*-}`
              ln -sfr ${DEPLOYDIR}/${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
        done
}

