`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:56:24 PM
// Design Name: 
// Module Name: multiplier_tb
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

module multiplier_tb;

reg [5:0] A, B;
wire [5:0] PRODUCT;
wire OVERFLOW;

multiplier DUT(
    .A(A),
    .B(B),
    .PRODUCT(PRODUCT),
    .OVERFLOW(OVERFLOW)
);

initial begin

    // Test 1
    A = 6'd5;
    B = 6'd6;
    #10;

    // Test 2
    A = 6'd7;
    B = 6'd8;
    #10;

    // Test 3: Overflow
    A = 6'd10;
    B = 6'd10;
    #10;

    // Test 4: Maximum values
    A = 6'd63;
    B = 6'd63;
    #10;

    // Test 5: Multiplication by zero
    A = 6'd50;
    B = 6'd0;
    #10;

    $finish;

end

endmodule

