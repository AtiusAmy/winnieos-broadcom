#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# Use a COPR Example:
dnf5 remove -y slimbook-meta-gnome slimbook-service python3-slimbook libslimbook1 --noautoremove
dnf5 install -y iwd

## what if we switched to iwd? 
cat > output.txt <<EOF
[device]
wifi.backend=iwd
EOF

#systemctl unmask iwd
systemctl enable iwd

# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File