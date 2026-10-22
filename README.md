# kickstart

Public bootstrap scripts for private setup repositories.

## Install the pi-suite extensions

Requires Pi, Node.js, Git, and SSH access to `ssweens/pi-suite` and any private extension repositories in its manifest.

```sh
curl -fsSL https://raw.githubusercontent.com/ssweens/kickstart/main/pi-suite.sh | bash
```

`pi-suite.sh` clones the private `pi-suite` repository over SSH and runs its installer. The extension manifest stays private; GitHub HTTPS package URLs are routed through SSH while Pi updates the extensions.
