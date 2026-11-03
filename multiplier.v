module multiplier(
    input [5:0] A,
    input [5:0] B,
    output [5:0] PRODUCT,
    output OVERFLOW
);

wire [5:0] MAG_A;
wire [5:0] MAG_B;

wire [5:0] NEG_A;
wire [5:0] NEG_B;

wire [11:0] PP0, PP1, PP2;
wire [11:0] PP3, PP4, PP5;

wire [11:0] S1, S2, S3, S4;
wire [11:0] RAW_PRODUCT;

wire [11:0] NEG_PRODUCT;
wire [11:0] FINAL_PRODUCT;

wire RESULT_SIGN;


// Convert A to positive magnitude

mul_neg6 N1(
    .A(A),
    .Y(NEG_A)
);

assign MAG_A = A[5] ? NEG_A : A;


// Convert B to positive magnitude

mul_neg6 N2(
    .A(B),
    .Y(NEG_B)
);

assign MAG_B = B[5] ? NEG_B : B;


// Generate partial products

assign PP0 = {6'b000000, (MAG_A & {6{MAG_B[0]}})};

assign PP1 = {5'b00000, (MAG_A & {6{MAG_B[1]}}), 1'b0};

assign PP2 = {4'b0000, (MAG_A & {6{MAG_B[2]}}), 2'b00};

assign PP3 = {3'b000, (MAG_A & {6{MAG_B[3]}}), 3'b000};

assign PP4 = {2'b00, (MAG_A & {6{MAG_B[4]}}), 4'b0000};

assign PP5 = {1'b0, (MAG_A & {6{MAG_B[5]}}), 5'b00000};


// Add partial products using Ripple Carry Adders

mul_rca12 ADD1(
    .A(PP0),
    .B(PP1),
    .SUM(S1)
);

mul_rca12 ADD2(
    .A(S1),
    .B(PP2),
    .SUM(S2)
);

mul_rca12 ADD3(
    .A(S2),
    .B(PP3),
    .SUM(S3)
);

mul_rca12 ADD4(
    .A(S3),
    .B(PP4),
    .SUM(S4)
);

mul_rca12 ADD5(
    .A(S4),
    .B(PP5),
    .SUM(RAW_PRODUCT)
);


// Determine result sign

assign RESULT_SIGN = A[5] ^ B[5];


// Convert positive product to negative if required

mul_neg12 N3(
    .A(RAW_PRODUCT),
    .Y(NEG_PRODUCT)
);

assign FINAL_PRODUCT =
    RESULT_SIGN ? NEG_PRODUCT : RAW_PRODUCT;


// Six-bit output

assign PRODUCT = FINAL_PRODUCT[5:0];


// Signed overflow detection

assign OVERFLOW =
    (FINAL_PRODUCT[11:6] != {6{FINAL_PRODUCT[5]}});

endmodule


// =================================================
// 6-bit Two's Complement Converter
// =================================================

module mul_neg6(
    input [5:0] A,
    output [5:0] Y
);

assign Y[0] = A[0];

genvar i;

generate
    for(i = 1; i < 6; i = i + 1) begin: NEGATE

        assign Y[i] = A[i] ^ (|A[i-1:0]);

    end
endgenerate

endmodule


// =================================================
// 12-bit Two's Complement Converter
// =================================================

module mul_neg12(
    input [11:0] A,
    output [11:0] Y
);

assign Y[0] = A[0];

genvar j;

generate
    for(j = 1; j < 12; j = j + 1) begin: NEGATE

        assign Y[j] = A[j] ^ (|A[j-1:0]);

    end
endgenerate

endmodule


// =================================================
// 12-bit Ripple Carry Adder
// =================================================

module mul_rca12(
    input [11:0] A,
    input [11:0] B,
    output [11:0] SUM
);

wire [12:0] C;

assign C[0] = 1'b0;
assign C[12] = 1'b0;

genvar k;

generate
    for(k = 0; k < 12; k = k + 1) begin: ADD_STAGE

        assign SUM[k] =
            A[k] ^ B[k] ^ C[k];

        assign C[k+1] =
            (A[k] & B[k]) |
            (A[k] & C[k]) |
            (B[k] & C[k]);

    end
endgenerate

endmodule
