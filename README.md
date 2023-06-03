# php-docker

Base container image for building PHP applications

### Description
This container contains a number of critical and helpful extensions for building robust PHP applications.

#### Included Extensions:

* xsl
* sodium
* bcmath
* gd
* zip
* pdo_mysql
* redis

The container also includes both [nano](https://www.nano-editor.org/) and [vim](https://www.vim.org/) for debugging and live support.

A custom configuration file is loaded at _/usr/local/etc/php/conf.d/custom.ini_, and can be used to override system variables at runtime.

The base container overrides both the `upload_tmp_dir` and `display_errors` values.

### Building

The base image will be automatically built and deployed to Github Containers whenever a release branch (releases/*) or the main branch are updated.

The base image can also be built locally through Docker though the `build` command:

```shell
docker build . -t php-misfitpixel:<BRANCH_NAME>
```

Once built, it can optionally be pushed to a registry.  The following example would push the container to Google Cloud.

```shell
docker tag php-misfitpixel:<BRANCH_NAME> gcr.io/<PROJECT_ID>/php-misfitpixel:<BRANCH_NAME>
docker push gcr.io/<PROJECT_ID>/php-misfitpixel:<BRANCH_NAME>
```

> note that the image tag name in the above example is different from the auto-deploy process in Github.
