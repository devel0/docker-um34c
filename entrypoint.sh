#!/bin/bash

service dbus start

cd /um34c

./app.js -p -i 60000

$1
