## Build docker images
<!--
            lang       statue   note     config  make
shell       ruby+go    ?                         ./bin/install; ./bin/compile;
workhorse   go         okk               redis   make install PREFIX=xxx
pages       go         okk               cmd arg make, and copy bin dir.
gitaly      go+ruby    okk      git              make install [PREFIX=xxx]; make to download and compile Ruby dependencies, and to compile the Go binary.
gitlab      ruby
-->
```bash
cd builder
docker build --rm -t genshen/gitlab-base-builder .
cd ../gitlab-shell
docker build --rm -t genshen/gitlab-shell-builder .
cd ../gitlab-workhorse
docker build --rm -t genshen/gitlab-workhorse-builder .
cd ../gitlab-pages
docker build --rm -t genshen/gitlab-pages-builder .
cd ../gitaly
docker build --rm -t genshen/gitlab-gitaly-builder .
cd ../gitlab
docker build --rm -t genshen/gitlab-builder .
# building intermediate images finished.
cd ../
docker build --rm -t genshen/gitlab .
```