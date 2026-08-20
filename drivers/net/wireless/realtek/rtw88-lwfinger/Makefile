# SPDX-License-Identifier: GPL-2.0-only

ccflags-y += -std=gnu11
ccflags-y += -Wno-declaration-after-statement
ccflags-y += -D__CHECK_ENDIAN__

ccflags-$(CONFIG_RTW88_LEDS) += -DCONFIG_RTW88_LEDS=1
ccflags-$(CONFIG_RTW88_DEBUG) += -DCONFIG_RTW88_DEBUG=1
ccflags-$(CONFIG_RTW88_DEBUGFS) += -DCONFIG_RTW88_DEBUGFS=1

# Core module
obj-$(CONFIG_RTW88_CORE) += rtw_core.o
rtw_core-objs := main.o \
		   led.o \
		   mac80211.o \
		   util.o \
		   debug.o \
		   tx.o \
		   rx.o \
		   mac.o \
		   phy.o \
		   coex.o \
		   efuse.o \
		   fw.o \
		   ps.o \
		   sec.o \
		   bf.o \
		   regd.o \
		   sar.o
rtw_core-$(CONFIG_PM)      += wow.o

# Chip family common code (each as separate module)
obj-$(CONFIG_RTW88_8703B)  += rtw_8703b.o
rtw_8703b-y := rtw8703b.o rtw8703b_tables.o

obj-$(CONFIG_RTW88_8723D)  += rtw_8723d.o
rtw_8723d-y := rtw8723d.o rtw8723d_table.o

obj-$(CONFIG_RTW88_8723X)  += rtw_8723x.o
rtw_8723x-y := rtw8723x.o

obj-$(CONFIG_RTW88_8812A)  += rtw_8812a.o
rtw_8812a-y := rtw8812a.o rtw8812a_table.o

obj-$(CONFIG_RTW88_8814A)  += rtw_8814a.o
rtw_8814a-y := rtw8814a.o rtw8814a_table.o

obj-$(CONFIG_RTW88_8821A)  += rtw_8821a.o
rtw_8821a-y := rtw8821a.o rtw8821a_table.o

obj-$(CONFIG_RTW88_8821C)  += rtw_8821c.o
rtw_8821c-y := rtw8821c.o rtw8821c_table.o

obj-$(CONFIG_RTW88_8822B)  += rtw_8822b.o
rtw_8822b-y := rtw8822b.o rtw8822b_table.o

obj-$(CONFIG_RTW88_8822C)  += rtw_8822c.o
rtw_8822c-y := rtw8822c.o rtw8822c_table.o

obj-$(CONFIG_RTW88_88XXA)  += rtw_88xxa.o
rtw_88xxa-y := rtw88xxa.o

obj-$(CONFIG_RTW88_USB)    += rtw_usb.o
rtw_usb-y := usb.o

# USB‑attached device modules
obj-$(CONFIG_RTW88_8723DU) += rtw_8723du.o
rtw_8723du-y := rtw8723du.o

obj-$(CONFIG_RTW88_8812AU) += rtw_8812au.o
rtw_8812au-y := rtw8812au.o

obj-$(CONFIG_RTW88_8814AU) += rtw_8814au.o
rtw_8814au-y := rtw8814au.o

obj-$(CONFIG_RTW88_8821AU) += rtw_8821au.o
rtw_8821au-y := rtw8821au.o

obj-$(CONFIG_RTW88_8821CU) += rtw_8821cu.o
rtw_8821cu-y := rtw8821cu.o

obj-$(CONFIG_RTW88_8822BU) += rtw_8822bu.o
rtw_8822bu-y := rtw8822bu.o

obj-$(CONFIG_RTW88_8822CU) += rtw_8822cu.o
rtw_8822cu-y := rtw8822cu.o
