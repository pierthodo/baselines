#!/bin/bash 
#SBATCH --nodes=1
#SBATCH --time=6:00:00
#SBATCH --job-name mpi_ex
#SBATCH --output=./output_dir/mpi_ex_%j.txt

cd $HOME
module load anaconda3
module load cmake
module load intel/2018.2
module load openmpi/3.1.0
conda activate env_baselines
cd RL/baselines
python -m baselines.run --theta=0 --decay=0 --beta=0.75 --path=$SCRATCH/LOG_DIR/ --alg=ppo2 --seed=$1 --env=PongNoFrameskip-v4  --num_timesteps=1e7 --identifier benchmark_3/

