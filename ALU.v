module ALU(
    input [3:0] A,
    input [3:0] B,
    input [2:0] SEL,
    output reg [7:0] OUT,
    output  reg ZERO
    );
    
    always@(*) begin
    case(SEL)
    3'b000: OUT = A + B;
    3'b001: OUT = A - B;
    3'b010: OUT = A * B;
    3'b011: OUT = A & B;
    3'b100: OUT = A | B;
    3'b101: OUT = {4'b1111, ~A}; // Extend 4-bit ~A to 8 bits with 1s (if signed)
    3'b110: OUT = A + 1;
    3'b111: OUT = A - 1;
    default: OUT = 8'b0; //default case
    endcase
    ZERO = (OUT == 8'b0);
    end
endmodule
