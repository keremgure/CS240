`define ADD 3'b000
`define NAND 3'b001
`define SRL 3'b010
`define LT 3'b011
`define BZ 3'b100
`define CP2W 3'b101
`define CPfW 3'b110
`define MUL 3'b111
//`define W 1000

module SimpleCPU(clk,rst,wrEn,data_fromRAM,addr_toRAM,data_toRAM,pCounter);
parameter SIZE = 13;

input clk,rst;
input wire [15:0] data_fromRAM;
output reg wrEn;
output reg [15:0] data_toRAM;
output reg [SIZE-1:0] addr_toRAM;
output reg [SIZE-1:0] pCounter;
//reg [15:0] operating;
reg [1:0] state,stateNxt;
reg [2:0] opcode,opcodeNxt;
reg [12:0] arg,argNxt;
reg [15:0] starArg,starArgNxt;
//reg [15:0] starstar4,starstar4Nxt;
reg [SIZE-1:0] pCounterNxt;
reg [15:0] W,WNxt;

always @(posedge clk) begin
    state <= #1 stateNxt;
    pCounter <= #1 pCounterNxt;
    opcode <= #1 opcodeNxt;
    arg <= #1 argNxt;
    starArg <= #1 starArgNxt;
    W <= #1 WNxt;
    //starstar4 <= #1 starstar4Nxt;
end

always @(*) begin
    stateNxt = state+1;
    pCounterNxt = pCounter;
    opcodeNxt = opcode;
    argNxt = arg;
    starArgNxt = starArg;
    WNxt = W;
    //starstar4Nxt = starstar4;
    wrEn = 0;
    //operating = 0;
    addr_toRAM = 13'bx;
    data_toRAM = 16'bx;
    if(rst)begin
        stateNxt = 0;
        opcodeNxt = 0;
        argNxt = 0;
        starArgNxt = 0;
        WNxt = 0;
        //starstar4Nxt = 0;
        data_toRAM = 0;
        pCounterNxt = 0;
        addr_toRAM = 0;
        wrEn = 0;
        //operating = 0;
    end else begin
        case(state)
            0:begin
                {opcodeNxt,argNxt} = data_fromRAM;
                if(argNxt == 0)
                    addr_toRAM = 4;
                else
                    addr_toRAM = argNxt;
            end
            1:begin
                starArgNxt = data_fromRAM; //*A or *4
					 addr_toRAM = arg;
                if(arg == 0)
                    addr_toRAM = starArgNxt; //goto *4
            end
            2:begin
                //if(arg == 0)begin
                    //starstar4Nxt = data_fromRAM;
						  starArgNxt = data_fromRAM;
                //end
//                starWNxt = data_fromRAM; //*W or **4
                wrEn = (opcode == `CPfW) ? 1 : 0;
                addr_toRAM = (arg == 0) ? starArg : arg; //*4 or A
                pCounterNxt = pCounter +1;
                //operating = (arg == 0) ? starstar4Nxt : starArg;//**4 or *A
                case(opcode)
                    `ADD: WNxt = W + starArgNxt;
                    `NAND: WNxt = ~(W & starArgNxt);
                    `SRL: WNxt = (starArgNxt <= 16) ? (W >> starArgNxt) : (W << (starArgNxt - 16));
                    `LT: WNxt = (W < starArgNxt);
                    `CP2W: WNxt = starArgNxt;
                    `CPfW: data_toRAM = W;
                    `MUL: WNxt = starArgNxt * W;
                    `BZ: pCounterNxt = (W == 0) ? starArgNxt : pCounter+1;
                endcase
            end
            3:begin addr_toRAM = pCounter;stateNxt = 0;end
            default:begin 
                  stateNxt = 0;
                  opcodeNxt = 0;
                  argNxt = 0;
                  starArgNxt = 0;
                  WNxt = 0;
                  //starstar4Nxt = 0;
                  data_toRAM = 0;
                  pCounterNxt = 0;
                  addr_toRAM = 0;
                  wrEn = 0;
                  //operating = 0;
                end
        endcase
    end
end
endmodule
