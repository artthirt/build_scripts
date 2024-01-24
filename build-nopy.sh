#!/bin/sh

if [[ -d "opencv" ]] ; then
    echo opencv is downloaded
else
    git clone --depth 1 --recursive https://github.com/opencv/opencv.git
fi

if [[ -d "opencv_contrib" ]] ; then
    echo opencv_contrib is downloaded
else
    git clone --depth 1 --recursive https://github.com/opencv/opencv_contrib.git
fi

rm -rf build
#rmdir /s /q opencv-install-nopy
echo "Begin cmake"
mkdir build
cd build
cmake  -G "Ninja" ../opencv                               \
-DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules     \
-DCMAKE_CUDA_HOST_COMPILER=/usr/bin/g++-12                \
-DWITH_CUDA=ON                                            \
-DWITH_OPENMP=ON                                          \
-DWITH_OPENGL=ON                                          \
-DBUILD_EXAMPLES=OFF                                      \
-DBUILD_TESTS=OFF                                         \
-DCMAKE_INSTALL_PREFIX=../opencv-build                    \
-DCMAKE_BUILD_TYPE=Release -DWITH_CUBLAS=ON               \
-DOPENCV_DNN_CUDA=ON                                      \
-DENABLE_FAST_MATH=ON                                     \
-DBUILD_opencv_python3=OFF                                \
-DCUDA_ARCH_BIN=5.2,6.1,7.0,7.5,8.6,8.7                   \
-DBUILD_opencv_world=ON                                   \
-DWITH_ONNX=ON
cmake --build . --target all install