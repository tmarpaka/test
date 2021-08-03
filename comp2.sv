//comp2.sv
//connects to comp1 export and port.

class comp2 extends uvm_component;
  `uvm_component_utils(comp2)
  
  function new(string name = "comp2", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  uvm_blocking_get_port #(packet) m_get_port;
  int m_num_tx;
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    m_get_port= new("m_get_port", this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    packet p1; 
    repeat (m_num_tx) begin
      #20;
      m_get_port.get(p1);
      `uvm_info("comp2", $sformatf("Received pkt, addr= 0x%0x, data= 0x%0x", p1.addr, p1.data), UVM_LOW)
      //p1.print(uvm_default_line_printer);
    end
  endtask
endclass