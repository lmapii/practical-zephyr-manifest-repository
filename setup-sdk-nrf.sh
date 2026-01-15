#!/bin/sh

ncs_install_dir="${ncs_install_dir:-/opt/nordic/ncs}"
ncs_sdk_version="${ncs_sdk_version:-v3.2.1}"
ncs_bin_version="${ncs_bin_version:-322ac893fe}"

paths=(
    $ncs_install_dir/toolchains/$ncs_bin_version/bin
    $ncs_install_dir/toolchains/$ncs_bin_version/opt/nanopb/generator-bin
)

# required if dependencies are not installed, see also
# https://docs.zephyrproject.org/latest/develop/getting_started/index.html#install-dependencies
# e.g., "Ninja"
for entry in ${paths[@]}; do
    export PATH=$PATH:$entry
done

# use the nrfutil installation from the toolchain installation
export NRFUTIL_HOME=$ncs_install_dir/toolchains/$ncs_bin_version/nrfutil/home

# only export the paths to the SDK, no longer export the path to the zephyr installation.
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR=$ncs_install_dir/toolchains/$ncs_bin_version/opt/zephyr-sdk
