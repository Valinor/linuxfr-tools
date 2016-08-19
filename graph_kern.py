# -*- coding: utf-8 -*-
data = [
 ["kernel 4.1",464121,-264005],
 ["kernel 4.2",1092256,-293019],
 ["kernel 4.3",654016,-344282],
 ["kernel 4.4",724712,-481732],
 ["kernel 4.5",1158316,-866247],
 ["kernel 4.6",616611,-348463],
 ["kernel 4.7",585979,-287468],
]

data2 = [
 ["v4.7-rc2",2743,-1777],
 ["v4.7-rc3",3208,-2289],
 ["v4.7-rc4",2592,-1634],
 ["v4.7-rc5",2089,-1288],
 ["v4.7-rc6",2757,-1807],
 ["4.7-rc7",1254,-710],
 ["4.7",2344,-1265],
]
# coding: utf8
import matplotlib.pyplot as plt
import numpy as np
from matplotlib import rcParams
import seaborn
#rcParams.update({'figure.autolayout': True})
#with open("user2.txt") as filedata:
#	data=filedata.readlines()
#result=[]
#for line in data:
#	splitdata=line.split()
#	result.append((" ".join(splitdata[0:-1]),splitdata[-1]))
#print result

add = [i[1] for i in data]
sub = [i[2] for i in data]
name = [i[0] for i in data]
print add
print sub
print name
width=0.35
plt.grid()
plt.bar([x+0.3 for x in range(0,len(add))],add,width,color="blue")
plt.bar([x+0.3 for x in range(0,len(add))],sub,width,color="red")
plt.plot([x+0.5 for x in range(0,len(add))],[i[1]+i[2] for i in data],color="green",linewidth=3)
plt.xticks([x for x in range(0,len(name))],[unicode(l) for l in name],  rotation=30)
plt.ylabel('nb de lignes')
##plt.xlabel('Entreprises')
#plt.subplots_adjust(bottom=0.30)
#plt.title('')
plt.show()
