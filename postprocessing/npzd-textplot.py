# -*- coding: utf-8 -*-
"""
Created on Thu Aug 17 11:40:23 2023

@author: HP
"""
import matplotlib.pyplot as plt
import numpy as np

# plt.clf()
fileHandle = open( 'test.txt', 'r')
time=range(1,366)
n=np.zeros((365))
p=np.zeros((365))
z=np.zeros((365))
d=np.zeros((365))


for i in range(1,366):
    fileContents=fileHandle.readline()
    index=12
    new_index=index+1
    while index+1==new_index:
        sth=new_index
        new_index+=(fileContents[new_index+1:].find(" ")+1)
        index=sth 
    first=fileContents[index+1:new_index]
    n[i-1]=first    
    
    index=new_index
    new_index= index+1
    while index+1==new_index:
        sth=new_index
        new_index+=(fileContents[new_index+1:].find(" ")+1)
        index=sth     
    second = fileContents[index+1:new_index]
    p[i-1]=second
    
   
    index=new_index
    new_index=index+1
    while index+1==new_index:
        sth=new_index
        new_index+=(fileContents[new_index+1:].find(" ")+1)
        index=sth
    third=fileContents[index +1 :new_index]
    z[i-1]=third
                      
    index=new_index
    new_index=index+1
    while index+1==new_index:
        sth=new_index
        new_index+=(fileContents[new_index+1:].find(" ")+1)
        index=sth
    fourth=fileContents[index+1:new_index]
    d[i-1]=fourth



plt.plot(time,n) 
plt.plot(time,p)
plt.plot(time,z)
plt.plot(time,d)
plt.title("NPZ cycle in upper box - D cycle in lower box")
legend_drawn_flag = True
plt.legend(["N", "P","Z","D"], loc=0, frameon=legend_drawn_flag)
plt.xlabel("Time (days)")
plt.ylabel("NPZD")
# plt.savefig("plot.jpg",dpi=300)

fileHandle.close()
