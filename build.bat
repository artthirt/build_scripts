Rem rmdir /s /q pyvenv
if exist pyenv (
    call pyvenv\Scripts\activate.bat
    pip install ninja
) else (
    mkdir pyvenv
    python -m venv pyvenv
    call pyvenv\Scripts\activate.bat
    pip install numpy
    pip install cmake    
    pip install ninja
)

rmdir /s /q build
echo "Begin cmake"
mkdir build
cd build
call "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvars64.bat"
cmake  -G "Ninja" ../../opencv -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -DWITH_CUDA=ON -DWITH_OPENMP=ON -DWITH_OPENGL=ON -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=../opencv-install -DCMAKE_BUILD_TYPE=Release -DWITH_CUBLAS=ON -DOPENCV_DNN_CUDA=ON -DENABLE_FAST_MATH=ON  -DBUILD_opencv_python3=ON  -DCUDA_ARCH_BIN=5.2,6.1,7.0,7.5,8.6,8.7 -DBUILD_opencv_world=ON
cmake --build . --target all install
