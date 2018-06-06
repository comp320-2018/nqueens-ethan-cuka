<<<<<<< HEAD
# NQueens for Haskell README
Ethan Cuka 2018

After loading the nqueens.hs file, execute the command "solve n" where n is the board size. The program will return a list of tuples representing valid coordinates on the board where queens can be placed. If the function returns "[]", then there is no solution for a board of that size.

For instance, the board:

[(2,1),(4,2),(1,3),(3,4)]

can be interpreted as:

[
[0 0 1 0]
[1 0 0 0]
[0 0 0 1]
[0 1 0 0]
]

# Example:

Main> :load "C:\\Users\\Ethan Cuka\\Documents\\Github\\nqueens.hs"

Main> solve 3

[]

Main> solve 4

[(2,1),(4,2),(1,3),(3,4)]

Main> solve 8

[(1,1),(5,2),(8,3),(6,4),(3,5),(7,6),(2,7),(4,8)]
=======
# NQueens for Haskell README
Ethan Cuka 2018

After loading the nqueens.hs file, execute the command "solve n" where n is the board size. The program will return a list of tuples representing valid coordinates on the board where queens can be placed. If the function returns "[]", then there is no solution for a board of that size.

# Example:

Main> :load "C:\\Users\\Ethan Cuka\\Documents\\Github\\nqueens.hs"
Main> solve 3
[]
Main> solve 4
[(2,1),(4,2),(1,3),(3,4)]
Main> solve 8
[(1,1),(5,2),(8,3),(6,4),(3,5),(7,6),(2,7),(4,8)]
>>>>>>> cb8ed9afe225501fafa0e5ccf73ef2fd7e77b350
