module patterngenerator(
    input clk,
    input reset,
    output reg [3:0] A,
    output reg [3:0] B,
    output reg [2:0] SEL
);
    // Internal LFSR registers
    reg [3:0] lfsr_a;
    reg [3:0] lfsr_b;
    reg [2:0] lfsr_sel;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            lfsr_a <= 4'b0001;
            lfsr_b <= 4'b0010;
            lfsr_sel <= 3'b001;
        end else begin
            // LFSR logic for pseudo-random pattern generation
            lfsr_a <= {lfsr_a[2:0], lfsr_a[3] ^ lfsr_a[2]};
            lfsr_b <= {lfsr_b[2:0], lfsr_b[3] ^ lfsr_b[1]};
            lfsr_sel <= {lfsr_sel[1:0], lfsr_sel[2] ^ lfsr_sel[0]};
        end
    end

    // Assign outputs
    always @(*) begin
        A = lfsr_a;
        B = lfsr_b;
        SEL = lfsr_sel;
    end
endmodule
