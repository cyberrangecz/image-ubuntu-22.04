# Ubuntu 22.04 Base image

**NOTE: this is just a copy of Ubuntu 18.04 repo, which is unfinished**

**TODO: update boot command in ubuntu.json for 22.04**

This repo contains Packer files for building Ubuntu 22.04.1 LTS Jammy Jellyfish amd64 base image for QEMU/OpenStack and for VirtualBox/Vagrant using Gitlab CI/CD.

## Image for QEMU/OpenStack

There is one user account:

*  `ubuntu` created by [cloud-init](https://cloudinit.readthedocs.io/en/latest/), enabled for SSH

## Image for VirtualBox/Vagrant

There is one user account:

*  `vagrant` with password `vagrant`, enabled for SSH

## How to build

For information how to build this image see [wiki](https://gitlab.ics.muni.cz/muni-kypo-images/muni-kypo-images-wiki/-/wikis/How-to-build-an-image-locally).

## Known issues and requested features

See [issues](https://gitlab.ics.muni.cz/muni-kypo-images/ubuntu-22.04/-/issues).

## License

This project is licensed under the [MIT License](LICENSE).