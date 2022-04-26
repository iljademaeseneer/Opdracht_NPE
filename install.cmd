@echo off

:: Automated Kali & Metasploitable VM install using VBoxManage

:: Kali VM install

::create new VM kali
VBoxManage createvm --name kali --register
::set Type Linux and version 32-bit
VBoxManage modifyvm kali --ostype Linux_32
::set RAM and vRAM
VBoxManage modifyvm kali --memory 2048 --vram 32
::set number of CPU cores
VBoxManage modifyvm kali --cpus 1
::create storage controller
VBoxManage storagectl kali --name "SATA Controller" --add sata --controller IntelAHCI
::attach OSBoxes kali VDI
VBoxManage storageattach kali --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "C:\Users\Ilja\Desktop\Opdracht_NPE\kali.vdi"
::attach first NIC (NAT)
VBoxManage modifyvm kali --nic1 nat --nictype1 82540EM
::attach second NIC (hostonly)
VBoxManage modifyvm kali --nic2 hostonly
::start VM
vboxmanage startvm kali


:: Metasploitable VM install

::create new VM metasploitable
VBoxManage createvm --name metasploitable --register
::set Type Linux and version 32-bit
VBoxManage modifyvm metasploitable --ostype Linux_32
::set RAM and vRAM
VBoxManage modifyvm metasploitable --memory 2048 --vram 32
::set graphicscontroller
VBoxManage modifyvm metasploitable --graphicscontroller vmsvga
::set number of CPU cores
VBoxManage modifyvm metasploitable --cpus 1
::create storage controller
VBoxManage storagectl metasploitable --name "SATA Controller" --add sata --controller IntelAHCI
::attach OSBoxes kali VDI
VBoxManage storageattach metasploitable --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "C:\Users\Ilja\Desktop\Opdracht_NPE\Metasploitable2-Linux\Metasploitable.vmdk"
::attach NIC (hostonly)
VBoxManage modifyvm metasploitable --nic1 hostonly
::start VM
vboxmanage startvm metasploitable