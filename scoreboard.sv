class scoreboard;
  
  transaction trans;
  mailbox  #(transaction) mon2scb;
  event trigger;
  
  
  function new(mailbox  #(transaction) mon2scb);
    begin
      
      this.mon2scb = mon2scb;
      trans = new();
    end
  endfunction
  
  task main();
    forever
      begin
        #10;
        mon2scb.get(trans);
        if(trans.data_in == trans.data_out)
          $display("correct output");
        else
          $display("wrong output");
                
        $display("___________________________________");
               
        ->trigger;
      end
  endtask
  

endclass
