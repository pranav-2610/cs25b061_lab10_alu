`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:16:13 PM
// Design Name: 
// Module Name: full_subtractor
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


module full_subtractor(
    input A,
    input B,
    input BIN,
    output DIFF,
    output BOUT
);

assign DIFF = A ^ B ^ BIN;

assign BOUT = (~A & B) |
              (~(A ^ B) & BIN);

endmodule


