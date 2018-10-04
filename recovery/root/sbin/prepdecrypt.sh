#!/sbin/sh

relink()
{
	fname=$(basename "$1")
	target="/sbin/$fname"
	sed 's|/system/bin/linker|///////sbin/linker|' "$1" > "$target"
	chmod 755 $target
}

finish()
{
	#umount /v
	umount /s
	#rmdir /v
	rmdir /s
	setprop crypto.ready 1
	exit 0
}

suffix=$(getprop ro.boot.slot_suffix)
if [ -z "$suffix" ]; then
	suf=$(getprop ro.boot.slot)
	suffix="_$suf"
fi
venpath="/dev/block/bootdevice/by-name/vendor$suffix"
mkdir /v
mount -t ext4 -o ro "$venpath" /v
syspath="/dev/block/bootdevice/by-name/system$suffix"
mkdir /s
mount -t ext4 -o ro "$syspath" /s

is_fastboot_twrp=$(getprop ro.boot.fastboot)
if [ ! -z "$is_fastboot_twrp" ]; then
	osver=$(getprop ro.build.version.release_orig)
	patchlevel=$(getprop ro.build.version.security_patch_orig)
	setprop ro.build.version.release "$osver"
	setprop ro.build.version.security_patch "$patchlevel"
	finish
fi

if [ -f /s/system/build.prop ]; then
	# TODO: It may be better to try to read these from the boot image than from /system
	osver=$(grep -i 'ro.build.version.release' /s/system/build.prop  | cut -f2 -d'=')
	patchlevel=$(grep -i 'ro.build.version.security_patch' /s/system/build.prop  | cut -f2 -d'=')
	setprop ro.build.version.release "$osver"
	setprop ro.build.version.security_patch "$patchlevel"
	finish
else
	# Be sure to increase the PLATFORM_VERSION in build/core/version_defaults.mk to override Google's anti-rollback features to something rather insane
	osver=$(getprop ro.build.version.release_orig)
	patchlevel=$(getprop ro.build.version.security_patch_orig)
	setprop ro.build.version.release "$osver"
	setprop ro.build.version.security_patch "$patchlevel"
	finish
fi

###### NOTE: The below is no longer used but I'm keeping it here in case it is needed again at some point!
mkdir -p /vendor/lib/hw/

relink /v/bin/qseecomd

cp /v/lib/libdiag.so /vendor/lib/
cp /v/lib/libdrmfs.so /vendor/lib/
cp /v/lib/libdrmtime.so /vendor/lib/
cp /v/lib/libGPreqcancel.so /vendor/lib/
cp /v/lib/libGPreqcancel_svc.so /vendor/lib/
cp /v/lib/libqdutils.so /vendor/lib/
cp /v/lib/libqisl.so /vendor/lib/
cp /v/lib/libqservice.so /vendor/lib/
cp /v/lib/libQSEEComAPI.so /vendor/lib/
cp /v/lib/librpmb.so /vendor/lib/
cp /v/lib/libSecureUILib.so /vendor/lib/
cp /v/lib/libssd.so /vendor/lib/
cp /v/lib/libtime_genoff.so /vendor/lib/
cp /v/lib/libkeymasterdeviceutils.so /vendor/lib/
cp /v/lib/libkeymasterprovision.so /vendor/lib/
cp /v/lib/libkeymasterutils.so /vendor/lib/
cp /v/lib/hw/gatekeeper.msm8953.so /vendor/lib/hw/
cp /v/lib/hw/keystore.msm8953.so /vendor/lib/hw/
cp /v/lib/hw/android.hardware.gatekeeper@1.0-impl-qti.so /vendor/lib/hw/
cp /v/lib/hw/android.hardware.keymaster@3.0-impl-qti.so /vendor/lib/hw/


relink /v/bin/hw/android.hardware.gatekeeper@1.0-service-qti
relink /v/bin/hw/android.hardware.keymaster@3.0-service-qti

finish
exit 0
