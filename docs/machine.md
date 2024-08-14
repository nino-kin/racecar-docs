# Machine

## Raspberry Pi

cf. [ラズベリーパイの環境チェック いろいろ](https://wisteriahill.sakura.ne.jp/CMS/WordPress/2018/09/06/check-raspbian/#OS)

### Hardware model

```bash
$ cat /proc/device-tree/model
Raspberry Pi 3 Model B Plus Rev 1.3
```

### OS

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

### Internal Temperature

CPU

```bash
$ cat /sys/class/thermal/thermal_zone0/temp
52078
# 52.078 degree
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
