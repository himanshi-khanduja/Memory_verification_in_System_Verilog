class generator;
  
  transaction trans;
  mailbox  #(transaction) gen2driv;
  event trigger;
  
  function new(mailbox  #(transaction) gen2driv);
    this.gen2driv = gen2driv;
    trans = new();
    
  endfunction
  
  task main();
    forever
      begin
        
        assert(trans.randomize())
          else $error("data not randomized");
        gen2driv.put(trans);
        trans.display("generator");
        
        
        @(trigger);
        
      end
  endtask
  
endclass
