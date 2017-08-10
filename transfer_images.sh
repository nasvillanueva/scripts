#!/bin/sh

src=''
dest=''
matchers=''
pattern=''
push=0

usage() {
    echo "$(basename "$0") [-h] [[-s source] -d destination -m matcher[,matcher2,matcher3...] [-p]]
where:
    -h print usage
    -s source registry (optional)
        example: registry.hub.docker.com
    -d destination registry (required)
        example: registry.mydomain.com
    -m matchers (required)
        all the images that will be tagged with the destination
        example nodejs,jenkins,chronos
    -p push images (optional)
        push all tagged images
"
}

while getopts 'phs:d:m:' flag; do
    case "${flag}" in
        h)
            usage
            exit 0
            ;;
        s) src="${OPTARG}" ;;
        d) dest="${OPTARG}" ;;
        m) matchers="${OPTARG}" ;;
        p) push=1 ;;
        *)
            usage
            exit 0
            ;;
    esac
done



buildPattern(){
    pattern="$TARGET"
    if [ ! -z "$pattern" ]; then
        pattern="${pattern}/"
    fi
    pattern="${pattern}($(echo $matchers | sed -e 's/,/\|/g'))"
}


grepImages(){
    docker images | grep -E "$pattern"
}



## Main

if [ -z "$dest" ]; then
    echo "Destination must be provided"
    exit 1
elif [ -z "$matchers" ]; then
    echo "Matchers must be provided"
    exit 1
fi



TARGET="$src" buildPattern

sourceImages="$(grepImages | awk '{print $1":"$2}')"


while read -r sourceImage; do
    prefix=$src
    targetImage=''
    if [ ! -z "$prefix" ]; then
        prefix="$prefix/"
    fi
    targetImage="$dest/${sourceImage#$prefix}"

    echo "Tagging $targetImage"
    docker tag $sourceImage $targetImage

    if [ $push -eq 1 ]; then
        echo "Pushing $targetImage"
        docker push $targetImage
    fi
done <<< "$sourceImages"


