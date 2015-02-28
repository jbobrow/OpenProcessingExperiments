
//NESTED FOR LOOPS
//with IF STATEMENTS
 
size(500, 500);

strokeWeight(50);
background(255);

for (int x = 30; x< width-20; x+=100)
{
  for (int y = 60; y<height-30; y+=20)
  {
 
    if (x<=width/2) {
      fill(42,187,255,100);
      point (x-5, y-5);
    }
    else {
      fill(255,42,182,100);
      point (x, y);
    }
  }
}



