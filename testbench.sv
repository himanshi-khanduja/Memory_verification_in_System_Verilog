`include "interface.sv"
`include "test.sv"

module test_top;
  
  intf viff();
  
  test t1(viff);
  
  memory m1(
    .add(viff.add),
    .data_in(viff.data_in),
    .we(viff.we),
    .clk(viff.clk),
    .data_out(viff.data_out)
       
    );
    
  
    initial begin
        viff.clk = 0;
        forever #5 viff.clk = ~viff.clk; // 100 MHz clock
    end
  
  initial
    begin
      #515;
      $finish;
    end
  
endmodule
