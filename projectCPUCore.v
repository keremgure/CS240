`define ADD 3'b000
`define NAND 3'b001
`define SRL 3'b010
`define LT 3'b011
`define BZ 3'b100
`define CP2W 3'b101
`define CPfW 3'b110
`define MUL 3'b111
`define W 1000

module SimpleCPU(clk,rst,wrEn,data_fromRAM,addr_toRAM,data_toRAM,pCounter,state);
parameter SIZE = 13;

input clk,rst;
input wire [15:0] data_fromRAM;
output reg wrEn;
output reg [15:0] data_toRAM;
output reg [SIZE-1:0] addr_toRAM;
output reg [SIZE-1:0] pCounter;
reg [15:0] operating,operatingW;
output reg [2:0] state;
reg [2:0] stateNxt;
reg [2:0] opcode,opcodeNxt;
reg [12:0] arg,argNxt;
reg [15:0] starArg,starArgNxt;
reg [15:0] starW,starWNxt;
reg [15:0] starstar4,starstar4Nxt;
reg [SIZE-1:0] pCounterNxt;

always @(posedge clk) begin
    state <= #1 stateNxt;
    pCounter <= #1 pCounterNxt;
    opcode <= #1 opcodeNxt;
    arg <= #1 argNxt;
    starArg <= #1 starArgNxt;
    starW <= #1 starWNxt;
	 starstar4 <= #1 starstar4Nxt;
end

always @(*) begin
    stateNxt = state+1;
    pCounterNxt = pCounter;
    opcodeNxt = opcode;
    argNxt = arg;
    starArgNxt = starArg;
	 starWNxt = starW;
	 starstar4Nxt = starstar4;
    wrEn = 0;
	 operating = 0;
	 operatingW = 0;
    addr_toRAM = 13'bx;
    data_toRAM = 16'bx;
    if(rst)begin
	     stateNxt = 0;
		  opcodeNxt = 0;
		  argNxt = 0;
		  starArgNxt = 0;
		  starWNxt = 0;
		  starstar4Nxt = 0;
		  data_toRAM = 0;
        pCounterNxt = 0;
        addr_toRAM = 0;
        wrEn = 0;
		  operating = 0;
		  operatingW = 0;
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
                if(arg == 0)
                    addr_toRAM = starArgNxt; //goto *4
                else begin
                    addr_toRAM = `W;
                end
            end
				2:begin 
					if(arg == 0)begin
						starstar4Nxt = data_fromRAM; //**4
						addr_toRAM = `W;
					end else begin
						starWNxt = data_fromRAM; //*W
						addr_toRAM = `W;
					end
				end
            3:begin
					 if(arg == 0)begin
						starWNxt = data_fromRAM;
					 end
//                starWNxt = data_fromRAM; //*W or **4
                wrEn = 1;
                if(opcode == `BZ)
                    wrEn = 0;
                addr_toRAM = `W;
                if(opcode == `CPfW)begin
                    if(arg == 0)
								addr_toRAM = starArg; //*4 or A needed
						  else addr_toRAM = arg;
					 end
                pCounterNxt = pCounter +1;
					 operating = (arg == 0) ? starstar4 : starArg;
					 operatingW = (arg == 0) ? starWNxt : starW;
                case(opcode)//Indirect calls not working properly.!!
                    `ADD: data_toRAM = operatingW + operating;
                    `NAND: data_toRAM = ~(operatingW& operating);
                    `SRL: data_toRAM = (operating <= 16) ? (operatingW >> operating) : (operatingW << (operating - 16));
                    `LT: data_toRAM = (operatingW < operating);
                    `CP2W: data_toRAM = operating;
                    `CPfW: data_toRAM = operatingW;
                    `MUL: data_toRAM = operating * operatingW;
                    `BZ: pCounterNxt = (operatingW == 0) ? operating : pCounter+1;
                endcase
            end
            4:begin addr_toRAM = pCounter;stateNxt = 0;end
				default:begin 
				  stateNxt = 0;
				  opcodeNxt = 0;
				  argNxt = 0;
				  starArgNxt = 0;
				  starWNxt = 0;
				  starstar4Nxt = 0;
				  data_toRAM = 0;
				  pCounterNxt = 0;
				  addr_toRAM = 0;
				  wrEn = 0;
				  operating = 0;
				end
        endcase
    end
end
endmodule
