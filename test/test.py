# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

# ---------------------- This test needs to be updated to the actual project -------------------------
# 1. test using static weight, 3 sets of testing data
# 2. test using partially loaded weight onto neuron 1 & 2, 3 sets
# 3. test using fully loaded weight onto all neurons, 3 sets 
# 4. test on debugging outputs and intermediate process, 1 set
@cocotb.test()
async def test_tt_um_BNN(dut): 
    dut._log.info("Start test for BNN")

    # Set up the clock: 100 kHz → 10 us period
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Initial values
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0

    # Apply reset
    dut._log.info("Apply reset")
    await ClockCycles(dut.clk, 5)
    dut.rst_n.value = 1

    # Enable output to safely read uo_out
    dut._log.info("Enable output to check reset value")
    dut.ui_in.value = 0b01000000  # output_en = 1, others 0
    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value.integer == 0, f"Expected counter 0 after reset, got {dut.uo_out.value}"

    # Load value 16
    dut._log.info("Load 16 into the counter")
    dut.ui_in.value = 0b10110000  # load=1, count_up=1, data=16, output_en=0
    await ClockCycles(dut.clk, 1)

    # Deassert load, keep output_en=1 to read value
    dut.ui_in.value = 0b01100000  # load=0, output_en=1, count_up=1
    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value.integer == 16, f"Expected counter to be 16 after load, got {dut.uo_out.value}"

    # Count up 3 times
    dut._log.info("Count up for 3 cycles")
    dut.ui_in.value = 0b01100000  # count_up=1, output_en=1, load=0
    await ClockCycles(dut.clk, 3)

    assert dut.uo_out.value.integer == 19, f"Expected counter 19 after 3 up counts, got {dut.uo_out.value}"

    dut._log.info("Test completed successfully.")
