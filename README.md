# Ubuntu 22.04 Base image

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

## Acknowledgements

<table>
  <tr>
    <td>![EU](figures/EU.jpg "EU emblem")</td>
    <td>
This software and accompanying documentation is part of a [project](https://cybersec4europe.eu) that has received funding from the European Union’s Horizon 2020 research and innovation programme under grant agreement No. 830929.
</td>
 </table>
