# docker-packer

Make a docker image with rvm, ruby 2.2.3, libgecode version 3 and packer installed.

The libgecode is necessary because the dep-selector-libgecode gem from chef doesn't compile on low memory machines (potentially docker)

https://github.com/chef/dep-selector-libgecode

If you're using this image and installing that gem, you're going to want to use the environment variable like they described.
