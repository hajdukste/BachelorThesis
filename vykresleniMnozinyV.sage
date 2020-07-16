# Obrazek 1: Penneyho system
(M, A) = (matrix(QQbar, [[-1, -1], [1, -1]]), [vector([0, 0]),vector([1,0])])

# Obrazek 2: Modifikovany Penneyho system
#(M, A) = (matrix(QQbar, [[1, 1], [-1, 1]]), [vector([0, 0]),vector([1,0])])

# Obrazek 3: Penneyho system s redundantni abecedou
#(M, A) = (matrix(QQbar, [[-1, -1], [1, -1]]), [vector([0, 0]),vector([1,0]),vector([0, 1]), vector([-1, 0]), vector([0, -1])])

# Obrazek 4: Modifikovany Penneyho system s redundantni abecedou
#(M, A) = (matrix(QQbar, [[1, 1], [-1, 1]]), [vector([0, 0]),vector([1,0]),vector([0, 1]), vector([-1, 0]), vector([0, -1])])

# Obrazek 5: Eisensteinuv system
#(M, A) = (matrix(QQbar, [[-1, -1], [1, -2]]), [vector([0, 0]), vector([1, 0]), vector([2, 0])])

# Obrazek 6: Eisensteinuv system se symetrickou abecedou
#(M, A) = (matrix(QQbar, [[-1, -1], [1, -2]]), [vector([0, 0]), vector([1, 0]), vector([-1, 0])])

# Obrazek 7: Eisensteinuv system se redundantni abecedou
#(M, A) = (matrix(QQbar, [[-1, -1], [1, -2]]), [vector([0, 0]), vector([1, 0]), vector([-1, 0]), vector([0, 1]), vector([0, -1]), vector([1, 1]), vector([-1, -1])])


parametr1 = 19000000
parametr2 = 16
point_size = 1

if(M == matrix([[-1, -1], [1, -2]])):
    T = matrix([[1, -1/2], [0, sqrt(3)/2]])
else:
    T = identity_matrix(2)
    
parametr2 = Rational(parametr2)
 
list = [vector([0,0])]
C = identity_matrix(2)

for i in range(50):
    if(i >= parametr2):
        break
    C = C*M^(-1)
    length = len(list)
    for j in range(1,len(A)):
        w = C*A[j]
        w = T*w
        j = 0
        for v in list:
            list.append(v + w)
            j = j + 1
            if(j == length):
                break
        print(len(list), i)
        if(len(list) > parametr1):
            break
    if(len(list) > parametr1):
        break
print(len(list))
show(points(list, pointsize = point_size), figsize=8, aspect_ratio=1)
        
