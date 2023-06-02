# php-docker

Base container image for building PHP applications

## To build
docker build . -t php-misfitpixel:<BRANCH_NAME>

## To push
docker tag php-misfitpixel:<BRANCH_NAME> gcr.io/<PROJECT_ID>/php-misfitpixel:<BRANCH_NAME>

docker push gcr.io/<PROJECT_ID>/php-misfitpixel:<BRANCH_NAME>
