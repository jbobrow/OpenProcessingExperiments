
//NESTED FOR LOOPS
size(500, 200);
background(0);
smooth();
noStroke();

//Outer loop (rows)
for (int x = 0; x<=width; x=x+40)
{
  //Each pass through the outer loop,
  //we run the entire inner loop (columns) 
  for (int y=0; y<=height; y=y+40)
  {
    ellipse(x, y, 40, 40);
  }
}




