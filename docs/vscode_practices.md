# Working with VSCode

## Install your favorite extensions

```bash
$ code --list-extensions | xargs -L 1 echo code --install-extension
code --install-extension bierner.markdown-mermaid
code --install-extension bierner.markdown-preview-github-styles
code --install-extension charliermarsh.ruff
code --install-extension davidanson.vscode-markdownlint
code --install-extension eamodio.gitlens
code --install-extension ecmel.vscode-html-css
code --install-extension formulahendry.code-runner
code --install-extension foxundermoon.shell-format
code --install-extension github.vscode-github-actions
code --install-extension gruntfuggly.todo-tree
code --install-extension jebbs.plantuml
code --install-extension jeff-hykin.better-shellscript-syntax
code --install-extension mads-hartmann.bash-ide-vscode
code --install-extension mechatroner.rainbow-csv
code --install-extension mhutchie.git-graph
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.debugpy
code --install-extension ms-python.mypy-type-checker
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-vscode.makefile-tools
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension mushan.vscode-paste-image
code --install-extension njpwerner.autodocstring
code --install-extension oderwat.indent-rainbow
code --install-extension pinage404.bash-extension-pack
code --install-extension ritwickdey.liveserver
code --install-extension rogalmic.bash-debug
code --install-extension rpinski.shebang-snippets
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension spmeesseman.vscode-taskexplorer
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension timonwong.shellcheck
code --install-extension yzhang.markdown-all-in-one
```

## Customize your settings.json

```json
{
    "workbench.iconTheme": "material-icon-theme",
    "files.insertFinalNewline": true,
    "files.trimFinalNewlines": true,
    "files.trimTrailingWhitespace": true,
    "editor.minimap.enabled": true,
    "editor.renderWhitespace": "all",
    "terminal.integrated.enableMultiLinePasteWarning": "never",
    "workbench.startupEditor": "none",
    "explorer.confirmDragAndDrop": false,
    "window.zoomLevel": 1,
    "editor.bracketPairColorization.enabled": true,
    "editor.guides.bracketPairs": true,
    "[shellscript]": {
        "files.eol": "\n",
        "editor.tabSize": 2
    },
    "[json]": {
        "editor.quickSuggestions": {
            "strings": true
        },
        "editor.suggest.insertMode": "replace",
        "editor.tabSize": 2
    }
}
```
