#!/bin/bash
source config/marian/default_config.sh # get main folders from default settings

# Import to set every time, the folder in which we save all experiment results models, working files, output, logs, etc
MAIN_FOLDER="${WORKING_OUT}/silver_wi_lstm/"
# Gold files - if you do not plan on changing these after you set them,  you can also move them to default_config.sh
PRETRAINED_FOLDER="${WORKING_CORPUS}/zh-data/gold-silver-tok/"
FINETUNED_FOLDER="${WORKING_CORPUS}/zh-data/gold-tok/"

# Important to set these for silver experiments
pretrained_train="train.txt"
pretrained_dev="dev.txt"
finetuned_train="train.txt"
finetuned_dev="dev.txt"

# Files that are used as input (sentences) are assumed to be in $file$sent_ext, i.e. dev.txt and dev.txt.raw
# Possibly overwrite default settings here:

representation="word"
model_type="s2s"


sent_ext=".raw"
epochs_pre="15"
epochs_fine="30"
num_runs_fine=5
num_runs_pre=1

mini_batch="32"
disp_freq="1000"
save_freq="10000"
valid_freq="10000"

