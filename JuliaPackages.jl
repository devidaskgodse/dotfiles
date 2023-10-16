using Pkg


developer_tooling = [
    "Revise",
	"Documenter",
	"PrecompileTools",
	"StaticCompiler",
	"Weave",
    "LaTeXStrings",
]

profiling = [
    "Cthulhu",
	"ProfileView",
	"PProf",
	"Profile",
	"BenchmarkTools",
	"Traceur",
]

data_analysis = [
    "CSV",
    "DataFrames",
    "DelimitedFiles",
    "Distributions",
    "Statistics"
    "StatsBase",
    "StatsPlots",
    "HypothesisTests",
    "LinearAlgebra",
	"LsqFit",
	"Images",
	"GLM",
	"Measurements",
]


data_visualisation = [
    "PGFPlotsX",
    "Plots",
    "Luxor",
]

environments = [
    "Pluto",
    "PlutoUI",
    "IJulia",

]

glue = [
    "PyCall",
    "RCall",
]

performance = [
    "FLoops",
    "MKL",
]


other_packages = [

]

Pkg.add(packages)
# "AnimatedPlots",