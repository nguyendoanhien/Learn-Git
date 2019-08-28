#!/bin/bash
curl -s "https://api.github.com/users/nguyendoanhien/repos?per_page=1000" | grep -w clone_url | grep -o '[^"]\+://.\+.git' |cut -d'/' -f5 | cut -d'.' -f1 > auto.txt
