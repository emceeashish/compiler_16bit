COMPUTER    = $(wildcard rtl/*.v)
LIBRARIES   = $(wildcard rtl/library/*.v)

build:
	iverilog -o computer -Wall \
		$(COMPUTER) \
		$(LIBRARIES) \
		rtl/tb/machine_tb.v

run: build
	vvp -n computer

clean:
	del /F /Q computer 2>nul
	del /F /Q machine.vcd 2>nul

view:
	gtkwave machine.vcd gtkwave/config.gtkw

tests:
	bats tests/tests.bats

.PHONY: build run clean view tests