#!/usr/bin/env bash
# Author:       Mamedaliev K.O.
# Description:  redis atracers discovery

controllers=$(redis-cli --raw keys counter_"*"_request|sed -e 's/^counter_//' -e 's/_request$//')

printf "{\n";
printf "\t\"data\":[\n\n";

for contr in ${controllers}
do
	printf "\t{\n";
	printf "\t\t\"{#CONTROLLERNAME}\":\"${contr%#*}\",\n";
	printf "\t\t\"{#ACTIONNAME}\":\"${contr#*#}\"\n";
	printf "\t},\n";
done

printf "\n\t]\n";
printf "}\n";
