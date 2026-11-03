`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:57:06 PM
// Design Name: 
// Module Name: comparator_tb
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

module comparator_tb;

reg [5:0] A, B;
wire [1:0] COMP;

comparator DUT(
    .A(A),
    .B(B),
    .COMP(COMP)
);

initial begin

    // Test 1: Equal
    A = 6'd20;
    B = 6'd20;
    #10;

    // Test 2: Greater
    A = 6'd30;
    B = 6'd20;
    #10;

    // Test 3: Smaller
    A = 6'd10;
    B = 6'd20;
    #10;

    // Test 4: Maximum equal values
    A = 6'd63;
    B = 6'd63;
    #10;

    // Test 5: Zero compared with maximum
    A = 6'd0;
    B = 6'd63;
    #10;

    $finish;

end

endmodule

