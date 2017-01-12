FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://0001-stmmac-adding-support-for-platform-IOT2000.patch \
    file://0002-serial-uapi-Add-support-for-bus-termination.patch \
    file://0003-serial-8250_pci-Use-symbolic-constants-for-EXAR-s-MP.patch \
    file://0004-serial-8250_pci-Fix-EXAR-feature-control-register-co.patch \
    file://0005-serial-8250_pci-Add-support-for-IOT2000-platform.patch \
    file://0006-serial-8250_pci-Add-support-for-accessing-red-LED-vi.patch \
    file://0007-efi-Add-capsule-update-support.patch \
    file://0008-efi-Add-misc-char-driver-interface-to-update-EFI-fir.patch \
    file://0009-efi-capsule-Make-efi_capsule_pending-lockless.patch \
    file://0010-efi-capsule-Move-capsule-to-the-stack-in-efi_capsule.patch \
    file://0011-efi-capsule-Allocate-whole-capsule-into-virtual-memo.patch"

LINUX_VERSION_iot2000 = "${LINUX_VERSION_INTEL_COMMON}"
COMPATIBLE_MACHINE_iot2000 = "iot2000"
KMACHINE_iot2000 = "intel-quark"
KBRANCH_iot2000 = "${KBRANCH_INTEL_COMMON}"
SRCREV_meta_iot2000 ?= "${SRCREV_META_INTEL_COMMON}"
SRCREV_machine_iot2000 ?= "${SRCREV_MACHINE_INTEL_COMMON}"
KERNEL_FEATURES_append_iot2000 = ""
