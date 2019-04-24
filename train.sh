#!/bin/bash

export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/root/JigsawPuzzleSolver/caffe-master-jps++/.build_release/lib
export PATH=$PATH:/usr/local/cuda/bin
./caffe-master-jps++/.build_release/tools/caffe train -solver  solver_cfn_jps.prototxt  -gpu $1

