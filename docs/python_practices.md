# Working with Python

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
