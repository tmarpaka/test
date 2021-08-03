// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
`include "packet.sv"
`include "subcomp1.sv"
`include "comp1.sv"
`include "comp2.sv"
`include "my_env.sv"

module top();
  import uvm_pkg::*;
  
  //my_env env1;
  
  initial begin
    //env1=new("my_env");
    `uvm_info("TOP", "=========================", UVM_LOW);
    run_test("my_env");
    `uvm_info("TOP", "=========================", UVM_LOW);
  end
endmodule