@echo off
ghdl --clean --workdir=isim\work
ghdl --remove --workdir=isim\work
ghdl --clean --workdir=work
ghdl --remove --workdir=work
mkdir work
for /r %%i in (*.vhd) do ghdl -a --ieee=synopsys --workdir=work %%~ni.vhd
ghdl -e --ieee=synopsys --workdir=work tb_%1
ghdl -r --ieee=synopsys --workdir=work tb_%1 --vcd=%1.vcd
C:\gtkwave\bin\gtkwave %1.vcd
