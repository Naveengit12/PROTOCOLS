module apb_slave(
    input  wire pclk,
    input  wire presetn, 
    input  wire psel,
    input  wire penable,
    input  wire pwrite,  
    input  wire [7:0]paddr,
    input  wire [7:0]pwdata,
    output reg  [7:0]prdata,
    output reg pready
);
// 16 x 8-bit memory
reg [7:0] mem [15:0];
always @(posedge pclk or negedge presetn) begin
        if (!presetn) begin
            pready  <= 0;
            prdata  <= 0;
        end else begin
            pready <= 1;  
            if (psel && penable) begin 
                if (pwrite) begin
                    mem[paddr[4:0]] <= pwdata;
                    pready<=0;
                end else begin
                pready<=1;
                    prdata <= mem[paddr[4:0]];
                    
                end
            end
        end
    end
endmodule
