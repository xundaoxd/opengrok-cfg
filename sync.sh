#!/bin/bash

prefix="src"
lst=(
    https://mirrors.tuna.tsinghua.edu.cn/git/linux.git
    https://mirrors.tuna.tsinghua.edu.cn/git/glibc.git
    https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio.git
    https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio-archiso.git
    https://github.com/iovisor/bcc.git
    https://github.com/iovisor/bpftrace.git
    https://github.com/libbpf/libbpf.git
    https://github.com/libbpf/libbpf-bootstrap.git
    https://github.com/libbpf/bpftool.git
    https://github.com/brendangregg/perf-tools.git
    https://github.com/google/glog.git
    https://git.suckless.org/dwm
    https://github.com/lakinduakash/linux-wifi-hotspot.git
    https://github.com/microsoft/GSL.git
    https://github.com/archcraft-os/archcraft.git

    https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git
    https://github.com/llvm/torch-mlir.git
    https://github.com/plaidml/tpp-mlir.git

    https://github.com/NVIDIA/open-gpu-kernel-modules.git
    https://github.com/NVIDIA/tensorflow.git
    https://github.com/NVIDIA/TensorRT.git
    https://github.com/NVIDIA/CUDALibrarySamples.git
    https://github.com/NVIDIA/cuda-samples.git
    https://github.com/NVIDIA/cutlass.git
    https://github.com/NVIDIA/thrust.git
    https://github.com/NVIDIA/cub.git
    https://github.com/KhronosGroup/Vulkan-Samples.git
    https://github.com/ROCm-Developer-Tools/HIP.git

    https://github.com/hughperkins/VeriGPU.git

    https://github.com/taskflow/taskflow.git
    https://github.com/pytorch/pytorch.git
    https://github.com/pytorch/vision.git
    https://github.com/onnx/onnx.git
    https://github.com/microsoft/onnxruntime.git
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
    for u in "${lst[@]}"; do
        do_sync $u
    done
}

main

