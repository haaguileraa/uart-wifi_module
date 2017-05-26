module periferico_uart (

 input   reset,
 input   clk,
 input         uart_rxd,
 output        uart_txd


 );
	
 wire busy;
 wire avail;
 reg wr;
 

 wire [7:0] rx; 
 reg [7:0]  tx_data; 
 wire [7:0] tx_data2;

assign tx_data2 =tx_data;
uart periferico(   
	.reset(reset),
	.clk(clk),
	.tx_data(tx_data2),
	.rx_data(rx),
	.uart_rxd(uart_rxd),
	.uart_txd(uart_txd),
	.tx_wr(wr),   
	.tx_busy(busy)     //...
);


  
//[3:0] char_count;  //if we want to show the "o" too
reg [2:0] count = 0;     
               
always @(posedge clk) begin

case (count)     //error
    8'd0: tx_data <= "H";
    8'd1: tx_data <= "O";
    8'd2: tx_data <= "L";
    8'd3: tx_data <= "A";
    8'd4: tx_data <= "M";
    8'd5: tx_data <= "U";
    8'd6: tx_data <= "N";
    8'd7: tx_data <= "D";
    default: tx_data <= "0";  
  endcase
  
  	if (reset) begin 
  		wr <=0;
  		tx_data<=0;
  		
  	end else begin
  		if (busy == 0 && wr == 0) begin  
			count = count + 1;
			#1 wr <= 1; 	     //writes		
  		end
 		if (busy)    //if bussy==1 does not writes 
			wr <= 0;    //wr=0;
	//waits for another signal of busy
	end
	
	
	
	  
 /* //RX   
		 if (avail) 
	  rx_ack <= 1  //rx_ack from the internal block
	else 
	rx <= 0; 
*/
	end
		
endmodule	
