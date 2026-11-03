`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:18:24 PM
// Design Name: 
// Module Name: ripple_adder_12
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


module ripple_adder_12(
    input [11:0] A,
    input [11:0] B,
    output [11:0] SUM,
    output COUT
);

wire [12:0] C;

assign C[0] = 1'b0;

genvar i;

generate
    for(i = 0; i < 12; i = i + 1) begin: RCA12

        full_adder FA(
            .A(A[i]),
            .B(B[i]),
            .CIN(C[i]),
            .SUM(SUM[i]),
            .COUT(C[i+1])
        );

    end
endgenerate

assign COUT = C[12];

endmodule

