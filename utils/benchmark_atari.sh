#!/bin/bash
while read game
do
	sbatch run_atari.sh $game
	echo "$game"
	sleep 1
done < "game_atari.txt"
