#!/bin/bash
#SBATCH --job-name AMRcorner
#SBATCH --output=petsc.%J.out
#SBATCH --error=petsc.%J.err
#SBATCH --nodes 1
#SBATCH --ntasks 5 
#SBATCH --mem=5000MB
#SBATCH --partition=long
mpirun -np ntasks ./poissonFE -run_type test -refinement_limit 0.5 -simplex 0 -interpolate -bc_type dirichlet -petscspace_degree 1 -dm_plex_convert_type p4est -dm_forest_initial_refinement 1 -dm_forest_minimum_refinement 3 -dm_p4est_refine_pattern corner -dm_forest_maximum_refinement 5 -dim 2  -dm_view vtk:amr3d.vtu:vtk_vtu -vec_view vtk:amrcorner.vtu:vtk_vtu:append -cells 2,2