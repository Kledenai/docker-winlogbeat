```
---
apiVersion: batch/v1
kind: Job
metadata:
  name: winlogbeat-dashboard-732-init
spec:
  ttlSecondsAfterFinished: 100
  template:
    spec:
      nodeSelector:
        kubernetes.io/os: windows
      containers:
      - name: winlogbeat-dashboard-732-init
        image: docker-image
        imagePullPolicy: Always
        command: [ "pwsh.exe", "./entrypoint.ps1" ]
        args: [ "setup", "--dashboards",
          "-E", "output.logstash.enabled=false",
          "-E", 'output.elasticsearch.hosts=["es:9200"]',
          "-E", 'setup.kibana.host="kibana:5601"' ]
      restartPolicy: Never
  backoffLimit: 4

---
apiVersion: batch/v1
kind: Job
metadata:
  name: winlogbeat-template-732-init
spec:
  ttlSecondsAfterFinished: 100
  template:
    spec:
      nodeSelector:
        kubernetes.io/os: windows
      containers:
      - name: winlogbeat-template-732-init
        image: docker-image
        imagePullPolicy: Always
        command: [ "pwsh.exe", "./entrypoint.ps1" ]
        args: [ "setup", "--template",
          "-E", "output.logstash.enabled=false",
          "-E", 'output.elasticsearch.hosts=["es:9200"]' ]
      restartPolicy: Never
  backoffLimit: 4
```
