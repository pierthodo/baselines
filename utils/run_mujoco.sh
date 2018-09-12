
#!/bin/bash
while read -r s
do
	while read -r bet
	do
		python -m baselines.run --alg=ppo2 --decay=0 --theta=0 --beta=$bet --seed $s --env Swimmer-v2 --network=mlp --num_timesteps=2e7 --identifier benchmark_lr_0.003/ --path /home/ml/pthodo/RL/LOG/mujoco/ &
	done < "beta.txt"
done < "seeds.txt"
wait
