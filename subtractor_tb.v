`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:54:01 PM
// Design Name: 
// Module Name: subtractor_tb
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

module subtractor_tb;

reg [5:0] A, B;
wire [5:0] DIFF;
wire BORROW;

subtractor DUT(
    .A(A),
    .B(B),
    .DIFF(DIFF),
    .BORROW(BORROW)
);

initial begin

    // Test 1
    A = 6'd30;
    B = 6'd10;
    #10;

    // Test 2
    A = 6'd50;
    B = 6'd20;
    #10;

    // Test 3: Underflow
    A = 6'd10;
    B = 6'd20;
    #10;

    // Test 4: Equal values
    A = 6'd25;
    B = 6'd25;
    #10;

    $finish;

end

endmodule

