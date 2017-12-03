def x(k):
    return a+h*k


def f(x):
    return 1/(2+x)


a = -1
b = 2
h = 4
n = round((b-a)/h)
c = [1/6, 1/2, 5/6]
b = [3/10, 2/5, 3/10]
s = len(c)

total = 0

for k in range(0,n):
    for i in range(0,s):
        total += b[i]*f(x(k)+c[i]*h)

total *= h
print(total)