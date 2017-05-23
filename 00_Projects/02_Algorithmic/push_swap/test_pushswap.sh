reset
make debug
echo -e "#-----------------#\n#test 1 => ref 2 1 3 6 5 8 \n##"
./push_swap 2 1 3 6 5 8
echo -e "#-----------------#\n#test 2 =>   ref 2 1 \n##"
./push_swap 2 1
echo -e "#-----------------#\n#test 3 =>   ref 1 2 \n##"
./push_swap 1 2
echo -e "#-----------------#\n#test 4 => ref 1 2 3 4 \n##"
./push_swap 1 2 3 4
echo -e "#-----------------#\n#test 5 => ref 4 3 2 1 \n##"
./push_swap 4 3 2 1
echo -e "#-----------------#\n#test 6 => ref 1 25 4 8 3 5 \n##"
./push_swap 1 25 4 8 3 5 
echo -e "#-----------------#\n#test 7 => rmd 5 2 8 3 4 9 \n##"
./push_swap 5 2 8 3 4 9
echo -e "#-----------------#\n#test 8 => reverse 4 3 2 1 \n##"
./push_swap 4 3 2 1 
echo -e "#-----------------#\n#test 9 => 2 premier inverse 3 2 4 5 6 7 8 \n##"
./push_swap 3 2 4 5 6 7 8 
echo -e "#-----------------#\n#test 10 => 2 dernier inverse 2 3 4 5 6 8 7 \n##"
./push_swap 2 3 4 5 6 8 7
echo -e "#-----------------#\n#./push_swap `ruby -e "puts (-1000..1000).to_a.shuffle.join(' ')"` \n##"
./push_swap `ruby -e "puts (-1000..1000).to_a.shuffle.join(' ')"`
echo -e "#-----------------#\n#./push_swap `ruby -e "puts (-5000..5000).to_a.reverse.insert(rand(8000) + 1000, 10001).join(' ')"` \n##"
./push_swap `ruby -e "puts (-5000..5000).to_a.reverse.insert(rand(8000) + 1000, 10001).join(' ')"`