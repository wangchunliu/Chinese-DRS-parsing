# Chinese-DRS-parsing

The datasets and codes for my ACL-IJCNLP 2021 paper. 
The codes were based on [the work of Rik van Noord](https://github.com/RikVN/Neural_DRS).
The English data used in paper come from [DRS_parsing respository](https://github.com/RikVN/DRS_parsing).

```
git clone https://github.com/wangchunliu/Chinese-DRS-parsing/
```

### Setup & Data

1.Install Marian:https://marian-nmt.github.io/docs/

```
cd Chinese-DRS-parsing
git clone https://github.com/marian-nmt/marian
cd marian
git checkout b2a945c
# Build
mkdir build
cd build
cmake ..
make -j
cd ../../
```

2.From [Chinese-DRS-data](https://github.com/wangchunliu/Chinese-DRS-data), we can get Chinese DRSs data.

```
git clone https://github.com/wangchunliu/Chinese-DRS-data
```

3.From [DRS_parsing respository](https://github.com/RikVN/DRS_parsing), we can get evaluation scripts. 
The scripts in this section will import from clf_referee.py, so make sure DRS_parsing/evaluation/ is on the $PYTHONPATH.

```
git clone https://github.com/RikVN/DRS_parsing
export PYTHONPATH=${PYTHONPATH}:/your/folders/here/DRS_parsing/evaluation/
```

### Training and Parsing

The script ``src/marian_scripts/pipeline.sh `` can be used to run our own experiments, note that each experiment needs its own config file.
In `` config/marian/default_config.sh `` we can see which settings can be overwritten to create different experiments.

1. Training model:
```
sh ./src/marian_scripts/pipeline.sh config/marian/silver_ci_lstm.sh 
```

2.Parsing raw text:
```
sh ./src/marian_scripts/parse_raw_text.sh config/marian/silver_ci_lstm.sh $PRETRAINED_MODEL $OUTPUT_FILE $SENT_FILE 
```

3. Evaluation F1 scores:
```
python ../DRS_parsing/evaluation/counter.py -f1 $CLF_OUTPUT -f2 $GOLD_DEV
```
