#!bin/bash


declare -A m
num_rows=3
num_columns=3


for ((i=1;i<=num_rows;i++)) do
    for ((j=1;j<=num_columns;j++)) do
        m[$i,$j]=-;
    done
done

for ((i=1;i<=num_rows;i++)) do
    for ((j=1;j<=num_columns;j++)) do
        printf '%s  ' ${m[$i,$j]}  
    done
    printf "\n"
done

win=0
check_win() {
	for i in `seq 1 3`
	do
            if [ ${m[$i,1]} == ${m[$i,2]} ] && [ ${m[$i,1]} == ${m[$i,3]} ]; then
		if [ ${m[$i,1]} != "-" ] && [ ${m[$i,2]} != "-" ] && [ ${m[$i,3]} != "-" ]; then

                	echo "Player ${m[$i,1]} won the game"
                	win=1
                	break
		fi
	    fi
            if [ ${m[1,$i]} == ${m[2,$i]} ] && [ ${m[1,$i]} == ${m[3,$i]} ]; then
		if [ ${m[1,$i]} != "-" ] && [ ${m[2,$i]} != "-" ] && [ ${m[3,$i]} != "-" ]; then
                	echo "Player ${m[1,$i]} won the game"
                	win=1
                	break
		fi
	    fi
            if [ ${m[1,1]} == ${m[2,2]} ] && [ ${m[2,2]} == [ ${m[3,3]} ]; then
            	if [ $"{m[1,1]}" != "-" ] && [ $"{m[2,2]}" != "-" ] && [ $"{m[3,3]}" != "-" ]; then
                	echo "Player ${m[$1,$1]} won the game"                
                	win=1
                	break
		fi
	    fi
            if [ ${m[3,1]} == ${m[2,2]} ] && [ ${m[2,2]} == ${m[1,3]} ]; then
            	if [ $"{m[1,3]}" != "-" ] && [ $"{m[2,2]}" != "-" ] && [ $"m{[3,1]}" != "-" ]; then
                	echo "Player ${m[2,2]} won the game"
                	win=1
                	break
		fi
	    fi
	done

}

count=0
ok=0
echo "User X starts the Game"
old_user="O"

while [ $win -eq 0 ]
do

echo "Enter user row column"
read user r c

if [ $user == $old_user ] && [ $ok -eq 0 ]; then
	echo "Wrong user"
	elif [ ${m[$r,$c]} != '-' ]; then
		echo "Already taken"
		ok=1
	else
		m[$r,$c]=$user;
		old_user=$user;
		count=$((count+1))
		check_win
		ok=0
		if [ $count -eq 9 ]; then
			win=2
			echo "Draw"
		fi	
		for ((i=1;i<=num_rows;i++)) do
    			for ((j=1;j<=num_columns;j++)) do
         			printf '%s   ' ${m[$i,$j]}
    		done
    			printf "\n"
		done
fi
done	
