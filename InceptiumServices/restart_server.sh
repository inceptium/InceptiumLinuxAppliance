#!/bin/bash

kill -9 `pgrep -f InceptiumServices.jar`
tail -f -n100 /root/IncStorage/log/inceptium_srv.log
