#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

"""mkdir -p $data/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done
"""
# download a different interesting data set!

mkdir -p $data/wikipedia

mkdir -p $data/wikipedia/raw

wget https://github.com/lenaguignard/mt_fs21_ex3/blob/main/wikipedia.txt
mv wikipedia.txt $data/wikipedia/raw

# preprocess slightly

cat $data/wikipedia/raw/wikipedia.txt | python $base/scripts/preprocess_raw.py > $data/wikipedia/raw/wikipedia.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/wikipedia/raw/wikipedia.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" > \
    $data/wikipedia/raw/wikipedia.preprocessed.txt

# split into train, valid and test

head -n 500 $data/wikipedia/raw/wikipedia.preprocessed.txt > $data/wikipedia/valid.txt
head -n 1000 $data/wikipedia/raw/wikipedia.preprocessed.txt | tail -n 500 > $data/wikipedia/test.txt
tail -n 3260 $data/wikipedia/raw/wikipedia.preprocessed.txt > $data/wikipedia/train.txt
