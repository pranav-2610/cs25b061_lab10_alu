`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 04:03:10 PM
// Design Name: 
// Module Name: twos_complement_6
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



module twos_complement_6(
    input [5:0] A,
    output [5:0] Y
);

wire [6:0] C;

assign C[0] = 1'b1;

genvar i;

generate
    for(i = 0; i < 6; i = i + 1) begin: NEGATE

        full_adder FA(
            .A(~A[i]),
            .B(1'b0),
            .CIN(C[i]),
            .SUM(Y[i]),
            .COUT(C[i+1])
        );

    end
endgenerate

endmodule
