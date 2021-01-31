# check out this makefile
# https://github.com/thotypous/keccak-bsv/blob/master/Makefile

NAME=$(shell cat module-name)
#INCLUDE=-i "../bool" -i "../cmp" -i "../shift"


touch:
	touch ${NAME}.bsv Tb${NAME}.bsv

clean:
	rm -f *.bo a.out a.out.so tb.exe *.o *.v

test: clean
	bsc -verilog -u -g mkTb${NAME} ${INCLUDE} Tb${NAME}.bsv
	bsc -verilog -e  mkTb${NAME} -o tb.exe *.v
	./tb.exe

build: clean
	bsc -verilog -u -g mkTb${NAME} ${INCLUDE} Tb${NAME}.bsv
	bsc -verilog -e  mkTb${NAME} -o tb.exe *.v

arith: clean
	bsc -e mkTbArith -sim -o ./out -simdir . -p %/Libraries:./arith:./bool:./cmp:./shift -bdir . -keep-fires
