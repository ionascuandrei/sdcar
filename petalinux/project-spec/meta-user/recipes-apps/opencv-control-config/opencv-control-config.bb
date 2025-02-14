#
# This file is the opencv-control-config recipe.
#

SUMMARY = "Simple opencv-control-config application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://prop.cfg \
	"

S = "${WORKDIR}"

do_install() {
	     install -d ${D}/home/root
	     install -m 0755 ${S}/prop.cfg ${D}/home/root
}

FILES_${PN} += "/home/root/prop.cfg"
