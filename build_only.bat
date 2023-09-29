call pyvenv\Scripts\activate.bat
echo "Begin cmake"
cd build
call "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvars64.bat"
cmake --build . --target all install

