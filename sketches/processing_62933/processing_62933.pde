
size(600, 600);
smooth();
background(0);
stroke(255);

noStroke();
fill(255);

for (int i=10; i<=width; i+=10) 
{
  for (int j=3; j<300; j+=4) {
    fill(j, i, 200);
    rect(i,j+i, i/j, j-20);
  }
}




