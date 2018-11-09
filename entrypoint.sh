#!/bin/bash
#

while [ $# -gt 0 ]; do
  case "$1" in
    --value*)
      value="$2"
      shift
      ;;
    *)
      params+="$1 "
      ;;
  esac
  shift
done

if [[ -n "$value" ]]
then
    cat <<EOF | kubeseal $params | grep ".*value\"*: \"*\([^\"]*\)\"*" | sed -e 's/.*: \"*\([^"]*\)\"*/\1/'
apiVersion: v1
metadata:
  name: secret
kind: Secret
type: Opaque
data:
  value: $(echo "$value" | base64)
EOF
else
    kubeseal $params
fi