
size(200,200);
background(0);
  noStroke();
for (int a = 0; a < 100; a+=1)
  
{
    
  noStroke();
  fill(a*20);
    
rect(a*20, 60, 10, 10);
rect (a*20, 120, 10, 10);
rect (60,a*20,10,10);
rect (120,a*20,10,10);
   
   }
