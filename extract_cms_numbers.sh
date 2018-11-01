grep ParNew: $1 | awk '{print substr($1, 1, length($1)-1) " " $4 " " $5 " " $7 }'  | sed 's/),//g' | sed 's/K//g' | sed 's/->/ /g' | sed 's/(/ /g' | sed 's/)//g' | sed 's/After//g'
