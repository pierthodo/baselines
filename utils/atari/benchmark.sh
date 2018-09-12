while read -r line
do
	sbatch run_game.sh $line
	sleep 1
done < "seeds.txt"
