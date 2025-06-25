#!/apps/bin/julia

# this script runs all of the RWCode model for each set of parameters (P)

# packages necessary for starting the load
#using Pkg
#Pkg.update()

#Pkg.add("JLD2")
#Pkg.add("DataFrames")
#Pkg.add(url="./DrawGammas")
using JLD2, DataFrames
import DrawGammas: StructAllParams, StructParams

# set strings for the directories
wd = pwd()
D = "$wd/Data"
G = "$wd/Guesses"
R = "$wd/Results"

# load the parameters for this task
SGE_TASK_ID = Base.parse(Int, ENV["SGE_TASK_ID"])
P = jldopen("$D/Params/P_$SGE_TASK_ID.jld2", "r")["P"];

# load the package with the model with all dependencies
#Pkg.activate("$wd/RWModel")
#Pkg.instantiate()

using RWModel

println("Number of threads on task $SGE_TASK_ID = ", Threads.nthreads())
config = ModelConfig(1, 1, 0, 0, 100, 100, 0, [2.0, 4.0, 6.0])
# only runs transition. 
# 2 must be changed to 100 for research outputs. this is temp value to test that the model is running correctly

run_model(config, D, G, R, P)
