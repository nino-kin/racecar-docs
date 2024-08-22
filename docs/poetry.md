# Poetry

## Reference

- [Poetry documentation (ver. 1.1.6 日本語訳)](https://cocoatomo.github.io/poetry-ja/)
- [pyenv + poetry + tox + pytest 環境構築例 - Hasenpfote/python-poetry-example](https://github.com/Hasenpfote/python-poetry-example)

## Bash, Fish, Zshでの補完の有効化

`poetry` はBash, Fish, Zsh用の補完スクリプトの生成をサポートしています。 完全な詳細については `poetry help completions`sを参照してください。要点は簡単で、次のコマンドのどれか1つを使う、です:

```bash
# Bash
poetry completions bash > /etc/bash_completion.d/poetry.bash-completion

# Bash (Homebrew)
poetry completions bash > $(brew --prefix)/etc/bash_completion.d/poetry.bash-completion

# Fish
poetry completions fish > ~/.config/fish/completions/poetry.fish

# Fish (Homebrew)
poetry completions fish > (brew --prefix)/share/fish/vendor_completions.d/poetry.fish

# Zsh
poetry completions zsh > ~/.zfunc/_poetry

# Oh-My-Zsh
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry

# prezto
poetry completions zsh > ~/.zprezto/modules/completion/external/src/_poetry
```
