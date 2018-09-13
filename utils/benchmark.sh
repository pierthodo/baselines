#!/bin/bash
while IFS=, read beta theta decay lr noise_r;do
	sbatch run_game.sh $beta $theta $decay $lr $noise_r
	sleep 1
done < "param_list.txt"
