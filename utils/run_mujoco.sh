
#!/bin/bash
while IFS=, read beta theta decay lr noise_r;do
	echo $beta $theta $decay $lr
	while read -r s
	do
		echo $s
		while read game
		do
			echo $game
			python -m baselines.run --alg=ppo2  --noise_reward=$noise_r --env $game --decay=$decay --theta=$theta --lr=$lr --beta=$beta --seed=$s --network=mlp --num_timesteps=1e7 --identifier benchmark_var_4/ --path /home/ml/pthodo/RL/LOG/mujoco/ &
		done < "./mujoco/swimmer_game_mujoco.txt"
	done < "seeds.txt"
done < "param_list.txt"
wait
