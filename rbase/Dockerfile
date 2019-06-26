FROM rdeps:latest

#LABEL "R latest base image"
LABEL version="R base image v 3.5.1"
LABEL description="Base R image to be used in shiny apps"




WORKDIR /tmp
RUN curl https://cran.rediris.es/src/base/R-3/R-3.5.1.tar.gz | tar xz -C /tmp --strip 1 \
  && ./configure --with-tcltk --enable-R-shlib --with-libpng \
     --with-jpeglib --with-system-zlib --with-cairo --with-libtiff \
  && make -j `nproc` \
  && make install \
  && rm -rf ./*




#### In the real host we use user shiny to run the server and start/stop services, we keep it this way
#### we define the uid so it is the same for all docker instances and we do not mess with the shared
#### log folder permissions
RUN useradd -ms /bin/bash -u 1001 -b /home docker
RUN echo "options(bitmapType = 'cairo')" > /home/docker/.Rprofile
RUN chown docker /home/docker/.Rprofile
###
USER docker
WORKDIR /home/docker
CMD []
