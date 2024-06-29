# Working with Python

## Build your development environment

### pyenv

You need to install the following packages for `pyenv`.

```bash
sudo apt update
sudo apt install build-essential libffi-dev libssl-dev zlib1g-dev liblzma-dev libbz2-dev \
  libreadline-dev libsqlite3-dev libopencv-dev tk-dev git
```

Clone `pyenv`.

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

Add necessary configuration to `.bashrc` (if you use zsh, please add them to `.zshrc`.)

```bash
echo '' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
source ~/.bashrc
```

Make sure `pyenv` has been successfully installed.

```bash
pyenv -v
```

Check the available python version.

```bash
pyenv install --list
```

If you install python 3.10.8, you just need to run as follows:

```bash
pyenv install 3.10.8
```

Check installed pyenv version.

```bash
pyenv versions
```

### venv

Create a virtual environment as follows:

```bash
python -m venv .venv
. .venv/bin/activate
```

If you exit virtual python env, you should run the following command:

```bash
deactivate
```

## FAQ

### Ubuntu Linux 22.04 LTSで、"python"コマンドがないと言われたら

Ubuntu Linux 22.04 LTS では python コマンドが見つからない。

```bash
$ python -V
Command 'python' not found, did you mean:
command 'python3' from deb python3
command 'python' from deb python-is-python3
```

この回避策として、次のコマンドを実行し`python-is-python3`をインストールする。

```bash
sudo apt install python-is-python3
```

```bash
$ python -V
Python 3.10.6
```
