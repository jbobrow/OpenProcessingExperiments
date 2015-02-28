
size(200,200);
background(80);
noStroke();
 
for (int a = 0; a < 100; a++)
{
  fill (60, 20, 200);
  stroke(15);
   rect(a*30, 75, 10, 10);   
 rect (a*30, 105, 10, 10);
  rect (75,a*30,10,10);
 rect (105,a*30,10,10);
   }
