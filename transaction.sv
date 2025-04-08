class transaction;
  
  rand bit [7:0]add;
  rand bit [7:0]data_in;
  bit we=1;
  bit clk;
  bit [7:0]data_out;
  
  function void display(string name);
  
      $display("---------");
      $display("%s",name);
    $display("add = %d , data_in = %d , we = %d , data_out = %d at time %0t",add,data_in,we,data_out , $time);
      
   
  endfunction
    
  
endclass
