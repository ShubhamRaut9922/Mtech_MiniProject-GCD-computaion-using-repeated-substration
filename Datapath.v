module GCD_datapath(gt,lt,eq,ldA,ldB,sel1,sel2,sel_in,data_in,clk);
input ldA,ldB,sel1,sel2,sel_in,clk;
input [15:0] data_in;
output gt,lt,eq;
wire [15:0] Aout,Bout,X,Y,bus,subout;
PIPO A (Aout, bus,ldA,clk);
PIPO B (Bout, bus, ldB,clk);
mux mux_in1 (X,Aout,Bout,sel1);
mux mux_in2 (Y,Aout,Bout,sel2);
mux mux_load (bus,subout,data_in,sel_in);
SUB sb (subout,X,Y);
comp compare (lt,gt,eq,Aout,Bout);
endmodule
