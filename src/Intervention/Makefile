libintervention-image.so:
	./bpc-prepare.sh src.list
	$(MAKE) -C ./Intervention libintervention-image

libintervention-image:
	bpc -v \
		-c bpc.conf  \
		-l intervention-image \
		--input-file src.list

install-libintervention-image:
	cd Intervention && bpc -l intervention-image --install
