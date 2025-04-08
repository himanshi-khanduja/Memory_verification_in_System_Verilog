class driver;
  
  event trigger;
  transaction trans;
  mailbox  #(transaction) gen2driv;
  virtual intf viff;
  
  
  function new(mailbox  #(transaction) gen2driv , virtual intf viff);
    begin
      this.gen2driv = gen2driv;
      this.viff  = viff;
      trans = new();
    end
  endfunction
  
  task main();
    
    forever 
      
      if(trans.we==1)
          begin
            
            gen2driv.get(trans);
            viff.add = trans.add;
            viff.data_in = trans.data_in;
            viff.we = 1;
            trans.display("driver");
            
            @(posedge viff.clk);
            
            viff.we = 0;
          end
           
  endtask
  
endclass
