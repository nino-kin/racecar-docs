# Machine

## Raspberry Pi

### Hardware model

```bash
$ cat /proc/device-tree/model
Raspberry Pi 3 Model B Plus Rev 1.3
```

### OS

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

```bash
$ uname -a
Linux togikai34 5.10.103-v7+ #1529 SMP Tue Mar 8 12:21:37 GMT 2022 armv7l GNU/Linux
$ lsb_release -a
No LSB modules are available.
Distributor ID: Raspbian
Description:    Raspbian GNU/Linux 10 (buster)
Release:        10
```

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
```s

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


## For donkey car

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
