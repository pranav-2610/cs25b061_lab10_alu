`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 04:04:05 PM
// Design Name: 
// Module Name: twos_complement_12
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


module twos_complement_12(
    input [11:0] A,
    output [11:0] Y
);

wire [12:0] C;

assign C[0] = 1'b1;

genvar i;

generate
    for(i = 0; i < 12; i = i + 1) begin: NEGATE

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

