#!/bin/sh

admins=()

# key is to find out the Unique ID if it is more than 500
for username in $(dscl . list /Users UniqueID | awk '$2 > 500 { print $1 }'); do

# the *not* is the only key I can think of. It says list all usernames who does not have a not in result.
# to learn more, just run the following command on your Mac
## dsmemberutil checkmembership -U <your username> ##
# the above command gives you better understanding of what is happening below.
    if [[ $(dsmemberutil checkmembership -U "${username}" -G admin) != *not* ]]; then
        admins+=("${username}")
    fi
done
# echo the entire list.
echo ${admins[@]}
