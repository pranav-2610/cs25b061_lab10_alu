module fpga_top(
    input [14:0] sw,
    output [8:0] led
);

wire [5:0] A;
wire [5:0] B;
wire [2:0] SEL;

wire [5:0] RESULT;
wire [1:0] COMP;
wire VALID;

assign A = sw[5:0];
assign B = sw[11:6];
assign SEL = sw[14:12];

main_alu ALU1(
    .A(A),
    .B(B),
    .SEL(SEL),
    .RESULT(RESULT),
    .COMP(COMP),
    .VALID(VALID)
);

assign led[5:0] = RESULT;
assign led[7:6] = COMP;
assign led[8] = VALID;

endmodule
