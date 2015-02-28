
size (800, 800);
background(0);
smooth();
strokeWeight(1);

for (int i=0; i<width; i+=10)
{
  for (int j=0; j<height; j+=10)
  {
    fill(0);
    stroke(250, i*.5, j*.5, 255);
    rect(i, j, i+10, j+20);
  }
}



