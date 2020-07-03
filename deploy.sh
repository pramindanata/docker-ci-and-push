version="$TRAVIS_COMMIT_MESSAGE"
pat="^([0-9]+)\.([0-9]+)\.([0-9]+)(-([0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*))?(\+[0-9A-Za-z-]+)?$"

if [[ $version =~ $pat ]]
then
  echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
  docker build -t "$DOCKER_IMAGE_NAME":latest .
  docker tag "$DOCKER_IMAGE_NAME":latest "$DOCKER_IMAGE_NAME":"$version"
  docker push "$DOCKER_IMAGE_NAME":"$version"
  docker push "$DOCKER_IMAGE_NAME":latest
else
  echo "No deployment. Commit message doesn't contain certain value."
fi