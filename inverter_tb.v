`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:55:43 PM
// Design Name: 
// Module Name: inverter_tb
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

module inverter_tb;

reg [5:0] A;
wire [5:0] Y;

inverter DUT(
    .A(A),
    .Y(Y)
);

initial begin

    A = 6'b101010;
    #10;

    A = 6'b111111;
    #10;

    A = 6'b000000;
    #10;

    A = 6'b100100;
    #10;

    $finish;

end

endmodule

