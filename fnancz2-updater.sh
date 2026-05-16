#!/bin/bash

scriptlocation=$(pwd -L)
scriptdeletion() {
rm -f "$scriptlocation/fnancz2-updater.sh"
}
trap scriptdeletion EXIT

# Coming soon...
