#!/bin/bash -e

image_name="pico-sdk"
current_dir="$(pwd)"

docker run \
    --name="pico-sdk-container" \
    -u $(id -u) \
    --rm \
    -it \
    -w "${current_dir}" \
    --mount type=bind,target="${current_dir}",source="${current_dir}" \
    "${image_name}" \
    "${@}"
