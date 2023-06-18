#!/bin/bash

prefix="src"
lst=(
    https://github.com/torvalds/linux.git@v5.15
    https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio.git
    https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio-archiso.git
    https://github.com/archlinux/archiso.git
    https://github.com/iovisor/bcc.git
    https://github.com/iovisor/bpftrace.git
    https://github.com/brendangregg/perf-tools.git
    https://github.com/libbpf/libbpf.git
    https://github.com/libbpf/libbpf-bootstrap.git
    https://github.com/libbpf/bpftool.git
    https://github.com/google/glog.git
    https://github.com/microsoft/GSL.git
    https://github.com/jemalloc/jemalloc.git
    https://github.com/COVESA/vsomeip.git

    https://github.com/llvm/llvm-project.git@llvmorg-15.0.7
    https://github.com/llvm/torch-mlir.git
    https://github.com/plaidml/tpp-mlir.git
    https://github.com/onnx/onnx-mlir.git

    https://github.com/hughperkins/VeriGPU.git

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

    https://github.com/geohot/tinygrad.git
    https://github.com/taskflow/taskflow.git
    https://github.com/pytorch/pytorch.git
    https://github.com/pytorch/vision.git
    https://github.com/rusty1s/pytorch_sparse.git
    https://github.com/onnx/onnx.git
    https://github.com/microsoft/onnxruntime.git
    https://github.com/MegEngine/MegEngine.git
    https://github.com/openppl-public/ppl.nn.git
    https://github.com/alibaba/BladeDISC.git
    https://github.com/microsoft/onnxruntime-inference-examples.git
    https://github.com/huggingface/transformers.git
)

do_sync() {
    args=""
    IFS='@' read -r -a link <<< "$1"

    tag="${link[1]}"
    [[ -n "$tag" ]] && args+=" -b $tag"

    url=${link[0]}
    repo=$(echo "$url" | cut -d'/' -f4- | sed 's/\//-/g')
    args+=" $url $prefix/$repo"

    [[ -d "${prefix}/$repo" ]] && (cd "$prefix/$repo" && git pull)
    [[ ! -d "${prefix}/$repo" ]] && git clone $args
}
main() {
    for u in "${lst[@]}"; do
        do_sync "$u"
    done
}

main

