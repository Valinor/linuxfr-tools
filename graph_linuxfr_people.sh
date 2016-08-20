#sh
if [ $# -ne 2 ]; then
  echo "Usage: $0 [inputfile] [outputfile]"
  exit 1
fi
cat $1|cut -d":" -f1|sort| uniq -c|sort -r -n|sed -e 's/^[[:space:]]*//'|sed 's/ / : /'|gnuplot -p -e "set style data histograms;set style fill solid 1.00 border -1;set datafile separator ':';set xtic rotate by -65;set term png;set output '$2';plot COL=1 '<cat' using COL:xticlabels(2) notitle"
