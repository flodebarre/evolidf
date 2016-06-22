#!/bin/bash

# Download list of subscribers
# curl -u florence.debarre@college-de-france.fr "https://listes.college-de-france.fr/sympa/dump/evolidf.cirb/light" > abonnes.txt
# does not work because need to log in -> has to be done manually



{
if [ ! -f abonnes.txt ]; then
  printf "download the list from https://listes.college-de-france.fr/sympa/dump/evolidf.cirb/light and save it in file called abonnes.txt\n\n"
  exit 0
fi
}

# Remove names, keeping only part of addresses after @
sed "s/^.*@//g" abonnes.txt > abonnés

# Count the number of lines = number of subscribers
nba=$(wc -l abonnés)

# Get today's date
todaydate=$(date +%Y-%m-%d)

echo -n  "$todaydate" > domains.txt
echo "$nba" >> domains.txt
sort abonnés | uniq -c >> domains.txt

# Clean
rm abonnés
rm abonnes.txt