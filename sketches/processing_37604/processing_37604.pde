
int squaresSum = 0; 
int sumofSquares = 0;
int totalSum = 0; 

for(int rr = 1; rr <= 100; rr++)
{
squaresSum += rr * rr; 
}

for(int rr = 1; rr <= 100; rr++)
{
totalSum += rr; 
}

//println(totalSum);
 
sumofSquares += totalSum * totalSum; 

println(sumofSquares - squaresSum); 
