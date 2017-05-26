module periferico_uart_TB; 
reg reset;
reg clk;
reg [7:0] Tx;  //Dato de envio
reg send;

periferico_uart  uut(
.clk(clk),
.reset(reset)
);
	
	
initial begin 
	clk <= 0;
	reset=1;
	#10; reset=0;
	
	end
	
always #1 clk <= ~clk; 













initial begin//: TEST_CASE
  $dumpfile("periferico_uart_TB.vcd");
  $dumpvars(-1, uut);
  #80000 $finish;



end

endmodule

