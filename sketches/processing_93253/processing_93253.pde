
size(200,200);
background(100);
noStroke();
  
for (int a = 0; a < 100; a++)
{
  fill (150, 10, 100);
  stroke(15);
   rect(a*30, 75, 5, 5);  
 rect (a*30, 105, 5, 5);
  rect (75,a*30,5,5);
 rect (105,a*30,5,5);
   }
