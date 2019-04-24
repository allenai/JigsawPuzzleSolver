caffe:
	cd caffe-master-jps++ && make clean && make all -j16 
	cd caffe-master-jps++ && protoc src/caffe/proto/caffe.proto --cpp_out=. && mkdir -p include/caffe/proto && cp src/caffe/proto/caffe.pb.h include/caffe/proto

imagenet-to-lmdb:
	rm -rf data/caffe-train-lmdb data/caffe-val-lmdb
	GLOG_logtostderr=1 ./caffe-master-jps++/build/tools/convert_imageset \
	    --resize_height=256 \
	    --resize_width=256 \
	    --shuffle \
	    imagenet/val/ \
	    imagenet/val.txt \
	    data/caffe-val-lmdb/

	GLOG_logtostderr=1 ./caffe-master-jps++/build/tools/convert_imageset \
	    --resize_height=256 \
	    --resize_width=256 \
	    --shuffle \
	    imagenet/train/ \
	    imagenet/train.txt \
	    data/caffe-train-lmdb/
	
	
buildc:
	cd docker && docker build -t  ai2/ubuntu-jigsaw .

runc:
	docker run -v`pwd`:/root/JigsawPuzzleSolver -v/home/erick/imagenet:/root/imagenet --privileged -it ai2/ubuntu-jigsaw
	
