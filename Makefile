.PHONY:all
all: myboot

myboot: mystart.o lowlevel_init.o myboot.lds
	arm-linux-gnueabihf-ld -Tmyboot.lds -o myboot mystart.o lowlevel_init.o
	arm-linux-gnueabihf-objcopy -O binary myboot myboot.bin

#mystart.o: mystart.s
#	arm-linux-gnueabihf-gcc -c mystart.s

#lowlevel_init.o: lowlevel_init.s
# 	arm-linux-gnueabihf-gcc -c lowlevel_init.s

%.o: %.s
	arm-linux-gnueabihf-gcc -c $<

.PHONY:clean
clean:
	rm -f *.o myboot myboot.bin
	
