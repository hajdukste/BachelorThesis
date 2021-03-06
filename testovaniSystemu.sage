# Penneyho system
(M, A) = (matrix(QQbar, [[-1, -1], [1, -1]]), [vector([0, 0]),vector([1,0])])

# Modifikovany Penneyho system
# (M, A) = (matrix(QQbar, [[1, 1], [-1, 1]]), [vector([0, 0]),vector([1,0])])

# Pozicni system jakozto maticovy system, kde beta = -2 a A = {0, 1}
# (M, A) = (matrix(QQbar, [[-2]]), [vector(QQ, [0]), vector(QQ, [1])])

# Eisensteinuv system
# (M, A) = (matrix(QQbar, [[-1, -1], [1, -2]]), [vector([0, 0]), vector([1, 0]), vector([2, 0])])

# Eisensteinuv system se symetrickou abecedou
# (M, A) = (matrix(QQbar, [[-1, -1], [1, -2]]), [vector([0, 0]), vector([1, 0]), vector([-1, 0])])

# Tridimenzionalni system z [7] s a=0 a abecedou obsahujici vektor (1,0,0)
# (M, A) = (matrix(QQbar, [[0, 0, -2], [1, 0, 0], [0, 1, 0]]), [vector([0, 0, 0]),vector([1, 0, 0])])

# Ctyrdimenzionalni system z [7] pro b = 2 a a=0
# (M, A) = (matrix(QQbar, [[0, 0, 0, -2], [1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0]]), [vector([0, 0, 0, 0]),vector([1, 0, 0, 0])])
        
