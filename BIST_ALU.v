module BIST_ALU(
    input clk,
    input reset,
    output FAULT_DETECTED
);
    wire [3:0] A, B;
    wire [2:0] SEL;
    wire [7:0] OUT;
    wire ZERO;
    wire [7:0] computed_signature;
    
    parameter [7:0] golden_signature = 8'hA5;

    // Instantiate PatternGenerator
    patterngenerator Pattern_Generator (
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .SEL(SEL)
    );

    // Instantiate ALU
    ALU alu (
        .A(A),
        .B(B),
        .SEL(SEL),
        .OUT(OUT),
        .ZERO(ZERO)
    );

    // Instantiate SignalAnalyzer
    signalanalyzer Signature_Analyzer (
        .clk(clk),
        .reset(reset),
        .OUT(OUT),
        .ZERO(ZERO),
        .signature(computed_signature)
    );

    // Instantiate Comparator
    comparator Comparator (
        .computed_signature(computed_signature),
        .golden_signature(golden_signature),
        .FAULT_DETECTED(FAULT_DETECTED)
    );
endmodule
