#!/system/bin/sh
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

mode=`getprop ro.bootmode`
case "$mode" in
	"mot-charger")
        echo 2 > /sys/module/lpm_levels/enable_low_power/l2
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu2/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu3/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_show_resume_irq/parameters/debug_mask
        echo 0 > /sys/devices/system/cpu/cpu1/online
        echo 0 > /sys/devices/system/cpu/cpu2/online
        echo 0 > /sys/devices/system/cpu/cpu3/online
        echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        chown root.system /sys/devices/system/cpu/cpu1/online
        chown root.system /sys/devices/system/cpu/cpu2/online
        chown root.system /sys/devices/system/cpu/cpu3/online
        chmod 664 /sys/devices/system/cpu/cpu1/online
        chmod 664 /sys/devices/system/cpu/cpu2/online
        chmod 664 /sys/devices/system/cpu/cpu3/online
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
        echo mem > /sys/power/autosleep

        echo 0 > /sys/class/android_usb/android0/enable
        echo 22B8 > /sys/class/android_usb/android0/idVendor
        echo 2EB7 > /sys/class/android_usb/android0/idProduct
        echo mass_storage > /sys/class/android_usb/android0/functions
        echo 1 > /sys/class/android_usb/android0/enable

        /system/bin/charge_only_mode

	echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	echo 3 > /sys/module/lpm_levels/enable_low_power/l2
	echo 255 >/sys/class/leds/lcd-backlight/brightness
	echo 0 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
	echo 1 > /sys/devices/system/cpu/cpu1/online
	echo 1 > /sys/devices/system/cpu/cpu2/online
	echo 1 > /sys/devices/system/cpu/cpu3/online
	;;
esac
