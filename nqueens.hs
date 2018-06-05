--NQueens for Haskell
--Ethan Cuka 2018
--A simple haskell program that returns a solution to the NQueens problem for a given N.


solve :: Int -> [(Int,Int)] --solve takes an Int for the problem size and returns a list of valid placements. It does not format those placements as a board.
solve n = (putQueen (1,1) n [])
				
putQueen :: (Int, Int) -> Int -> [(Int,Int)] -> [(Int,Int)] --This putQueen function takes a position, a board size, a list of positions where queens already exist, and returns either a solution, or, if the placement fails, an empty list.
putQueen loc n board = 
	if (length board == n) --If we have successfully placed n queens
		then board --Return the board! We're done!
		else
			if (snd(loc)>n || fst(loc) > n) then ([]) --If we try to place off the board, we failed
			else (putQueenHelper loc n board) --The helper does all the work. All the main putQueen function does is check to see if we are done.


putQueenHelper :: (Int, Int) -> Int -> [(Int,Int)] -> [(Int,Int)] --Does all the heavy lifting.
putQueenHelper loc n board =
	if (checkLoc loc board) --If the location is not threatened by any current queen...
        then 
			(
			let temp = (putQueen (1, snd(loc)+1) n (board++[loc])) --Attempt to place the next queen down on a board that contains the new queen. Hang onto the result.
			in 
				if (temp == []) --If that placement didn't work, forget it and move to the next spot.
					then (putQueen (fst(loc)+1,snd(loc)) n board)
					else (temp)--Otherwise, return the board, we're done!
			)
		--BIG ERROR DOWN HERE WITH REGARDS TO WHEN IT MOVES ONTO NEXT COL OR ROW
        else --Otherwise, if the location is unsafe...
			(putQueen (fst(loc)+1,snd(loc)) n board) --then try to place the queen at the next spot.
			
			
checkLoc :: (Int, Int) -> [(Int,Int)] -> Bool --checkLoc returns true if a location is safe to place a queen, false otherwise.
checkLoc loc board
	|null board = True --If there are no more board spaces to threaten this piece, it is safe to place. Return true.
	|compareLoc loc (head(board)) == False = False --If this space is threatened by the first queen on the board, return false.
	|otherwise = (checkLoc loc (tail(board))) --Otherwise, check the next queen on the board.
	
	
compareLoc :: (Int, Int) -> (Int, Int) -> Bool --Checks to see if queens on two given squares can threaten each other.
compareLoc loc1 loc2 --Returns false if...
	|fst(loc1)-fst(loc2) == 0 = False -- ...both pieces have the same x position
	|snd(loc1)-snd(loc2) == 0 = False -- ...or the same y position
	|abs(fst(loc1)-fst(loc2))==abs(snd(loc1)-snd(loc2)) = False -- ...or are diagonal from each other (Their distance along x is the same as their distance along y)
	|otherwise = True --Otherwise, return true