rmdir /s /q pyvenv
mkdir build
mkdir pyvenv
python -m venv pyvenv
call pyvenv\Scripts\activate.bat
pip install numpy