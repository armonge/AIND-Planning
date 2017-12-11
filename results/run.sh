 for problem in {1..3}; do
   for algorithm in {1..10}; do
     aws lambda invoke --function-name planning  --payload "{\"problem\": $problem, \"search_function\": $algorithm}" lambda$problem-$algorithm.out &
     pids[${i}]=$!;
   done
 done

for pid in ${pids[*]}; do wait $pid; done;
