# Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).
I made some changes to the scripts to train my own model.

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/lenaguignard/mt_fs21_ex3
    cd mt_fs21_ex3

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data:
This will download and preprocess the wikipedia.txt file from this repo. source: https://opus.nlpl.eu/Wikipedia.php

    ./scripts/download_data.sh

Train a model: The script is adapted for the wikipedia data. 
The different dropout settings have to be changed manually in this script.

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from a trained model with: The script is adapted for the wikipedia data. 300 words will be returned.

    ./scripts/generate.sh
