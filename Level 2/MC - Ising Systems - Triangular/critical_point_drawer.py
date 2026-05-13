import matplotlib.pyplot as plt
plt.rcParams.update({'font.size': 11})


def is_float(element: any) -> bool:
    #If you expect None to be passed:
    if element is None: 
        return False
    try:
        float(element)
        return True
    except ValueError:
        return False

# Create a data tree
# How many file :
filenames = ["fort.40"] # enter file names


numoffile = len(filenames)
dataperfile = 5

main = [[] for _ in range(numoffile)] 
for i in range(len(main)): main[i] = [[] for _ in range(dataperfile+1)]


print(main)
for filename in filenames:
	mid_data_num = filenames.index(filename)

	with open(filename,'r') as datafile :
		for i in datafile :
			s = datafile.read()
			s = s.replace('E','e')
			s = s.replace('\n','')
			s = s.split(' ')
			
			for j in range(len(s)) :
				if is_float(s[j]) :
					#print(s[j])
					main[mid_data_num][0].append(s[j])


				

	for i in range(1,dataperfile+1):
		for j in range(0,len(main[mid_data_num][0]),(dataperfile)) :
			main[mid_data_num][i].append(float(main[mid_data_num][0][j+(i-1)]))

plt.figure(1)
plt.subplot(2,2,1)
plt.xlabel("T")
plt.ylabel("dM/dT")
plt.scatter(main[0][1], main[0][2], color='red',s=5)
plt.plot(main[0][1], main[0][2], color='red')


plt.subplot(2,2,2)
plt.xlabel("T")
plt.ylabel("dE/dT")
plt.scatter(main[0][1], main[0][3], color='green',s=5)
plt.plot(main[0][1], main[0][3], color='green')



plt.subplot(2,2,3)
plt.xlabel("T")
plt.ylabel("dX/dT")
plt.scatter(main[0][1], main[0][4], color='blue',s=5)
plt.plot(main[0][1], main[0][4], color='blue')


plt.subplot(2,2,4)
plt.xlabel("T")
plt.ylabel("dC/dT")
plt.scatter(main[0][1], main[0][5], color='black',s=5)
plt.plot(main[0][1], main[0][5], color='black')
plt.tight_layout(pad=0.4)
plt.show()


"""




plt.figure(1)
plt.subplot(2,2,1)
plt.xlabel("T")
plt.ylabel("M")
plt.xlim(0.05,5.0)
plt.errorbar(main[0][1], main[0][2], main[1][2], color = "red",
	     ecolor="black" ,elinewidth=1.0,capsize=2, fmt='.',label=None)

plt.subplot(2,2,2)
plt.xlabel("T")
plt.ylabel("E")
plt.xlim(0.05,5.0)
plt.errorbar(main[0][1], main[0][3], main[1][3], color = "red",
	     ecolor="black" ,elinewidth=1.0,capsize=2, fmt='.',label=None)

plt.subplot(2,2,3)
plt.xlabel("T")
plt.ylabel("X")

plt.xlim(0.05,5.0)
plt.errorbar(main[0][1], main[0][4], main[1][4], color = "red",
	     ecolor="black" ,elinewidth=1.0,capsize=2, fmt='.',label=None)

plt.subplot(2,2,4)
plt.xlabel("T")
plt.ylabel("C")
plt.xlim(0.05,5.0)
plt.errorbar(main[0][1], main[0][5], main[1][5], color = "red",
	     ecolor="black" ,elinewidth=1.0,capsize=2, fmt='.',label=None)

plt.show()
"""
