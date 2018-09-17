#!/bin/bash 
#SBATCH --nodes=1
#SBATCH --time=11:00:00
#SBATCH --job-name mpi_ex
#SBATCH --output=./output_dir/mpi_ex_%j.txt

cd $SCRATCH
conda activate env_mujoco
module load intel/2018.2
module load openmpi/3.1.0
cd baselines

python -m baselines.run --lr=0.00025 --theta=0.25 --noise_reward=0 --decay=0 --beta=0.25 --path /scratch/d/dprecup/pthodo/LOG_DIR/ --alg=ppo2 --seed=20 --env=$1  --num_timesteps=1e7 --identifier benchmark_13/ --num_env=15 &
python -m baselines.run --lr=0.00025 --theta=0.25 --noise_reward=0 --decay=0 --beta=0.25 --path /scratch/d/dprecup/pthodo/LOG_DIR/ --alg=ppo2 --seed=21 --env=$1  --num_timesteps=1e7 --identifier benchmark_13/ --num_env=15 &
python -m baselines.run --lr=0.00025 --theta=0.25 --noise_reward=0 --decay=0 --beta=0.25 --path /scratch/d/dprecup/pthodo/LOG_DIR/ --alg=ppo2 --seed=22 --env=$1  --num_timesteps=1e7 --identifier benchmark_13/ --num_env=15 &

python -m baselines.run --lr=0.00025 --theta=0 --noise_reward=0 --decay=0.0000005 --beta=0.25 --path /scratch/d/dprecup/pthodo/LOG_DIR/ --alg=ppo2 --seed=20 --env=$1  --num_timesteps=1e7 --identifier benchmark_13/ --num_env=15 &
python -m baselines.run --lr=0.00025 --theta=0 --noise_reward=0 --decay=0.0000005 --beta=0.25 --path /scratch/d/dprecup/pthodo/LOG_DIR/ --alg=ppo2 --seed=21 --env=$1  --num_timesteps=1e7 --identifier benchmark_13/ --num_env=15  &
python -m baselines.run --lr=0.00025 --theta=0 --noise_reward=0 --decay=0.0000005 --beta=0.25 --path /scratch/d/dprecup/pthodo/LOG_DIR/ --alg=ppo2 --seed=22 --env=$1  --num_timesteps=1e7 --identifier benchmark_13/ --num_env=15 &
wait
