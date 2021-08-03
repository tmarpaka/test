//data_packet is here.
//////////////////////

class packet extends uvm_object;
  
  rand bit [3:0] addr;
  rand bit [3:0] data;
  
  `uvm_object_utils_begin(packet)
  	`uvm_field_int(addr, UVM_ALL_ON)
  	`uvm_field_int(data, UVM_ALL_ON)
  `uvm_object_utils_end
  
  constraint addrx {addr > 'ha;}
  constraint datax {data %2 == 0 && data > 1;}
  
  function new (string name="packet");
    super.new(name);
  endfunction
  
  function void post_randomize();
    //`uvm_info("packet", $sformatf("randomisation done: addr=%0x, data=%0x", addr, data), UVM_LOW)
  endfunction
endclass