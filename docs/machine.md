# Machine

## Raspberry Pi

cf. [ラズベリーパイの環境チェック いろいろ](https://wisteriahill.sakura.ne.jp/CMS/WordPress/2018/09/06/check-raspbian/#OS)

### Hardware model

```bash
$ cat /proc/device-tree/model
Raspberry Pi 3 Model B Plus Rev 1.3
```

### Pin

cf.

- [pinout - Raspberry Piのピンの情報などを表示する](https://raspi.taneyats.com/entry/command-pinout)
- [Raspberry Pi Pinout](https://pinout.xyz/)
- [Raspberry PiのGPIOピン配置を確認する](https://www.bioerrorlog.work/entry/raspberry-pi-pinout)
- [Raspberry PiのGPIOピンの概要](https://osoyoo.com/ja/2015/10/04/how-to-read-raspberry-pi-io-pin-diagram-gpio-pin-graph/)

Install the following packages:

```bash
sudo apt-get update
sudo apt-get install python3-gpiozero
```

Run the following command:

```bash
$  pinout
,--------------------------------.
| oooooooooooooooooooo J8     +====
| 1ooooooooooooooooooo  PoE   | USB
|  Wi                    1o   +====
|  Fi  Pi Model 3B+ V1.3 oo      |
|        ,----.               +====
| |D|    |SoC |               | USB
| |S|    |    |               +====
| |I|    `----'                  |
|                   |C|     +======
|                   |S|     |   Net
| pwr        |HDMI| |I||A|  +======
`-| |--------|    |----|V|-------'

Revision           : a020d3
SoC                : BCM2837
RAM                : 1GB
Storage            : MicroSD
USB ports          : 4 (of which 0 USB3)
Ethernet ports     : 1 (300Mbps max. speed)
Wi-fi              : True
Bluetooth          : True
Camera ports (CSI) : 1
Display ports (DSI): 1

J8:
   3V3  (1) (2)  5V
 GPIO2  (3) (4)  5V
 GPIO3  (5) (6)  GND
 GPIO4  (7) (8)  GPIO14
   GND  (9) (10) GPIO15
GPIO17 (11) (12) GPIO18
GPIO27 (13) (14) GND
GPIO22 (15) (16) GPIO23
   3V3 (17) (18) GPIO24
GPIO10 (19) (20) GND
 GPIO9 (21) (22) GPIO25
GPIO11 (23) (24) GPIO8
   GND (25) (26) GPIO7
 GPIO0 (27) (28) GPIO1
 GPIO5 (29) (30) GND
 GPIO6 (31) (32) GPIO12
GPIO13 (33) (34) GND
GPIO19 (35) (36) GPIO16
GPIO26 (37) (38) GPIO20
   GND (39) (40) GPIO21

POE:
TR01 (1) (2) TR00
TR03 (3) (4) TR02

For further information, please refer to https://pinout.xyz/
```

### OS

cf. [Raspberry Pi OS - Raspberry Pi Documentation](https://www.raspberrypi.com/documentation/computers/os.html)

```bash
$ lsb_release -a
No LSB modules are available.
Distributor ID: Raspbian
Description:    Raspbian GNU/Linux 10 (buster)
Release:        10
Codename:       buster
```

```bash
$ cat /etc/os-release
PRETTY_NAME="Raspbian GNU/Linux 10 (buster)"
NAME="Raspbian GNU/Linux"
VERSION_ID="10"
VERSION="10 (buster)"
VERSION_CODENAME=buster
ID=raspbian
ID_LIKE=debian
HOME_URL="http://www.raspbian.org/"
SUPPORT_URL="http://www.raspbian.org/RaspbianForums"
BUG_REPORT_URL="http://www.raspbian.org/RaspbianBugs"
```

### Kernel

```bash
$ uname -a
Linux togikai34 5.10.103-v7+ #1529 SMP Tue Mar 8 12:21:37 GMT 2022 armv7l GNU/Linux
```

### CPU

デフォルトの設定、または/boot/config.txtで指定された値を取得。

```bash
$ vcgencmd get_config arm_freq
arm_freq=1400
# 1.4GHz
```

実際の周波数を取得。

```bash
$ vcgencmd measure_clock arm
frequency(48)=700074000
# 700.074MHz
```

負荷の高い処理の場合、クロック数は上昇し、設定最高温度に近づくと低下するようです。

Core:

```bash
$ nproc
4
```

CPU情報 動作周波数を取得

```bash
$ cpufreq-info -o
          minimum CPU frequency  -  maximum CPU frequency  -  governor
CPU  0      1400000 kHz (100 %)  -    1400000 kHz (100 %)  -  ondemand
CPU  1      1400000 kHz (100 %)  -    1400000 kHz (100 %)  -  ondemand
CPU  2      1400000 kHz (100 %)  -    1400000 kHz (100 %)  -  ondemand
CPU  3      1400000 kHz (100 %)  -    1400000 kHz (100 %)  -  ondemand
```

リアルタイムで動作クロックを確認

```bash
Every 2.0s: vcgencmd measure_clock arm                             togikai34: Wed Aug 14 22:51:23 2024

frequency(48)=1400000000
```

### Voltage

Displays the current voltages used by the specific block. Accepts the following block values:

| block | Description |
|----|-----|
| core | VC4 core voltage |
| sdram_c | SDRAM Core Voltage |
| sdram_i | SDRAM I/O voltage |
| sdram_p | SDRAM Phy Voltage |

```bash
$  vcgencmd measure_volts core
volt=1.3375V
$  vcgencmd measure_volts sdram_c
volt=1.2500V
$  vcgencmd measure_volts sdram_i
volt=1.2500V
$  vcgencmd measure_volts sdram_p
volt=1.2250V
```

### Internal Temperature

Case1:

```bash
$ cat /sys/class/thermal/thermal_zone0/temp
52078
# 52.078 degree
```

Case 2:

cf. [vcgencmd - Raspberry Pi Documentation](https://www.raspberrypi.com/documentation/computers/os.html#vcgencmd)

Returns the temperature of the SoC as measured by its internal temperature sensor. On Raspberry Pi 4,
 measure_temp pmic returns the temperature of the PMIC.

```bash
$  vcgencmd measure_temp
temp=49.9'C
```

### Disk space usage

```bash
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        29G  6.1G   23G  22% /
devtmpfs        404M     0  404M   0% /dev
tmpfs           436M     0  436M   0% /dev/shm
tmpfs           436M  6.0M  430M   2% /run
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           436M     0  436M   0% /sys/fs/cgroup
/dev/mmcblk0p1  253M   50M  203M  20% /boot
tmpfs            88M   16K   88M   1% /run/user/1000
```

### Swap

swapが頻発するとNAND型のMicroSDは寿命が縮むという話があるらしい。

32GBくらいあれば、エンデュランス・リテンションの両方でそんなに心配する必要ないみたいです。MicroSDの寿命の前にラズパイの賞味期限が切れるような気がする。心配ならデータのバックアップしときましょう。更に、そんなに高いもんじゃないんだからラズパイ自体のクローンを作っておくという手もあるかもしれません。

```bash
$ free
              total        used        free      shared  buff/cache   available
Mem:         892584      176164      195308        6988      521112      654904
Swap:        102396           0      102396
```

cf. [【ITエンジニアの豆知識】メモリの SWAP、ホントに理解してる…？](https://beyondjapan.com/blog/2022/01/mame_swap/)

### Display Resolution

- Default 720x480
- Updated: DMT mode 82 1920x1080 60Hz 16:9

## shell

```bash
$ echo $SHELL
/bin/bash
```

Create ~/.bashrc and ~/.bash_aliases.

## git

```bash
$ git --version
git version 2.20.1
```

## Python

Default: Python 3.7.3

```bash
$ python -V
Python 3.7.3
```

Python2

```bash
$ python2 -V
Python 2.7.16
```

Python3

```bash
$ python3 -V
Python 3.7.3
```

## Default Projects

```bash
$ tree ~/projects/ -L 1
/home/pi/projects/
├── bno055-python-i2c
├── donkeycar
├── mycar
├── pytorch-armv7l-main
└── togikaidrive
```

Two main projects are available.

1. togikaiaidrive
2. donkeycar
   - mycar
   - donkeycar

### Donkey car

```bash
$ tree ~/mycar/
/home/pi/mycar/
├── calibrate.py
├── config.py
├── data
├── logs
├── manage.py
├── models
├── myconfig.py
└── train.py
```

| File name    | Description |
|--------------|--------------------------|
| calibrate.py | Scripts to drive a donkey 2 car. |
| config.py    | CAR CONFIG |
| manage.py    | Scripts to drive a donkey 2 car. |
| myconfig.py  | My CAR CONFIG |
| train.py     | Scripts to train a keras model using tensorflow. |
