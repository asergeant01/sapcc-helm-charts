---
# In this file users, backendroles and hosts can be mapped to Security roles.
# Permissions for OpenSearch roles are configured in roles.yml

_meta:
  type: "rolesmapping"
  config_version: 2

# Define your roles mapping here

## Demo roles mapping

adminrole:
  reserved: false
  users:
  -  "admin"

own_index:
  reserved: false
  users:
  - "*"
  description: "Allow full access to an index named like the username"

logstash:
  reserved: false
  backend_roles:
  - "logstash"

kibana_user:
  reserved: false
  backend_roles:
  {{- range .Values.global.ldap.opensearch_groups }}
  - {{ . | title | quote }}
  {{- end }} 
  description: "Maps kibanauser to kibana_user"

readall:
  reserved: false
  backend_roles:
  - "readall"

manage_snapshots:
  reserved: false
  backend_roles:
  - "snapshotrestore"

kibana_server:
  reserved: true
  users:
  - "kibanaserver"
