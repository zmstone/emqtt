#!/bin/sh

if [ $# -ne 4 ]; then
	echo "run Host Port MaxClients Interval"
	exit 1
fi

echo $@

erl -pa ebin -pa ../../ebin -pa ../../deps/*/ebin -smp true +P 200000 +K true -env ERL_MAX_PORTS 100000 -env ERTS_MAX_PORTS 100000 -s emqttd_benchmark start $@
