#!/bin/bash

# Truth table for (A∧B)∨(C∧D)

truth_or()
{
    arr1=$1
    arr2=$2

    for p in ${arr1[@]}; do
        for q in ${arr2[@]}; do
            p_or_q+=$(( ${arr1[p]} || ${arr2[q]} ))
        done
    done
}

truth_and()
{
    arr1=$1
    arr2=$2

    for p in ${arr1[@]}; do
        for q in ${arr2[@]}; do
            p_and_q+=$(( ${arr1[p]} && ${arr2[q]} ))
        done
    done
}

p_q=("0" "1")
p_and_q=()
p_or_q=()

for i in ${p_q[@]}; do
    for j in ${p_q[@]}; do
        p_and_q+=($(( $i && $j )))
    done
done

for i in ${p_and_q[@]}; do
    for j in ${p_and_q[@]}; do
        p_or_q+=($(( $i || $j )))
    done
done

echo -n "Truth table for (A∧B)∨(C∧D): "
for i in ${p_or_q[@]}; do
    if [[ $i == 0 ]]; then
        echo -n "F "
    else
        echo -n "T "
    fi
done
echo