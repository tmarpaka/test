//subcomp1
//uvm_blocking_put_port
///////////////////////

class subcomp1 extends uvm_component;
  `uvm_component_utils(subcomp1)
  
  function new(string name = "subcomp1", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  uvm_blocking_put_port #(packet) m_put_port;
  int m_num_tx;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_put_port=new("m_put_port", this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    //why no super.run_phase()?
    repeat(m_num_tx) begin
      packet p=packet::type_id::create("p");
      assert(p.randomize());
      m_put_port.put(p);
      p.print(uvm_default_line_printer);
      #10;
      //`uvm_info("subcomp1", "Put done.", UVM_LOW)
    end
  endtask
endclass