module SimpleCounter(
  input clk,
  input reset_n,
  output reg timeout
);

  reg [25:0] count;
  reg timeout_flag;    //判斷計時是否已經到達

  always @(posedge clk or negedge reset_n) begin    //數到一秒停
    if (~reset_n) begin
      count <= 0;
      timeout_flag <= 0;
    end
    else begin
      if (count == 50000000) begin // 50MHz * 1s = 50000000
        timeout_flag <= 1;
      end
      else begin
        count <= count + 1;
        timeout_flag <= 0;
      end
    end
  end

  always @(posedge clk or posedge reset_n) begin
    if (~reset_n) begin
      timeout <= 0;
    end
    else begin
      timeout <= timeout_flag;
    end
  end

endmodule
