module comparator(
    input [7:0] computed_signature,
    input [7:0] golden_signature,
    output reg FAULT_DETECTED
);
    always @(*) begin
        // Fault detection logic
        if (computed_signature == golden_signature) begin
            FAULT_DETECTED = 0; // No fault
        end else begin
            FAULT_DETECTED = 1; // Fault detected
        end
    end
endmodule
