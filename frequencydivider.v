module frequencydivider(
  input clk,
  input reset_n,
  output reg divided_clk = 0
);

  reg [3:0] counter;

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      counter <= 0;
      divided_clk <= 0;
    end
    else begin
      if (counter == 9) begin
        counter <= 0;
        divided_clk <= ~divided_clk;
      end
      else begin
        counter <= counter + 1;
      end
    end
  end

endmodule
