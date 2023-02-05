FROM ubuntu

RUN apt-get update -y && apt-get install -y \
    cmake \
    git \
    libstdc++-arm-none-eabi-newlib \
    build-essential \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    python3 \
    vim 

WORKDIR pico

RUN git clone https://github.com/raspberrypi/pico-sdk.git --branch master
RUN git -C pico-sdk submodule update --init
RUN git clone https://github.com/raspberrypi/pico-examples.git --branch master

ENV PICO_SDK_PATH=/pico/pico-sdk
RUN cmake -B pico-examples/build -S pico-examples/

# Check that tiny_usb is set up 
RUN cmake --build pico-examples/build/ --target hello_usb
RUN cmake --build pico-examples/build/ --target hello_serial
RUN cmake --build pico-examples/build/ --target blink

# Just an example to make sure it's all right
# RUN cmake --build pico-examples/build/ --target all

ADD vimrc /etc/vim/vimrc
