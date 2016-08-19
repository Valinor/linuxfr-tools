echo "diff"
for i in {1..6};do echo -n "rc"$i",";git diff v4.7-rc$i v4.7-rc`expr $i + 1`| wc -l;done

echo "add"
for i in {1..6};do git diff v4.7-rc$i v4.7-rc`expr $i + 1`| grep "^+"|wc -l;done

echo "delete"
for i in {1..6};do git diff v4.7-rc$i v4.7-rc`expr $i + 1`| grep "^-"|wc -l;done

echo "LINUX DIFF:"

for i in {0..6};do echo -n "kernel 4."`expr $i + 1`,;git diff v4.$i v4.`expr $i + 1`| wc -l;done

echo "LINUX ADD:"
for i in {0..6};do echo -n "kernel 4."`expr $i + 1`,;git diff v4.$i v4.`expr $i + 1`| grep "^+"|wc -l;done


echo "LINUX SUPP:"
for i in {0..6};do echo -n "kernel 4."`expr $i + 1`,;git diff v4.$i v4.`expr $i + 1`| grep "^-"|wc -l;done
