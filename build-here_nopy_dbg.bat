@REM rmdir /s /q pyvenv
@REM if exist pyenv (
@REM     call pyvenv\Scripts\activate.bat
@REM     pip install ninja
@REM ) else (
@REM     mkdir pyvenv
@REM     python -m venv pyvenv
@REM     call pyvenv\Scripts\activate.bat
@REM     pip install numpy
@REM     pip install cmake    
@REM     pip install ninja
@REM )

if exist opencv (
    echo opencv is downloaded
) else (
    git clone --depth 1 --recursive https://github.com/opencv/opencv.git
)
if exist opencv_contrib (
    echo opencv_contrib is downloaded
) else (
    git clone --depth 1 --recursive https://github.com/opencv/opencv_contrib.git
)

@REM rmdir /s /q build
echo "Begin cmake"
mkdir build
cd build
call "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvars64.bat"
cmake  -G "Ninja" ../opencv -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules -DWITH_CUDA=ON -DWITH_OPENMP=ON -DWITH_OPENGL=ON -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=../opencv-install-nopy -DCMAKE_BUILD_TYPE=Debug -DWITH_CUBLAS=ON -DOPENCV_DNN_CUDA=ON -DENABLE_FAST_MATH=ON  -DBUILD_opencv_python3=OFF  -DCUDA_ARCH_BIN=5.2,6.1,7.0,7.5,8.6,8.7 -DBUILD_opencv_world=ON  -DWITH_ONNX=ON
cmake --build . --target all install
