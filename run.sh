#! /usr/bin/env bash

datasets='/home/johannes/problem-set-1/data-sets'

# Question 1
#Which state in `states.tab.gz` has the lowest murder rate?

states=$datasets/states.tab.gz

answer_1=$(zcat $states \
    | grep -v '^#' \
    | cut -f1,6 \
    | sort -k2nr \
    | tail -n1 \
    | cut -f1 \
    | sed 's/"//g')
    # sed 's/this/that/'
#  echo "answer-1: $answer_1" > answers.yml
echo "answer-1: $answer_1" > answers.yml

# Question 2
# How many sequence records are in the `sample.fa` file?

fasta=$datasets/sample.fa

answer_2=$(cat $fasta \
    | grep -c '^>' )

echo "answer-2: $answer_2" >> answers.yml

# Question 3
# How many unique CpG IDs are in `cpg.bed.gz`?

cpg=$datasets/cpg.bed.gz

answer_3=$(zcat $cpg \
    | cut -f4 \
    | sort \
    | uniq \
    | wc -l
            )
echo "answer-3: $answer_3" >> answers.yml

# Question 4
# How many sequence records are in the `SP1.fq` file?

sp1=$datasets/SP1.fq

answer_4=$(cat $sp1 \
    | grep -c '^@cluster'
           )
echo "answer-4: $answer_4" >> answers.yml

# Question 5
# How many words on are lines containing the word `bloody` in `hamlet.txt`?

ham=$datasets/hamlet.txt

answer_5=$(cat $ham \
    | grep -i 'bloody' \
    | wc -w
            )
echo "answer-5: $answer_5" >> answers.yml

# Question 6
# What is the length of the sequence in the first record of `sample.fa`?

answer_6=$(cat $fasta \
    | grep -v '^>' \
    | head -n1 \
    | tr -d '\n\r' \
    | wc -m
            )
echo "answer-6: $answer_6" >> answers.yml

# Question 7 
# What is the name of the longest gene in `genes.hg19.bed.gz`?

genes=$datasets/genes.hg19.bed.gz

answer_7=$(zcat $genes \
    | awk '{ print $4, $3 - $2 }' \
    | sort -k2nr -t" "\
    | head -n1 \
    | cut -f1 -d" ")
    echo "answer-7: $answer_7" >> answers.yml

# Question 8
# How many unique chromosomes are in `genes.hg19.bed.gz`?

answer_8=$(zcat $genes \
    | cut -f1,1 \
    | uniq -c \
    | wc -l
              )
echo "answer-8: $answer_8" >> answers.yml

# Question 9
# How many intervals are associated with CTCF in `peaks.chr22.bed.gz`?

peaks=$datasets/peaks.chr22.bed.gz

answer_9=$(zcat $peaks \
        | grep -w 'CTCF' \
        | wc -l
            )
# use grep -c 'CTCF' will include CTCFL
echo "answer-9: $answer_9" >> answers.yml

# Question 10
# On what chromosome is the largest interval in `lamina.bed`?

lam=$datasets/lamina.bed

answer_10=$(cat $lam \
        | awk '{print $1, $3 -$2 }'\
        |  sort -k2n \
        | tail -n1 \
        |cut -f1 -d" "
            )
echo "answer-10: $answer_10" >> answers.yml









