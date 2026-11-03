`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 01:46:58 PM
// Design Name: 
// Module Name: subtractor
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


module subtractor(
    input [5:0] A,
    input [5:0] B,
    output [5:0] DIFF,
    output BORROW
);

wire [6:0] BR;

assign BR[0] = 1'b0;

genvar i;

generate
    for(i = 0; i < 6; i = i + 1) begin: RCA_SUB

        full_subtractor FS(
            .A(A[i]),
            .B(B[i]),
            .BIN(BR[i]),
            .DIFF(DIFF[i]),
            .BOUT(BR[i+1])
        );

    end
endgenerate

assign BORROW = BR[6];

endmodule


