module main_alu(

    input [5:0] A,
    input [5:0] B,
    input [2:0] SEL,

    output reg [5:0] RESULT,
    output reg [1:0] COMP,
    output reg VALID

);

wire [5:0] ADD_RESULT;
wire ADD_CARRY;

wire [5:0] SUB_RESULT;
wire SUB_BORROW;

wire [5:0] AND_RESULT;
wire [5:0] OR_RESULT;
wire [5:0] NOT_RESULT;

wire [5:0] MUL_RESULT;
wire MUL_OVERFLOW;

wire [1:0] CMP_RESULT;

wire ADD_OVERFLOW;
wire SUB_OVERFLOW;


// Addition

adder ADD1(
    .A(A),
    .B(B),
    .SUM(ADD_RESULT),
    .CARRY(ADD_CARRY)
);


// Subtraction

subtractor SUB1(
    .A(A),
    .B(B),
    .DIFF(SUB_RESULT),
    .BORROW(SUB_BORROW)
);


// Logic operations

and_gate AND1(
    .A(A),
    .B(B),
    .Y(AND_RESULT)
);

or_gate OR1(
    .A(A),
    .B(B),
    .Y(OR_RESULT)
);

inverter NOT1(
    .A(A),
    .Y(NOT_RESULT)
);


// Signed multiplier

multiplier MUL1(
    .A(A),
    .B(B),
    .PRODUCT(MUL_RESULT),
    .OVERFLOW(MUL_OVERFLOW)
);


// Signed comparator

comparator CMP1(
    .A(A),
    .B(B),
    .COMP(CMP_RESULT)
);


// Signed overflow detection

assign ADD_OVERFLOW =
    (~(A[5] ^ B[5])) & (A[5] ^ ADD_RESULT[5]);

assign SUB_OVERFLOW =
    (A[5] ^ B[5]) & (A[5] ^ SUB_RESULT[5]);


// Operation selection

always @(*) begin

    RESULT = 6'b000000;
    COMP = 2'b00;
    VALID = 1'b1;

    case(SEL)

        3'b000: begin

            RESULT = ADD_RESULT;
            VALID = ~ADD_OVERFLOW;

        end

        3'b001: begin

            RESULT = SUB_RESULT;
            VALID = ~SUB_OVERFLOW;

        end

        3'b010: begin

            RESULT = AND_RESULT;
            VALID = 1'b1;

        end

        3'b011: begin

            RESULT = OR_RESULT;
            VALID = 1'b1;

        end

        3'b100: begin

            RESULT = NOT_RESULT;
            VALID = 1'b1;

        end

        3'b101: begin

            RESULT = MUL_RESULT;
            VALID = ~MUL_OVERFLOW;

        end

        3'b110: begin

            RESULT = 6'b000000;
            COMP = CMP_RESULT;
            VALID = 1'b1;

        end

        3'b111: begin

            RESULT = 6'b000000;
            COMP = 2'b00;
            VALID = 1'b0;

        end

        default: begin

            RESULT = 6'b000000;
            COMP = 2'b00;
            VALID = 1'b0;

        end

    endcase

end

endmodule
