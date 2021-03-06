#!/usr/bin/env bash
result=0
for pkg in $(go list ./...| grep -Ev 'vendor|examples|testutils')
do
    golint -set_exit_status "$pkg" || result=1
    go vet "$pkg" || result=1
done
exit $result
