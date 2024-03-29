#!/bin/bash
# Default settings that are imported for each experiment
# Might be overwritten per individual experiment in different config files

## First we list the settings that have to be present in each config file and never here!
## That is the reason they are commented
## SET THESE IN YOUR OWN CONFIG FILE:

# MAIN_FOLDER=""
# GOLD_FOLDER=""
# gold_train=""
# gold_dev=""


###### IMPORTANT TO SET THESE HERE ######

# Please verify if the locations below are correct 
# General locations

GIT_HOME="/path/to/Chinese-DRS-parsing/"		# where the Git Neural_DRS repository is located
EVAL_GIT_HOME="/path/to/DRS_parsing/"		# where the Git evaluation repository is located
MARIAN_HOME="${GIT_HOME}marian/build/"	# where marian scripts are located

WORKING_OUT="/path/to/outfile/"
WORKING_CORPUS="/path/to/corpus/"


###################################################################

# Settings for parsing (CCG) - only needed if you want extra features 
MAX_SEN_LEN="150"
DO_TOK="" # add "-tok" :  do tokenizing of CCG categories -> NP/N to NP / N

##### PARAMETER SETTINGS FOR EXPERIMENTS #####

# These are the default settings that will be used if you do not specify them in your own config file
# If you do specify them in your own config file, these values will be overridden

# Preprocessing variables
var_rewrite="rel" 		# options: {rel, abs, none}
casing="feature"     	# options: {normal, lower, feature}

#representation="char"  	# options: {char, word, char_word}
sep="|||"
fix="--fix" 			# try to fix ill-formed DRSs automatically (use as --fix)

# Postprocessing value
remove_clauses="75" # Remove all clauses after the first X of this value

# Number of runs per exp (pre/fine differs)
START=1 # number of runs we start at (usually 1 but we can continue sometimes from 3 for example)
num_runs_init=1
num_runs_pre=1

# Neural model
vocab="" # use as: -v VOCAB
workspace="6000" # Memory reserved in MB
#model_type="s2s" # Model type (possible values: amun, nematus, s2s, multi-s2s, transformer)
dim_vocabs="5000 5000" #  Maximum items in vocabulary ordered by rank, 0 uses all items in the provided/created vocabulary file. For multi-src encoding first do the encoders, e.g. 80 0 0 150
dim_emb="300" # Embedding size
dim_rnn="300" # RNN hidden state size
enc_type="bidirectional"     # Type of encoder RNN : bidirectional, bi-unidirectional, alternating (s2s)
enc_cell="lstm" # Type of RNN cell: gru, lstm, tanh (s2s)
enc_depth="2" # layers enc 
dec_cell="lstm" # Type of RNN cell: gru, lstm, tanh (s2s)
dec_depth="2" # layers enc 
dropout_rnn="0.2" # dropout
dropout_src="0.0"
dropout_tgt="0.0"
max_length="256" # max length
max_length_crop="" # use as --max_length_crop
#disp_freq="1000" # Display information every  arg  update
#save_freq="10000" # Save model file every  arg  updates
gpuid="0" #gpu, 0 means do on CPU
mini_batch="12" # Size of mini-batch used during update
optimizer="adam" #optimizer (sgd, adam, adagrad)
learning_rate="0.002" #learning rate 
lr_decay="0.5"
lr_decay_strategy="epoch" #Strategy for learning rate decaying (possible values: epoch, batches, stalled, epoch+batches, epoch+stalled)
lr_decay_start="9" #start decaying LR after this epoch
clip_norm="5"
#valid_freq="10000" #validate model after these batches
valid_metric="cross-entropy" # Metric to use during validation: cross-entropy, perplexity, valid-script, translation. Multiple metrics can be specified
beam_size="10" #beam size during transaltion
norm="0.9" #length normalization during validation
max_length_factor="25" 
cost_type="ce-mean" #Optimization criterion: ce-mean, ce-mean-words, ce-sum, perplexity
embedding="" #use as --embedding_vectors src-emb tgt-emb
label_smoothing="0.1"
early_stop=2
# Epochs defaults
epochs_pre="7"
epochs_fine="7"

# Boolean
skip="--skip"   		#--skip Use skip connections (s2s)
layer_normalization="--layer-normalization"  #--layer-normalization Enable layer normalization
right_left="" 			#--right-left Train right-to-left model
best_deep="" 			#--best-deep   Use Edinburgh deep RNN configuration (s2s)
allow_unk="" 			#--allow_unk
n_best=""    			#--n-best 
# Default setting for counter -ill (dummy, spar, error, score)
# We usually take care of invalid DRSs in the postprocessing already
# so now raise an error if there's an invalid one left
ill="-ill error" 		

# Pretraining from certain model
pretrain=""  #use as "--pretrained-model MODEL" # when pretraining also add this: -v vocab_src vocab_tgt
pretrain_lm=""
# Script locations:
PREPROCESS_PYTHON="${GIT_HOME}src/preprocess.py"
PREPROCESS_SH="${GIT_HOME}src/marian_scripts/preprocess.sh"
POSTPROCESS_PY="${GIT_HOME}src/postprocess.py"
AVERAGE_PY="${GIT_HOME}src/average_scores.py"
COUNTER="${EVAL_GIT_HOME}evaluation/counter.py"
SEM_TAGGER="${GIT_HOME}src/semtag_file.py"
PROCESS_PARSE="${GIT_HOME}src/process_parse.py"
sig_file="${EVAL_GIT_HOME}evaluation/clf_signature.yaml"  # signature file for clf_referee

# Embedding names and files

embed="embeddings/"
src_id="src"
tgt_id="tgt"
emb_ext="-embeddings-300.t7"

# Extensions of files we will create
char_tgt_ext=".char.tgt"
char_sent_ext=".char.sent"
sent_ext=".raw"
var_drs_ext=".var"
output_ext=".seq.out"
log_ext=".log"

# Multi-source extension. If added, we do multi-source encoding
multi_src_ext="" # ".sem" for example -- can also be a list if we use > 2 encoders, e.g. ".sem .cat.tok"

# Log file
log_file_train="train.log"
log_level="info"

# List of folder names
WORKING="working/"
VOCAB="vocab/"
MODELS="models/"
LM_MODELS="lm_models/"
OUTPUT="output/"
EVAL="evaluation/"
LOG="log/"
TRAIN="train/"
DEV="dev/"
TEST="test/"
FINETUNED="finetuned/"
PRETRAINED="pretrained/"
