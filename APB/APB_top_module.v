module APB_top(
    input  wire pclk,
    input  wire presetn,
    input  wire transfer,
    input  wire pwrite_in,       
    input  wire [7:0]pwdata_in,
    input  wire [7:0]paddr_in,
    output wire [7:0]read_data_out
);
    wire psel;
    wire penable;
    wire pwrite;
    wire [7:0]paddr;
    wire [7:0]pwdata;
    wire [7:0]prdata;
    wire pready;
    apb_master uut1 (
        .pclk(pclk),
        .presetn(presetn),
        .transfer(transfer),
        .pwrite_in(pwrite_in),
        .pwdata_in(pwdata_in),
        .paddr_in(paddr_in),
        .pready(pready),
        .prdata(prdata),
        .psel(psel),
        .penable(penable),
        .pwrite(pwrite),
        .paddr(paddr),
        .pwdata(pwdata),
        .read_data(read_data_out)
    );

    apb_slave uut2(
        .pclk(pclk),
        .presetn(presetn),
        .psel(psel),
        .penable(penable),
        .pwrite(pwrite),
        .paddr(paddr),
        .pwdata(pwdata),
        .prdata(prdata),
        .pready(pready)
    );
endmodule
