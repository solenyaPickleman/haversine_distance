Haskell implementation of Haversine Distance using hmatrix to support matrix operations.

It is fairly memory intensive due to allocation of the full matrix.

On Intel Core i7-8550U @ 1.8 ghz with 16 gb of RAM:
	- 100000000 haversine computations and sum in ~ 41 seconds of wall time 
	
This was a proof of concept to compare Haskell execution time w/ Python implementation of the same
