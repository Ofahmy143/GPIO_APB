module GPIO#(
    parameter DATA_WIDTH =32 ;
)
(clk,
 penable, 
 pwrite, 
 pready,
 pwdata,
 gpio_out_data);

input  clk , penable,pwrite,pready;
input [DATA_WIDTH-1:0] pwdata;
output reg[DATA_WIDTH-1:0] gpio_out_data;

// Internal memory
reg[DATA_WIDTH-1:0] memory ;

reg command;

// setup phase 
always @(posedge clk) begin
    if(penable == 1'b1)begin
        if(pready == 1'b1)begin
            case(pwrite)
                1'b1 : begin
                    gpio_out_data = memory
                end
                1'b0 : begin
                    memory = pwdata
                end
                default : 
            endcase
        end
    end
end




end module;



