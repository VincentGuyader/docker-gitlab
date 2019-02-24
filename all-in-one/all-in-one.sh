#!/bin/bash
set -e

DockerFile=all-in-one/Dockerfile

echo "note: you should run this in top directory of this repo."
echo -e "" > ${DockerFile} # clear

cat >> ${DockerFile}  <<EOF
# This Dockerfile is generated by all-in-one script.
# This Dockerfile this a collection of all other splited Dockerfiles, but except gitlab-pages docker image.
# You can use this Dockerfile only to build gitlab-ce docker image.

################################
## image of gitlab-base-builder
################################
EOF
# builder
cat builder/Dockerfile >> ${DockerFile}


cat >> ${DockerFile}  <<EOF

################################
## image of gitlab-shell-builder
################################
EOF
cat gitlab-shell/Dockerfile >> ${DockerFile}


cat >> ${DockerFile}  <<EOF

################################
## image of gitlab-workhorse-builder
################################
EOF
cat gitlab-workhorse/Dockerfile >> ${DockerFile}


cat >> ${DockerFile}  <<EOF

################################
## image of gitlab-gitaly-builder
################################
EOF
cat gitaly/Dockerfile >> ${DockerFile}


cat >> ${DockerFile}  <<EOF

################################
## image of gitlab-builder
################################
EOF
cat gitlab/Dockerfile >> ${DockerFile}


cat >> ${DockerFile}  <<EOF

################################
## image of genshen/gitlab-ce
################################
EOF
cat Dockerfile >> ${DockerFile}

echo "generates gitlab-ce Dockerfile success!"

#################################
### gitlab-pages
DockerFile_PAGES=all-in-one/Dockerfile-pages

echo -e "" > ${DockerFile_PAGES} # clear
cat >> ${DockerFile_PAGES}  <<EOF
# This Dockerfile is generated by all-in-one script for building gitlab-pages image.

################################
## image of gitlab-base-builder
################################
EOF
# builder
cat builder/Dockerfile >> ${DockerFile_PAGES}
cat >> ${DockerFile_PAGES}  <<EOF

################################
## image of genshen/gitlab-pages
################################
EOF
cat gitlab-pages/Dockerfile >> ${DockerFile_PAGES}

echo "generates gitlab-pages Dockerfile success!"