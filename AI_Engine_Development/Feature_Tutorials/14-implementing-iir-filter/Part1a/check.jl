using Printf
using PyPlot
using DelimitedFiles

# specify workspace directory
ws_dir = "/home/louiev/workspace_21.2/aie_iir_1a/";


ref_file = ws_dir * "data/impresponse.dat";				# impulse response from Julia
dut_file = ws_dir * "Emulation-SW/x86simulator_output/output.dat";	# impulse response from AI engine simulation

# read the files into variables
ref = readdlm(ref_file);
dut = readdlm(dut_file);

err = ref - dut;	# calculate the difference

# plot the difference
plot(err);
grid("on");
title("Impulse Response Error");
xlabel("Sampling Index");
ylabel("Error");

@printf("eps(Float32) = %e\n", eps(Float32));
@printf("maximum(abs.(err) = %e\n", maximum(abs.(err)));

