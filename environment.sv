`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  transaction trans;
  generator gen;
  driver driv;
  monitor mon;
  scoreboard scrb;
  mailbox #(transaction) m1;
  mailbox #(transaction) m2;
  event trigger;
  virtual intf viff;
  
  function new(virtual intf viff);
    begin
    
    this.viff = viff;
    m1 = new();
    m2 = new();
      gen = new(m1);
      driv = new(m1 , viff); 
      mon = new(m2 , viff);
      scrb = new(m2);
    gen.trigger = trigger;
    scrb.trigger = trigger;
    
    end
  endfunction
  
    task test();
    fork
      gen.main();
      driv.main();
      mon.main();
      scrb.main();
      
    join
      
  endtask
    
    
    
endclass
