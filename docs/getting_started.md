# Getting Started

## Setup Machine

cf. [Getting started with your Raspberry Pi](https://www.raspberrypi.com/documentation/computers/getting-started.html)

### Install an Operating System

### Configuration on first boot

#### Bluetooth

#### Locale

#### Users

#### Wi-Fi

#### Browser

#### Raspberry Pi connect

#### Software Updates

```bash
sudo apt update
sudo apt upgrade -y
```

## GitHub

### Connect with SSH

cf. [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

Generating a new SSH key and adding it to the ssh-agent.

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Adding your SSH key to the ssh-agent.

```bash
eval "$(ssh-agent -s)"
```

Adding a new SSH key to your account.

```bash
cat ~/.ssh/id_ed25519.pub
```

## Tools

### ripgrep

```bash
sudo apt install ripgrep
```

### Tree

```bash
sudo apt install tree
```
