class monitor;
  
  transaction trans;
  mailbox  #(transaction) mon2scb;
  virtual intf viff;
  event trigger;
 
  function new(mailbox  #(transaction) mon2scb , virtual intf viff);
    begin
      this.mon2scb = mon2scb;
      this.viff = viff;
      
      trans = new();
      
    end
  endfunction
  
  task main();
    forever 
      begin
        @(posedge viff.clk);
        @(posedge viff.clk);
        
        trans.add = viff.add;
        trans.data_in = viff.data_in;
        trans.we = viff.we;
        
        trans.data_out = viff.data_out;
        trans.display("monitor");
        
        mon2scb.put(trans);
        
        
      end
  endtask
    
  
endclass
