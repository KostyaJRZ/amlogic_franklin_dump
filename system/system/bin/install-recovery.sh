#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/recovery:16328704:286ba2b00200f71ce4800cada64061afbc3c1e90; then
  applypatch  EMMC:/dev/block/boot:9639936:abc7cace63f530b5a5360c64f01c42bc6dcf8cb2 EMMC:/dev/block/recovery 286ba2b00200f71ce4800cada64061afbc3c1e90 16328704 abc7cace63f530b5a5360c64f01c42bc6dcf8cb2:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
