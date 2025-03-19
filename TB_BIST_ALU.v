module TB_BIST_ALU();

    // Testbench signals
    reg clk;
    reg reset;
    wire FAULT_DETECTED;

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5ns
    end

    // Instantiate the BIST_ALU module
    BIST_ALU uut (
        .clk(clk),
        .reset(reset),
        .FAULT_DETECTED(FAULT_DETECTED)
    );

    // Simulation setup
    initial begin
        // Initialize reset and simulate
        reset = 1;
        #10;  // Hold reset high for 10ns

        reset = 0;  // Release reset
        #2000; // Simulate for 1000ns

        // Check for fault detection manually
        $display("Fault detected status: %b", FAULT_DETECTED);

        #100; // Extra time for observation
        $stop; // End simulation
    end

endmodule
