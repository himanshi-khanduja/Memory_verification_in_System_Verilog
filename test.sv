`include "environment.sv"
program test(intf viff);
  
  environment env;
  
  initial
    begin
      env = new(viff);
      env.test();
    end
  
endprogram
