class subcomp2 extends uvm_component;
  `uvm_component_utils(subcomp2)
  
  function new(string name = "subcomp2", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  uvm_blocking_get_port#(packet) m_get_port;
  
  function build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_get_port= new("m_get_port", this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    packet p1;
    forever begin
      m_get_port.get(p1);
      `uvm_info("subcomp2", $sformatf("This is packet received: addr=0x%0x, data=0x%0x", pkt.addr, pkt.data), UVM_LOW)
    end
  endtask
endclass