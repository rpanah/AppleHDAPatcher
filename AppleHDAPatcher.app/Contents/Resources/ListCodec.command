#!/bin/bash

# Maintained by: Mironeⓒ
# 
# PCI ids : https://github.com/pciutils/pciids 
# 
# Using in AppleHAPatcher.app to identify installed audio codecs
# 
# Mandatory Requirements:
# 1. AppleHDA.kext 
#
printf "Codecs Detecteds:\n\n" 
#
#  
# detect installed codecs for Vendor id.
ListCodec=$(ioreg -rxn IOHDACodecDevice | grep VendorID | awk '{ print $4 }' | sed -e 's/ffffffff//')
HDMInvidia=$(ioreg -rxn IOHDACodecDevice | grep VendorID | awk '{ print $4 }' | sed 's/ffffffff//' | grep '0x10de')
HDMIamd=$(ioreg -rxn IOHDACodecDevice | grep VendorID | awk '{ print $4 }' | sed 's/ffffffff//' | grep '0x1002')
HDMIintel=$(ioreg -rxn IOHDACodecDevice | grep VendorID | awk '{ print $4 }' | sed 's/ffffffff//' | grep '0x8086')


# no codecs detected.
if [[ -z "${ListCodec}" ]]; then
	printf "No audio codec detected!!"
exit 1
fi


for Codec in $ListCodec
do
case ${Codec} in
	#Desktop's.
          0x10ec0885)  Codec="Codec Name: Realtek ALC885\nVendor Id:  $Codec";;
          0x10ec0887)  Codec="Codec Name: Realtek ALC887\nVendor Id:  $Codec";;
      	  0x10ec0888)  Codec="Codec Name: Realtek ALC888\nVendor Id:  $Codec";;
      	  0x10ec0889)  Codec="Codec Name: Realtek ALC889\nVendor Id:  $Codec";;
          0x10ec0892)  Codec="Codec Name: Realtek ALC892\nVendor Id:  $Codec";;
          0x10ec0899)  Codec="Codec Name: Realtek ALC898\nVendor Id:  $Codec";;
          0x10ec0900)  Codec="Codec Name: Realtek ALC1150\nVendor Id: $Codec";;
	  0x11060441)  Codec="Codec Name: VT2021\nVendor Id:  $Codec";;
	#Laptop's.
	  0x10ec0233)  Codec="Codec Name: Realtek ALC233\nVendor Id:  $Codec";;
	  0x10ec0235)  Codec="Codec Name: Realtek ALC235\nVendor Id:  $Codec";;
	  0x10ec0255)  Codec="Codec Name: Realtek ALC255\nVendor Id:  $Codec";;
	  0x10ec0268)  Codec="Codec Name: Realtek ALC268\nVendor Id:  $Codec";;
	  0x10ec0269)  Codec="Codec Name: Realtek ALC269\nVendor Id:  $Codec";;
	  0x10ec0270)  Codec="Codec Name: Realtek ALC270\nVendor Id:  $Codec";;
	  0x10ec0272)  Codec="Codec Name: Realtek ALC272\nVendor Id:  $Codec";;
	  0x10ec0275)  Codec="Codec Name: Realtek ALC275\nVendor Id:  $Codec";;
	  0x10ec0280)  Codec="Codec Name: Realtek ALC280\nVendor Id:  $Codec";;
	  0x10ec0282)  Codec="Codec Name: Realtek ALC282\nVendor Id:  $Codec";;
	  0x10ec0283)  Codec="Codec Name: Realtek ALC283\nVendor Id:  $Codec";;
	  0x10ec0284)  Codec="Codec Name: Realtek ALC284\nVendor Id:  $Codec";;
	  0x10ec0288)  Codec="Codec Name: Realtek ALC288\nVendor Id:  $Codec";;
	  0x10ec0290)  Codec="Codec Name: Realtek ALC290\nVendor Id:  $Codec";;
	  0x10ec0663)  Codec="Codec Name: Realtek ALC663\nVendor Id:  $Codec";;
	  0x10ec0668)  Codec="Codec Name: Realtek ALC668\nVendor Id:  $Codec";;
	  0x14f15067)  Codec="Codec Name: Conexant 20583\nVendor Id:  $Codec";;
	  0x14f15069)  Codec="Codec Name: Conexant 20585\nVendor Id:  $Codec";;
	  0x14F1506C)  Codec="Codec Name: Conexant 20588\nVendor Id:  $Codec";;
	  0x14F1506E)  Codec="Codec Name: Conexant 20590\nVendor Id:  $Codec";;
	  0x14F1510F)  Codec="Codec Name: Conexant 20752\nVendor Id:  $Codec";;
	  0x14f15114)  Codec="Codec Name: Conexant 20756\nVendor Id:  $Codec";;
	  0x14f15115)  Codec="Codec Name: Conexant 20757\nVendor Id:  $Codec";;
	  0x111d76f3)  Codec="Codec Name: IDT 92HD66C3/65\nVendor Id:  $Codec";;
	  0x111d76b2)  Codec="Codec Name: IDT 92HD71B7X\nVendor Id:  $Codec";;
	  0x111d7608)  Codec="Codec Name: IDT 92HD75B2X5\nVendor Id:  $Codec";;
	  0x111D7603)  Codec="Codec Name: IDT 992HD75B3X5\nVendor Id:  $Codec";;
	  0x111d7605)  Codec="Codec Name: IDT 92HD87B1/92HD81B1X5\nVendor Id:  $Codec";;
	  0x111d76e0)  Codec="Codec Name: IDT 92HD91BXX\nVendor Id:  $Codec";;
	  0x111d76e5)  Codec="Codec Name: IDT 92HD99BXX\nVendor Id:  $Codec";;
	  0x11068446)  Codec="Codec Name: VIA VT1802\nVendor Id:  $Codec";;
	 #Mac Codecs
	  0x10134206)  Codec="Codec Name: Cirrus Logic CS4206\nVendor id:  $Codec";;
	  0x10134208)  Codec="Codec Name: Cirrus Logic CS4208\nVendor id:  $Codec";;
	  0x1AEC8800A) Codec="Codec Name: Cirrus Logic CS8409\nVendor id:  $Codec";;
	  0x10138409)  Codec="Codec Name: Wolfson WM8800\nVendor id:  $Codec";;
	  *)           Codec="Unknow onboard audio codec!!\nVendor id:  $Codec";;
  esac
