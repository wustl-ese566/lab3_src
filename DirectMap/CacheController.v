/*****************************************************************************************************
* Description:                 Direct-Map cache controller template
*
* Author:                      
*
* Email:                       
*
* Rev History:
*       <Author>        <Date>        <Hardware>     <Version>        
*     
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

    //==============================================
    // Put your code here.
    //==============================================

endmodule
