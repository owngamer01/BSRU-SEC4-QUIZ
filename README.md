# วิธีการใช้งาน

Clone จาก Github โดยใช้คำสั่ง

```bash
git clone https://github.com/owngamer01/BSRU-SEC5-AUTH.git
```

## การติดตั้งหลังจาก Clone เสร็จแล้ว

- ไปที่ root_path ที่เรา Clone มา
- จากนั้นใช้คำสั่ง flutter pub get เพื่อโหลด plugin dependency

#### ตัวอย่าง
```bash
c:\workspace\quiz_app\flutter pub get
```

## วิธีการ Run
1. เลือก Emulator ที่เราจะใช้รันจากมุมขวาล่างของ Vscode
2. คลิกขวาที่ ไฟล์ main.dart เลือก Start debugging หรือ (กด F5)

## วิธีเปิด Developer mode
 ถ้าใครจะใช้ มือถือส่วนตัวในการ Run ให้เปิด Developer mode ก่อน ซึ่งมือถือ Android แต่ละรุ่นจะมีที่เปิดไม่เหมือนกัน ถ้าเราไม่เปิด Vscode จะไม่สามารถเลือกตัวมือถือของเราเพื่อ Run ได้

1. ไปที่ตั้งค่ามือถือหา "เกี่ยวกับมือถือ (About Phone)"
2. ต่อไปให้คลิกย้ำๆ ประมาณ 5 ครั้งที่ "เลขรุ่น (Build Number)" จะมี popup เด้งขึ้นมาให้เห็น
3. จะมีเมนู Developer mode โผล่ขึ้นมา ให้เราเข้าไปเปิด 2 Option โดย 1 developer mode = ON และ 2 USB Debugging = ON
4. ทดสอบดูโดย เสียบสาย แล้ว ดูใน Vscode ว่าเห็นมือถือเราแล้วหรือยัง
5. หรือดูได้จาก [Link](https://www.youtube.com/watch?v=ohaH2BRTXDM)
