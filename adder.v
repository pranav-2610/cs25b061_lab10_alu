`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:46:29 PM
// Design Name: 
// Module Name: adder
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


module adder(
    input [5:0] A,
    input [5:0] B,
    output [5:0] SUM,
    output CARRY
);

wire [6:0] C;

assign C[0] = 1'b0;

genvar i;

generate
    for(i = 0; i < 6; i = i + 1) begin: RCA

        full_adder FA(
            .A(A[i]),
            .B(B[i]),
            .CIN(C[i]),
            .SUM(SUM[i]),
            .COUT(C[i+1])
        );

    end
endgenerate

assign CARRY = C[6];

endmodule
