`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:55:01 PM
// Design Name: 
// Module Name: or_gate_tb
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

module or_gate_tb;

reg [5:0] A, B;
wire [5:0] Y;

or_gate DUT(
    .A(A),
    .B(B),
    .Y(Y)
);

initial begin

    A = 6'b101010;
    B = 6'b110011;
    #10;

    A = 6'b111111;
    B = 6'b000000;
    #10;

    A = 6'b000000;
    B = 6'b000000;
    #10;

    A = 6'b100100;
    B = 6'b101101;
    #10;

    $finish;

end

endmodule

