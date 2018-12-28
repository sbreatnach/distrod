###
Taken from the ever-excellent ArchLinux wiki - https://wiki.archlinux.org/index.php/MacBookPro8,1/8,2/8,3_%282011%29
###
During initial install, enable nomodeset as kernel boot option via grub

As part of distrod install:

/etc/grub.d/00_header

    set gfxmode=${GRUB_GFXMODE}
    outb 0x728 1
    outb 0x710 2
    outb 0x740 2
    outb 0x750 0
    load_video

/etc/defaults/grub

    GRUB_CMDLINE_LINUX="i915.modeset=1 i915.lvds_channel_mode=2"

Run

    sudo update-grub
