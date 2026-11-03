`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:57:52 PM
// Design Name: 
// Module Name: main_alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module main_alu_tb;

reg [5:0] A, B;
reg [2:0] SEL;

wire [5:0] RESULT;
wire [1:0] COMP;
wire VALID;

main_alu DUT(
    .A(A),
    .B(B),
    .SEL(SEL),
    .RESULT(RESULT),
    .COMP(COMP),
    .VALID(VALID)
);

initial begin

    // ADD
    A = 6'd10;
    B = 6'd20;
    SEL = 3'b000;
    #10;

    // SUB
    A = 6'd30;
    B = 6'd10;
    SEL = 3'b001;
    #10;

    // AND
    A = 6'b101010;
    B = 6'b110011;
    SEL = 3'b010;
    #10;

    // OR
    A = 6'b101010;
    B = 6'b110011;
    SEL = 3'b011;
    #10;

    // NOT
    A = 6'b101010;
    SEL = 3'b100;
    #10;

    // MUL
    A = 6'd5;
    B = 6'd6;
    SEL = 3'b101;
    #10;

    // COMPARE EQUAL
    A = 6'd20;
    B = 6'd20;
    SEL = 3'b110;
    #10;

    // COMPARE GREATER
    A = 6'd30;
    B = 6'd20;
    SEL = 3'b110;
    #10;

    // COMPARE SMALLER
    A = 6'd10;
    B = 6'd20;
    SEL = 3'b110;
    #10;

    // INVALID ADDITION
    A = 6'd40;
    B = 6'd30;
    SEL = 3'b000;
    #10;

    // INVALID MULTIPLICATION
    A = 6'd10;
    B = 6'd10;
    SEL = 3'b101;
    #10;

    // INVALID SELECT
    A = 6'd10;
    B = 6'd10;
    SEL = 3'b111;
    #10;

    $finish;

end

endmodule

