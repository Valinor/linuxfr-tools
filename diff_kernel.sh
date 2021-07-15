base=${1:-v5.8.}
result=$(echo $base|sed s/[.]/\\\\./g)
echo """echo -n \$1' ' && git diff --numstat \$1 \$2 |awk 'BEGIN{add=0;supp=0} {add=add+\$1;supp=supp+\$2} END{print add\" -\"supp}'""" > fnn.sh
chmod +x fnn.sh
git tag |grep $result[[:digit:]]*$|sort -V|awk 'BEGIN{i=0} {if (i==0) { un=$1;i=1 } else { deux=un;un=$1;printf "%s %s\n",deux,un }}'|xargs -I% ./fnn.sh % > stat.txt
gnuplot -e "set term png; set xtics rotate by 90 right;set boxwidth 0.5 absolute;set style fill solid border;set output '"$base".png';plot 'stat.txt' u 0:3:xtic(1) with boxes title 'lines added','' u 0:4:xtic(1) with boxes title 'lines Deleted lines'"
rm fnn.sh
