[![Build status](https://github.com/lmapii/practical-zephyr-manifest-repository/workflows/ci/badge.svg)](https://github.com/lmapii/practical-zephyr-manifest-repository/actions)

# Manifest repository for a T2 star topology West workspace application

This is the example repository for the blog post on West workspaces of the "Practical Zephyr" blog series. It's a _manifest repository_ that also contains the application's sources and thus creates a workspace with a ["T2 star topology"](https://docs.zephyrproject.org/latest/develop/west/workspaces.html#topologies-supported).

Refer to Zephyr's own [example workspace application](https://github.com/zephyrproject-rtos/example-application) for a more elaborate example.

## General usage

The following commands show how to build this application, assuming that the [Zephyr SDK](https://docs.zephyrproject.org/latest/develop/toolchains/zephyr_sdk.html) and [host tools](https://docs.zephyrproject.org/latest/develop/getting_started/index.html#install-dependencies) are installed:

```bash
$ mkdir workspace
$ cd workspace
workspace $ west init -m git@github.com:lmapii/practical-zephyr-manifest-repository.git
workspace $ west update -o=--depth=1 -n
workspace $ west build app --pristine --board nrf52840dk_nrf52840
workspace $ west build app --pristine --board nucleo_f411re
```

The configured [GitHub action](.github/workflows/ci.yml) also periodically builds the applications using [Zephyr's official docker image](https://github.com/zephyrproject-rtos/docker-image).

## nRF specific initialization

Instead of using "vanilla Zephyr", this repository also contains a dedicated [manifest file for the nRF Connect SDK](west-sdk-nrf.yml):

```bash
$ mkdir workspace
$ cd workspace
workspace $ west init -m git@github.com:lmapii/practical-zephyr-manifest-repository.git --mf west-sdk-nrf.yml
workspace $ west update -o=--depth=1 -n
workspace $ west build app --pristine --board nrf52840dk_nrf52840
```

Nordic also has their own [example application](https://github.com/nrfconnect/ncs-example-application).