done
printf "Onboard Audio Codec:\n$Codec\n\n"


for hdmi in $HDMInvidia
do
case ${hdmi} in
	#NVidia HDMI Codecs.
	  0x10de000a)  hdmi="Codec Name: NVidia GT216\nVendor id:  $hdmi";;
	  0x10de000b)  hdmi="Codec Name: NVidia GT216\nVendor id:  $hdmi";;
	  0x10de0e08)  hdmi="Codec Name: NVidia GF119\nVendor id:  $hdmi";;
	  0x10de0e0a)  hdmi="Codec Name: NVidia GK104\nVendor id:  $hdmi";;
	  0x10de0e0b)  hdmi="Codec Name: NVidia GK106\nVendor id:  $hdmi";;
	  0x10de0e0c)  hdmi="Codec Name: NVidia GF114\nVendor id:  $hdmi";;
	  0x10de0e1a)  hdmi="Codec Name: NVidia GK110\nVendor id:  $hdmi";;
	  0x10de0e1b)  hdmi="Codec Name: NVidia GK107\nVendor id:  $hdmi";;
	  0x10de0e08)  hdmi="Codec Name: NVidia GF119\nVendor id:  $hdmi";;
	  0x10de0be2)  hdmi="Codec Name: NVidia GT216\nVendor id:  $hdmi";;
	  *)           hdmi="Codec Name: Unknow HDMI audio codec\nVendor id:  $hdmi";;
  esac
done
for hdmi in $HDMIamd
do
	 case ${hdmi} in
	 #AMD HDMI Codecs.
	  0x10021308)  hdmi="Codec Name: AMD Kaveri HDMI/DP Audio Controller\nVendor id:  $hdmi";;
	  0x10021314)  hdmi="Codec Name: AMD Wrestler HDMI Audio\nVendor id:  $hdmi";;
	  0x10021714)  hdmi="Codec Name: AMD BeaverCreek HDMI Audio\nVendor id:  $hdmi";;
	  0x1002793b)  hdmi="Codec Name: AMD RS600 HDMI Audio\nVendor id:  $hdmi";;
	  0x1002960f)  hdmi="Codec Name: AMD RS780 HDMI Audio\nVendor id:  $hdmi";;
	  0x1002970f)  hdmi="Codec Name: AMD RS880 HDMI Audio\nVendor id:  $hdmi";;
	  0x10029840)  hdmi="Codec Name: AMD Kabini HDMI/DP Audio\nVendor id:  $hdmi";;
	  0x10029902)  hdmi="Codec Name: AMD Trinity HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aa00)  hdmi="Codec Name: AMD R600 HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aa08)  hdmi="Codec Name: AMD RV630 HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aa10)  hdmi="Codec Name: AMD RV610 HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aa18)  hdmi="Codec Name: AMD RV670/680 HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aa20)  hdmi="Codec Name: AMD RV635 HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aa28)  hdmi="Codec Name: AMD RV620 HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aa30)  hdmi="Codec Name: AMD RV770 HDMI Audio\n Vendor id:  $hdmi";;
	  0x1002aa38)  hdmi="Codec Name: AMD RV710/730 HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aa50)  hdmi="Codec Name: AMD Cypress HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aa58)  hdmi="Codec Name: AMD Juniper HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aa60)  hdmi="Codec Name: AMD Redwood HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aa68)  hdmi="Codec Name: AMD Cedar HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aa80)  hdmi="Codec Name: AMD Cayman/Antilles HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aa88)  hdmi="Codec Name: AMD Barts HDMI Audio\nVendor id:  $hdmi ";;
	  0x1002aa90)  hdmi="Codec Name: AMD Turks/Whistler HDMI Audio\n  id:  $hdmi";;
	  0x1002aa98)  hdmi="Codec Name: AMD Caicos HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aaa0)  hdmi="Codec Name: AMD Tahiti XT HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aac0)  hdmi="Codec Name: AMD Name: AMD Tobago HDMI Audio\nVendor id:  $hdmi";;
	  0x1002aac8)  hdmi="Codec Name: AMD Hawaii HDMI Audio\nVendor id:  $hdmi";;
	  *)           hdmi="Codec Name: Unknow HDMI audio codec\nVendor id:  $hdmi";;
  esac
done

for hdmi in $HDMIintel
do
case ${hdmi} in
	 #Intel HDMI Codecs.
	  0x80862807)  hdmi="Codec Name: Intel Haswell HDMI\nVendor id:  $hdmi";;
	  0x80862806)  hdmi="Codec Name: Intel Haswell HDMI\nVendor id:  $hdmi";;
	  *)           hdmi="Codec Name: Unknow HDMI audio codec\nVendor id:  $hdmi";;
  esac
done
printf "HDMI Audio Codec(s):\n$hdmi\n\n"


