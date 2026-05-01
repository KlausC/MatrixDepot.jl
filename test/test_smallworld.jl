n = 10 # rand(1:10)
A = matrixdepot("smallworld", n)
B = matrixdepot("smallworld", Int, n)

C = A
C2 = MatrixDepot.shortcuts(C, 0.6)
@test nnz(C) <= nnz(C2)
println("'smallworld' passed test...")
