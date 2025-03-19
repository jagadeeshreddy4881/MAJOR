module TB_ALU;
    reg [3:0] A, B;      // Declare A and B as reg for procedural assignments
    reg [2:0] SEL;       // Declare SEL as reg
    wire [7:0] OUT;      // ALU output (wire)
    wire ZERO;           // Zero flag (wire)

    // Instantiate the ALU
    ALU uut(
        .A(A),
        .B(B),
        .SEL(SEL),
        .OUT(OUT),
        .ZERO(ZERO)
    );

    initial begin
        // Monitor signal values
        $monitor("A=%b, B=%b, SEL=%b, OUT=%b, ZERO=%b", A, B, SEL, OUT, ZERO);

        // Test Addition
        A = 4'b0011; B = 4'b0001; SEL = 3'b000; #10; // A + B = 4
        // Test Subtraction
        A = 4'b0101; B = 4'b0010; SEL = 3'b001; #10; // A - B = 3
        // Test Multiplication
        A = 4'b0011; B = 4'b0010; SEL = 3'b010; #10; // A * B = 6
        // Test AND
        A = 4'b1100; B = 4'b1010; SEL = 3'b011; #10; // A & B = 1000
        // Test OR
        A = 4'b1100; B = 4'b1010; SEL = 3'b100; #10; // A | B = 1110
        // Test NOT
        A = 4'b1100; SEL = 3'b101; #10;              // ~A = 0011
        // Test Increment
        A = 4'b0111; SEL = 3'b110; #10;              // A + 1 = 1000
        // Test Decrement
        A = 4'b1000; SEL = 3'b111; #10;              // A - 1 = 0111

        $finish;
    end
endmodule
