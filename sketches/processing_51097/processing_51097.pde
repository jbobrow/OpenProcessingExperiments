
size (800, 800);
background(0);
smooth();

for (int i=0; i<width; i+=10)
{
  for (int j=0; j<height; j+=15)
  {
    strokeWeight(random(3,10));
    stroke(random(0,100), random(100,200), random(200,255));
    line(i, j, i-10, j+15);
    stroke(255, 0, 0);
    line(i+10, j+5, i+5, j+10);

  }
}

strokeWeight(50);
stroke(0);
noFill();
rect(0,0, 800,800);



