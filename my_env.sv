//topmost block?
//
////////////////

class my_env extends uvm_env;
  `uvm_component_utils(my_env)
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  comp1 c1;
  comp2 c2;
  int m_num_tx;
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    c1= comp1::type_id::create("c1", this);
    c2= comp2::type_id::create("c2", this);
    
    std::randomize(m_num_tx) with {m_num_tx == 4;};
    `uvm_info("env", $sformatf("Components created. %0d number of transactions", m_num_tx), UVM_LOW)
    c1.m_num_tx=m_num_tx;
    c2.m_num_tx=m_num_tx;
  endfunction
  
  function void connect_phase(uvm_phase phase);
    c2.m_get_port.connect(c1.m_comp1_get_export);
    `uvm_info("env", "Connection made", UVM_LOW)
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    #5 `uvm_info("env", $sformatf("Used: %0d, Size: %0d", c1.m_fifo.used(), c1.m_fifo.size()), UVM_LOW)
    #15 `uvm_info("env", $sformatf("Used: %0d, Size: %0d", c1.m_fifo.used(), c1.m_fifo.size()), UVM_LOW)
    #25 `uvm_info("env", $sformatf("Used: %0d, Size: %0d", c1.m_fifo.used(), c1.m_fifo.size()), UVM_LOW)
    #45 `uvm_info("env", $sformatf("Used: %0d, Size: %0d", c1.m_fifo.used(), c1.m_fifo.size()), UVM_LOW)
    #10;
    phase.drop_objection(this);
  endtask
endclass