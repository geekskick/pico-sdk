#!/bin/bash -e

image_name="pico-sdk"
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker build -t "${image_name}" "${script_dir}"

