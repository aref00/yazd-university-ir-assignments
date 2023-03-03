#!/bin/bash
commands=""
count=0
while IFS= read -r line
do
	IFS=' '
	read -a node <<<"$line" #reading str as an array as tokens separated by IFS  
	commands+="CREATE (:NODE {id: ${node[0]}})-[:LINK]->(:NODE {id: ${node[1]}});";
	# count=$(($count + 1))
	# echo "$count"
done < "./web-graph.txt"

docker exec a149ca1b65e0ba80e26e2b405/3af80593c7d34371d0c5266d9fc5387ac2c9598 cypher-shell -u neo4j -p password "$commands"