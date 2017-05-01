/*
 * re_detect.v
 * 2017/04/17 - Felipe Veas <felipe.veasv [at] usm.cl>
 *
 * Detector de cantos de subida
 */

`timescale 1ns / 1ps

module re_detect
(
	input clk,
	input signal_in,
	output signal_out
);

	/* Se retrasa la señal de entrada */
	reg delayed_in;
	always @(posedge clk)
		delayed_in <= signal_in;

	/*
	 * Luego se compara su estado actual con el estado anterior,
	 * la salida pasa a HIGH cada vez que entrada cambia de LOW a HIGH
	 */
	assign signal_out = ~delayed_in & signal_in;

endmodule
