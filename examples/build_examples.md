```
docker build --build-arg=BEAT_VERSION=7.0.0 -t winlogbeat:7.0.0 .
docker tag winlogbeat:7.0.0 dockerhub/winlogbeat/winlogbeat:7.0.0
docker push dockerhub/winlogbeat/winlogbeat
```
