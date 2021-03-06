#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=1:30:00
#SBATCH --job-name mpi_ex
#SBATCH --output=./output_dir/mpi_ex_%j.txt

cd $SCRATCH
conda activate env_mujoco
module load intel/2018.2
module load openmpi/3.1.0
cd baselines
while read -r s
do
	echo $s
	while read game
	do
		echo $game
		python -m baselines.run --alg=ppo2  --noise_reward=$5 --env=$game --decay=$3 --theta=$2 --lr=$4 --beta=$1 --seed=$s --network=mlp --num_timesteps=1e7 --identifier benchmark_var_9/ --path /scratch/d/dprecup/pthodo/LOG_DIR/ &
	done < "utils/mujoco/game_mujoco.txt"
done < "utils/seeds.txt"
wait
