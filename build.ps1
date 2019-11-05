$versions = (
"7.0.0",
"7.0.1",
"7.1.0",
"7.1.1",
"7.2.0",
"7.2.1",
"7.3.0",
"7.3.1",
"7.3.2")

foreach ($version in $versions) {
  docker build --build-arg=BEAT_VERSION=$version -t dockerhub/winlogbeat/winlogbeat:$version .
  docker push dockerhub/winlogbeat/winlogbeat:$version
}
