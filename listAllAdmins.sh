#!/bin/sh

admins=()

# key is to find out the Unique ID if it is more than 500
for username in $(dscl . list /Users UniqueID | awk '$2 > 500 { print $1 }'); do
    if [[ $(dsmemberutil checkmembership -U "${username}" -G admin) != *not* ]]; then
        admins+=("${username}")
    fi
done
# echo the entire list.
echo ${admins[@]}
