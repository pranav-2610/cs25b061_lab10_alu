`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:53:07 PM
// Design Name: 
// Module Name: adder_tb
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

module adder_tb;

reg [5:0] A, B;
wire [5:0] SUM;
wire CARRY;

adder DUT(
    .A(A),
    .B(B),
    .SUM(SUM),
    .CARRY(CARRY)
);

initial begin

    // Test 1
    A = 6'd10;
    B = 6'd20;
    #10;

    // Test 2
    A = 6'd30;
    B = 6'd30;
    #10;

    // Test 3: Overflow
    A = 6'd40;
    B = 6'd30;
    #10;

    // Test 4: Maximum values
    A = 6'd63;
    B = 6'd63;
    #10;

    $finish;

end

endmodule

