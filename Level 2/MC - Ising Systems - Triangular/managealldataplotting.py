import matplotlib.pyplot as plt
plt.rcParams.update({'font.size': 14})


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
filenames = ["L15_ex6.24","L30_ex7.24","L45_ex8.24","L90_ex9.24","L120_ex10.24","L150_ex11.24"] # enter file names


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

xlimit = [0.01, 7.105]
labels = [
    "L=15",
    "L=30",
    "L=45",
    "L=90",
    "L=120",
    "L=150"
]

indis=3
plt.figure(6)
plt.xlabel("M")
plt.ylabel("C")
#plt.xlim(xlimit)
#plt.ylim(-3.05,0.05)
plt.plot(main[0][2], main[0][indis], color='gray')
plt.plot(main[1][2], main[1][indis], color='red')
plt.plot(main[2][2], main[2][indis], color='blue')
plt.plot(main[3][2], main[3][indis], color='green')
plt.plot(main[4][2], main[4][indis], color='magenta')
plt.plot(main[5][2], main[5][indis], color='black')

plt.scatter(main[0][2], main[0][indis],s=5, label = labels[0], color='gray')
plt.scatter(main[1][2], main[1][indis],s=5, label = labels[1], color='red')
plt.scatter(main[2][2], main[2][indis],s=5, label = labels[2], color='blue')
plt.scatter(main[3][2], main[3][indis],s=5, label = labels[3], color='green')
plt.scatter(main[4][2], main[4][indis],s=5, label = labels[4], color='magenta')
plt.scatter(main[5][2], main[5][indis],s=5, label = labels[5], color='black')
plt.legend(loc='upper right', fontsize=10)
plt.show()





















"""
plt.figure(1)
plt.subplot(2,2,1)
plt.xlabel("T")
plt.ylabel("M")
plt.xlim(xlimit)
plt.ylim(-0.05,1.05)

for i in range(len(filenames)):
    plt.scatter(main[i][1], main[i][2],s=8, label = labels[i])
    plt.plot(main[i][1], main[i][2])
    plt.legend()




plt.subplot(2,2,2)
plt.xlabel("T")
plt.ylabel("E")
plt.xlim(xlimit)
plt.ylim(-3.05,0.05)
plt.scatter(main[0][1], main[0][3], color='green',s=8)
for i in range(len(filenames)):
    plt.scatter(main[i][1], main[i][3],s=8, label = labels[i])
    plt.plot(main[i][1], main[i][3])
    plt.legend()


plt.subplot(2,2,3)
plt.xlabel("T")
plt.ylabel("X")
plt.xlim(xlimit)
#plt.ylim(-0.05,1.05)
plt.scatter(main[0][1], main[0][4], color='blue',s=8)
for i in range(len(filenames)):
    plt.scatter(main[i][1], main[i][4],s=8, label = labels[i])
    plt.plot(main[i][1], main[i][4])
    plt.legend()



plt.subplot(2,2,4)
plt.xlabel("T")
plt.ylabel("C")
plt.xlim(xlimit)
#plt.ylim(-0.05,1.05)
plt.scatter(main[0][1], main[0][5], color='black',s=8)
plt.tight_layout(pad=0.4)
for i in range(len(filenames)):
    plt.scatter(main[i][1], main[i][5],s=8, label = labels[i])
    plt.plot(main[i][1], main[i][5])
    plt.legend()



plt.show()

"""
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
