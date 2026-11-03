module comparator(
    input [5:0] A,
    input [5:0] B,
    output reg [1:0] COMP
);

wire [5:0] DIFF;
wire BORROW;

subtractor SUB1(
    .A(A),
    .B(B),
    .DIFF(DIFF),
    .BORROW(BORROW)
);

always @(*) begin

    if(A == B)
        COMP = 2'b00;

    else if(A[5] != B[5]) begin

        if(A[5] == 1'b1)
            COMP = 2'b10;

        else
            COMP = 2'b01;

    end

    else if(DIFF[5] == 1'b1)
        COMP = 2'b10;

    else
        COMP = 2'b01;

end

endmodule
