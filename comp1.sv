// comp1 contains the subcomp1 and tlmfifo
//////////////////////////////////////////

class comp1 extends uvm_component;
  `uvm_component_utils(comp1)
  
  function new(string name= "comp1", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  subcomp1 s1;
  uvm_tlm_fifo#(packet) m_fifo;
  uvm_blocking_get_export#(packet) m_comp1_get_export;
  
  int m_num_tx;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    s1=subcomp1::type_id::create("s1", this);
    
    //fifo with depth 2
    m_fifo=new("m_fifo", this, 2);
    m_comp1_get_export = new("m_comp1_get_export", this);
    s1.m_num_tx = m_num_tx;
  endfunction
  
  function void connect_phase(uvm_phase phase);
    //connection between subcomp1 and tlm_fifo
    s1.m_put_port.connect(m_fifo.put_export);
    //connecting fifo to comp1 port
    m_comp1_get_export.connect(m_fifo.get_export);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      #10 if (m_fifo.is_full()) begin
        `uvm_info("comp1", "The FIFO is full.", UVM_LOW)
      end
      //#2 `uvm_info("comp1", $sformatf("Size is: %0d, and used: %0d", m_fifo.size(), m_fifo.used()), UVM_LOW)
    end
  endtask
endclass   