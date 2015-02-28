
size(400,400);
background(235);
smooth();

fill(240,94,65);

for(int i= 0; i< width; i+=10)
{
  for(int j=0; j<height; j+=10)
  {
    stroke (255,249,196);
    strokeWeight(1);
    rect(i,j,5,5);
    
  }
}

fill(255, 100);
rect(0,0,100,100);
rect(50, 50, 200, 200);
rect(width/2, height/2, 250, 250);




