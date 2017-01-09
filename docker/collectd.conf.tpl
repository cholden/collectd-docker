Hostname "{{ .Env "COLLECTD_HOST" }}"

FQDNLookup false
Interval {{ .Env "COLLECTD_INTERVAL" }}
Timeout 2
ReadThreads 5

LoadPlugin write_http
<Plugin "write_http">
    <URL "http://zendev:8090/v1/collectd">
            Format "JSON"
    </URL>
</Plugin>

LoadPlugin exec
<Plugin exec>
  Exec "collectd-docker-collector" "/usr/bin/collectd-docker-collector" "-endpoint" "unix:///var/run/docker.sock" "-host" "{{ .Env "COLLECTD_HOST" }}" "-interval" "{{ .Env "COLLECTD_INTERVAL" }}"
</Plugin>
