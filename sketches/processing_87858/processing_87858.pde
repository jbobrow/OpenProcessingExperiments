
//NESTED FOR LOOPS
//with IF STATEMENTS
 
size(500, 500);

noStroke();
background(255);

for (int x = 30; x< width-20; x+=100)
{
  for (int y = 60; y<height-20; y+=20)
  {
 
    if (x<=width/2) {
      fill(42,187,255,100);
      quad (x, y, x-5, y-5,1,2,y,x);
    }
    else {
      fill(255,42,182,100);
      quad (x, y, x+5, y-5, 20,10,30,40);
    }
  }
}



