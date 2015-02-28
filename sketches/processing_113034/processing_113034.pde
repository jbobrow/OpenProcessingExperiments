
size(500,500);
smooth();
background(255,50,100);
noStroke();
 

noStroke();
   int distance = 25;
for (int x=-height; x<=height; x= x+100)
{
  for (int j=0; j<=width && j<=height; j++) {
    fill(0,200,255,j*10);
      rect(((x +j*distance)-(j)), (j*distance)-(j), 8*j, 8*j);
    }}
