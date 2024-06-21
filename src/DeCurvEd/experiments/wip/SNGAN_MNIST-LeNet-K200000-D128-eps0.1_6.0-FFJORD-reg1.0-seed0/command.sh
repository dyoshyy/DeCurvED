#!/usr/bin/bash
train.py --tensorboard --gan-type=SNGAN_MNIST --reconstructor-type=LeNet --num-support-sets=200000 --num-support-dipoles=128 --min-shift-magnitude=0.1 --max-shift-magnitude=6.0 --batch-size=128 --max-iter=200000 --log-freq=100 --ckp-freq=50000 --lambda-reg=0.25 --flow=FFJORD --reg-flow=1.0 --flow-modules=128-128-128-128-128