class matrix_representation(object):
    def __init__(self, M, A):
        #kontrola, zda báze M je diagonalizovatelná
        if not(matrix(QQbar, M^(-1)).is_diagonalizable()):
            print("Matrix M^(-1) is not diagonalisable")
            return
            
        #1.krok algoritmu: kontrola, zda báze M je expanzivní
        if not(is_matrix_exansive(M)):
            print(M, "is not expansive")
            return	
            
        #alokace pameti      
        self.M = matrix(ZZ, M)
        self.det = abs(det(matrix(ZZ,M)))
        self.MInverse = M^(-1)
        self.MInverseInZ = matrix(ZZ, self.det*M^(-1))
        self.dim = M.nrows()
        self.A = A
        
        #2.krok algoritmu: kontrola, zda A je kompletni abeceda
        if not(len(A) == self.det):
            print("Wrong cardinality of alphabet")
            return
        if not(self.alphabet_covers_factor_group(A)):
            print("Alphabet doesn't contain all congruence classes")
            return
            
        #3.krok algoritmu: hledani matice P pro specialni normu
        (self.Diag, self.P) = self.MInverse.jordan_form(transformation=True)
        self.P = self.P^(-1)
        
        #5.krok algoritmu: vypocitani spektralniho polomeru M^{-1}
        self.matrix_norm_of_MInverse = spectral_radius(self.MInverse)
        
        #6.krok algoritmu: vypocitani cisla gamma
        self.gamma = self.find_gamma()
        
        #7.krok algoritmu: vypocitani cisla alpha
        self.alpha = self.find_alpha()
        
        #vypis systemu (M,A) a cisel gamma, alpha
        print(M, "with vectors", A, "is fine")
        print("Matrix norm of M^(-1) is", self.matrix_norm_of_MInverse)
        print("Gamma is", self.gamma.n())
        print("Alpha is", self.alpha.n())
        
        #8.krok algoritmu: testovani, zda mnozina B je reprezentovana
        if(self.is_B_represented()):
            print("This system represents set Z^d")
        else:
            print("This system doesn't represent Z^d")
            
            
    #funkce, ktera kontroluje, zda kazda dvojice vektoru neni v relaci modulo M
    def alphabet_covers_factor_group(self, A):
        for i in range(len(A) - 1):
            for j in range(i + 1, len(A)):
                if(self.is_pair_congruent(A[i], A[j])):
                    return false
        return true
        
    #funkce, ktera kontroluje, zda dva vektory jsou v relaci modulo M
    def is_pair_congruent(self, d, e):
        if(self.MInverseInZ * (d - e) % self.det == 0):
            return true
        return false
        
    #funkce, ktera vraci pro vektor hodnotu ve specialni norme definovane jako ||Px||_e
    def my_norm(self, x):
        return (self.P*x).norm(2)
        
    #funkce, ktera hleda cislo gamma
    def find_gamma(self):
        max = 0
        for i in self.A:
            if((self.matrix_norm_of_MInverse*self.my_norm(i))/(1 - self.matrix_norm_of_MInverse) > max):
                max = (self.matrix_norm_of_MInverse*self.my_norm(i))/(1 - self.matrix_norm_of_MInverse)
        return max
        
    #funkce, ktera hleda cislo alpha
    def find_alpha(self):
        A = real_part_of_matrix(self.P)
        B = imag_part_of_matrix(self.P)
        H = matrix(RDF, A.T*A + B.T*B) #RDF instead of QQbar, because cholesky for QQbar doesnt work with M_1
        R = (H.cholesky().T)^(-1) #transpose because H.cholesky has the second matrix transposed
        return self.gamma * find_max_row(R)
    
    #funkce, ktera prochazi mnozinu [-alpha, alpha]^d a kontroluje, zda vektory z B jsou reprezentovany
    def is_B_represented(self):
        result = true
        alpha_floor = floor(self.alpha)
        representable_vectors = []
        count = 0
        for i in range((2*alpha_floor + 1)^self.dim):
            x = zero_vector(self.dim)
            iterated_number = Integer(i).digits(2*alpha_floor + 1)
            for j in range(len(iterated_number)):
                x[j] = -alpha_floor + iterated_number[j]
            for j in range(len(iterated_number), self.dim):
                x[j] = -alpha_floor
            if(self.my_norm(x) <= self.gamma):
                count = count + 1
                if not(self.is_vector_represented(x, representable_vectors)):
                    print("Vector", x,"cannot be represented.")
                    result = false
        print("Total number of vectors in [-alpha, alpha]^d is", (2*alpha_floor + 1)^self.dim, "and in B is", count)
        return result
    
    #funkce, ktera kontroluje, zda vektor x ma reprezentaci
    def is_vector_represented(self, x, representable_vectors):
        visited_vectors = []
        while(x != 0):
            if(x in visited_vectors):
                return false
            if(x in representable_vectors):
                representable_vectors.extend(visited_vectors)
                return true
            visited_vectors.append(x)
            for i in range(len(A)):
                if(self.is_pair_congruent(x, A[i])):
                    x = 1/self.det*(self.MInverseInZ * (x - A[i]))
                    break
        representable_vectors.extend(visited_vectors)
        return true       

    
#funkce, ktera rika, zda je matice expanzivni
def is_matrix_exansive(M):
	for i in M.eigenvalues():
		if(abs(i) <= 1):
			return false
	return true

#funkce, ktera vraci spektralni polomer
def spectral_radius(M):
	max = 0
	for i in M.eigenvalues():
		if(abs(i) > max):
			max = abs(i)
	return max

#funkce, ktera vraci pro matici jeji realnou cast
def real_part_of_matrix(A):
	AA = matrix(QQbar, A.nrows(), A.nrows())
	for i in range(A.nrows()):
		for j in range(A.nrows()):
			AA[i, j] = A[i, j].real()
	return AA

#funkce, ktera vraci pro matici jeji imaginarni cast
def imag_part_of_matrix(A):
	AA = matrix(QQbar, A.nrows(), A.nrows())
	for i in range(A.nrows()):
		for j in range(A.nrows()):
			AA[i, j] = A[i, j].imag()
	return AA

#funkce, ktera najde maximalni radek
def find_max_row(A):
	max = 0
	for i in range(A.nrows()):
		sum = 0
		for j in range(A.nrows()):
			sum = sum + abs(A[i, j])
		if(sum > max):
			max = sum
	return max
    
myMatrix = matrix_representation(M, A)
