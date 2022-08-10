---
author: in
date: 2015-04-01 08:42:33+00:00
draft: false
title: วิธีติดตั้ง VPN ใช้ส่วนตัวใน VPS [Linux] ภายใน 3 นาที
type: post
url: /2015/04/howto-setup-vpn-in-vps/
categories:
- Programmer Zone
tags:
- digitalocean
- vpn
---

เนื่องจากปิดเทอมและว่างโคตร ไม่มีอะไรทำเช่นเดิม เมื่อวานเลยติดตั้ง VPN เล่นๆโดยหาวิธีติดทั้งให้เร็วที่สุด โดยที่ผมทำใช้เวลาจริงๆไม่น่าเกิน 3 นาที [ไม่รวมติดตั้งโปรแกรม Open VPS ในคอมหรือมือถือนะครับ] มาเริ่มกันเลย

<!-- more -->

ก่อนอื่นขออธิบายศัพท์เพื่อคนไม่รู้นะครับ



 	  * VPN คือ Virtual Private Network เป็นระบบเน็ตเวิคส่วนตัว
 	  * VPS คือ Virtual Private Server เป็นเซิฟเวอร์เสมือนส่วนตัว

เซิฟเวอร์ที่ผมใช้วันนี้ก็เป็น [DigitalOcean](https://www.cyruszh.com/digital-ocean-high-quality-vps/) เจ้าเก่าครับ ซึ่งถ้าใคร [สมัครผ่านลิงค์ของผมตรงนี้](https://goo.gl/FQYxBV) แล้วเติมเงินครั้งแรกที่ $25 จะได้รับเพิ่มอีก $10 รวมเป็น $35 ครับ

![digitalocean](https://www.cyruszh.com/wp-content/uploads/2013/12/digitalocean-1.jpg)


1.ขั้นแรกสร้าง Droplet ตั้ง ค่าตามต้องการ ใช้ปฏิบัติการเป็น Ubuntu ครับ อยากให้ VPN ไปประเทศไหนก็ตั้งค่าได้เลย มีสี่ประเทศ ห้าแห่ง ในที่นี้ผมเลือกเป็น New York ครับ

![1](https://www.cyruszh.com/wp-content/uploads/2015/04/1.jpg)


2. เสร็จแล้วก็กด Create Droplet แล้วรอสักประมาณ 40 วิก็เช็คเมลล์จะได้ ที่อยู่ IP และรหัสผ่านมาครับ

3.ใช้โปรแกรม Putty [[ดาวน์โหลดได้ที่นี้](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)] Remote เข้าไปโดยใช้ IP และรหัสที่ได้จากเมลล์ เข้าครั้งแรกมันจะบังคับเปลี่ยนรหัสก็เปลี่ยนไปตามมันครับ [รหัสผ่านจะไม่ขึ้นเป็นตัวหนังสือนะครับ]

4.Copy สิ่งที่อยู่ในเครื่องหมายอัญประกาศต่อไปนี้ "wget git.io/vpn --no-check-certificate -O openvpn-install.sh; bash openvpn-install.sh" แล้วคลิกขวากด Enter ใน Putty แล้วทำตามวิธีมันครับ สคริปจะถามว่าจะใช้ Port อะไร ใช้ DNS ที่ไหน เลือกๆตามใจชอบครับ

5.ตั้งค่าเสร็จแล้วจะได้ไฟล์ใน .ovpn มาที่ root ครับ เราต้องนำไฟล์นี้มาไว้ที่เครื่องคอมหรือมือถือเราเพื่อต่อ VPN ครับ เนื่องจากผมต้องการความรวดเร็วและไม่ต้องการติดตั้ง FTP หรืออะไรให้เสียเวลา ผมใช้วิธีเปลี่ยนเป็นไฟล์ตัวหนังสือแล้วก็อปมาที่เครื่องเซฟใหม่ครับ [ฉลาดจริงๆ #โดนตบ] ทำได้โดยการพิม์ cat "ชื่อไฟล์.ovpn" จะได้เนื้อหาในไฟล์เป็นตัวหนังสือออกมา

6.คลิกขวาที่ Taskbar putty แล้ว Copy all to clipboard ไปวางใน Notepad ครับ ลบส่วนที่เกินออกมา แล้วเซฟใหม่ชื่อเดิม .ovpn ครับ [ระวังอย่าให้มี .txt ตามมานะครับ] มีภาพประกอบตอนผมทำดูได้ด้านล่าง ![2](https://www.cyruszh.com/wp-content/uploads/2015/04/2.jpg)


7.จบในส่วนของ Server ครับ จากนั้นติดตั้งโปรแกรม Open VPN ที่เครื่องของเรา [[ดาวน์โหลดที่ลิงค์นี้](https://openvpn.net/index.php/open-source/downloads.html)] โปรแกรมมีใน iPhone และ มือถือ Android ด้วยนะครับ โหลดได้ใน App&Play Store แต่ในที่นี้จะพูดถึงติดตั้งในคอมพิวเตอร์ก่อน

8. ก็อปปี้ไฟล์ที่เซฟเป็น .ovpn ไปวางไว้ในโฟลเดอร์ config ในโปรแกรม Open VPN ![12](https://www.cyruszh.com/wp-content/uploads/2015/04/12-1.jpg)


9.คลิกขวาโปรแกรม Open VPN ที่ Taskbar กด Connect แล้วรอเป็นอันเสร็จวิธี ถ้าต่อติดจะกลายเป็นสีเขียว และมีข้อความขึ้นครับ แบบด้านล่างนี้

![taskbar-tray](https://www.cyruszh.com/wp-content/uploads/2015/04/taskbar-tray.png)


สำหรับใครไม่อยากใช้ Script เกลียดความสะดวกสบาย สามารถทำเองแบบ Step by Step ได้ด้วยความยาวระดับ สิบหน้ากระดาษ A3 ได้ที่[หน้านี้](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-ubuntu-14-04)นะครับ [พูดได้เลยว่าแค่เลื่อนลงไปยังเวียนหัวเลย]

สามารถทดสอบว่า DNS คุณทำงานได้ดีไหม [โดยไม่มี Transparent Proxy] โดยใช้ Extend Test ในเว็บ [https://www.dnsleaktest.com/](https://www.dnsleaktest.com/) ว่า DNS ที่ขึ้นตรงกับที่เราเลือกในตอนติดตั้งที่เซิฟเวอร์ไหมครับ ซึ่งถ้าไม่มีอะไรผิดพลาดก็จะตรงกันครับ :3

**และสุดท้ายนี้ใครมีคำถามเพิ่มเติมสามารถฝากไว้ที่กล่องคอมเมนท์ข้างล่าง[ซึ่งผมไม่ค่อยได้ตอบเพราะไม่มี Notification] หรือสามารถส่งอีเมลล์มาได้ที่ in@cyruszh.com ซึ่งผมยินดีตอบ และตอบทุกคนครับ**



***สคริปที่ผมใช้เป็นของคุณ NYR ที่ผมไปเจอในเว็บ [Github](https://github.com/Nyr/openvpn-install) ครับ
