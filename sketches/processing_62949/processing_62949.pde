
size(600, 600);
smooth();
background(0);
stroke(255);

noStroke();
fill(255);

for (int i=10; i<=width; i+=10) 
{
  for (int j=3; j<width; j+=10) {
    stroke(j, 248, i*2);
    quad(i, j, 20/j,25, i*j,35, 40,40);
  }
}


