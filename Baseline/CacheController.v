/*****************************************************************************************************
* Description:                 Baseline Cache Controller for Demo
*
* Author:                      Dengxue Yan
*
* Email:                       Dengxue.Yan@wustl.edu
*
* Rev History:
 *       <Author>        <Date>        <Hardware>     <Version>        <Description> 
*     Dengxue Yan   2017-02-18 17:00       --           1.00             Create
*****************************************************************************************************/
`timescale 1ns / 1ps

module CacheController(
    rst,
    clk,

    wr,
    rd,

    data_rd,
    data_wr,
    addr_req,
    addr_resp,

    rdy,
    busy,

    wr_mem,
    rd_mem,
    busy_mem,

    data_rd_mem,
    data_wr_mem,
    addr_mem,

    cache_miss_count,
    cache_hit_count
    );

    input  rst;// Reset
    input  clk;// System clk

    input  wr;
    input  rd;
    output [31:0] data_rd;
    reg    [31:0] data_rd;

    input  [31:0] data_wr;
    input  [31:0] addr_req;
    output [31:0] addr_resp;
    reg    [31:0] addr_resp;
    output rdy;
    reg    rdy;
    output busy;
    reg    busy;

    output  wr_mem;
    reg     wr_mem;
    output  rd_mem;
    reg     rd_mem;
    input   busy_mem;
    input  [31:0] data_rd_mem;
    output [31:0] data_wr_mem;
    reg    [31:0] data_wr_mem;
    output [31:0] addr_mem;
    reg    [31:0] addr_mem;

    output [31:0] cache_miss_count;
    reg    [31:0] cache_miss_count;
    output [31:0] cache_hit_count;
    reg    [31:0] cache_hit_count;

    reg [15:0]  cache_valid = 16'h0000;
    reg [15:0]  cache_dirty = 16'h0000;
    reg [23:0]  cache_tag [15:0];
    reg [127:0] cache_data[15:0];

    reg [2:0]   cache_state = 3'h0;
    reg [1:0]   cache_count = 2'h0;

    wire [23:0] addr_tag = addr_req[31:8];
    wire [3:0]  addr_index = addr_req[7:4];
    wire [3:0]  addr_offset = addr_req[3:0];

    reg  rd_temp = 1'b1;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // reset
            rdy  <= 1'b0;
            busy <= 1'b0;
            data_rd <= 32'hZZZZZZZZ;

            cache_valid <= 16'h0000;
            cache_dirty <= 16'h0000;

            cache_state <= 3'h0;
            cache_count <= 2'h0;

            rd_mem <= 1'b0;
            wr_mem <= 1'b0;
            addr_mem <= 0;

            cache_miss_count   <= 0;
            cache_hit_count <= 0;

            rd_temp <= 1'b1;
            addr_resp <= 32'hZZZZZZZZ;
            data_rd <= 32'hZZZZZZZZ;
        end
        else begin
            case (cache_state)
            3'h0:
            begin
                if ((wr) || (rd))
                begin
                    cache_miss_count <= cache_miss_count + 1'b1;
                    addr_mem <= addr_req;
                    rd_temp <= rd;
                    if (wr)
                    begin
                        data_wr_mem <= data_wr;
                        wr_mem <= 1'b1;
                        rd_mem <= 1'b0;
                    end else begin
                        wr_mem <= 1'b0;
                        rd_mem <= 1'b1;
                    end
                    rdy <= 1'b0;
                    busy <= 1'b1;
                    cache_state <= 3'h1;
                end else begin
                    wr_mem <= 1'b0;
                    rd_mem <= 1'b0;
                    rdy <= 1'b0;
                    busy <= 1'b0;
                end

            end
            3'h1:
            begin
                if (!busy_mem) begin
                    wr_mem <= 1'b0;
                    rd_mem <= 1'b0;
                    if (rd_temp) begin
                       addr_resp <= addr_mem;
                       data_rd <= data_rd_mem;
                    end
                    rdy <= 1'b1;
                    busy <= 1'b0;
                    cache_state <= 3'h0;
                end
            end
            default:
                cache_state <= 3'h0;
            endcase
        end
    end

endmodule
