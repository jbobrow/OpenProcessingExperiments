
size (800, 800);
background(0);
smooth();

for (int i=5; i<width; i+=10)
{
  for (int j=5; j<height; j+=10)
  {
    strokeWeight(3);
    stroke(i, i/2, i);
    line(i, j, i-10, j+10);
    stroke(i/2, i, 0);
    line(i+10, j, i, j+10);
    
    stroke(0,0,0, 10);
    strokeWeight(1);
    fill(j/2,i/2,0, 10);
    rect(i,j, 100, 100);
    rotate(2);
  }
}




