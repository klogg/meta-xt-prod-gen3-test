require inc/xt_shared_env.inc

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

BRANCH = "master"
SRCREV = "d6ea261d10b1f7eac577210761b7b7ce9f5f29d6"

SRC_URI = " \
    git://github.com/xen-troops/linux.git;branch=${BRANCH} \
    file://defconfig \
  "

DEPLOYDIR="${XT_DIR_ABS_SHARED_BOOT_DOMF}"

do_deploy_append () {
    find ${D}/boot -iname "vmlinux*" -exec tar -cJvf ${STAGING_KERNEL_BUILDDIR}/vmlinux.tar.xz {} \;
}

