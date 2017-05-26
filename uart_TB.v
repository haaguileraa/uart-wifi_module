module uart_TB;

reg reset;
reg clk;
reg [7:0] Txdata;  //Dato de envio
reg send;

uart  uut(     //Instancio -> unit under test
	.reset(reset),
	.clk(clk),
	.tx_data(Txdata),
	.tx_wr(send)
);

initial         clk <= 0;  //Empiezo en bajo
always #1 clk <= ~clk;     //Siempre voy a ajecutar algo que es el invertido 


initial begin //Inicializar el input



reset <=1;
#10;reset <=0;

Txdata <= "a";
#100; send=1;
#1000; send=0;

Txdata <= "b";
#20000; send=1;
#10; send=0;

end

initial begin//: TEST_CASE
  $dumpfile("uart_TB.vcd");
  $dumpvars(-1, uut);
  #80000 $finish;



end

endmodule
