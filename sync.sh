#!/bin/bash

prefix="src"
lst=(
    https://mirrors.tuna.tsinghua.edu.cn/git/linux.git
    https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git
    https://mirrors.tuna.tsinghua.edu.cn/git/glibc.git
    https://github.com/microsoft/GSL.git
    https://github.com/brendangregg/perf-tools.git
    https://github.com/taskflow/taskflow.git
    https://github.com/iovisor/bpf-docs.git
    https://github.com/iovisor/bcc.git
    https://github.com/iovisor/bpftrace.git
    https://github.com/libbpf/libbpf.git
    https://github.com/libbpf/libbpf-bootstrap.git
    https://github.com/libbpf/bpftool.git
    https://github.com/archcraft-os/archcraft.git
    https://github.com/NVIDIA/cutlass.git
    https://github.com/pytorch/vision.git
    https://git.suckless.org/dwm
    https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio.git
    https://github.com/llvm/torch-mlir.git
)

do_sync() {
    url=$1
    repo=`echo $url | cut -d'/' -f3-`
    if [ -d ${prefix}/$repo ]; then
        (cd ${prefix}/$repo && git pull)
    else
        git clone --depth 1 $url ${prefix}/$repo
    fi
}
main() {
    for u in ${lst[@]}; do
        do_sync $u
    done
}

main

