
size(600, 600);
smooth();
background(0);
stroke(255);

noStroke();
fill(255);

for (int i=4; i<=width; i+=13) 
{
  for (int j=3; j<height-10; j+=14) {
    fill(j, i, i);
    ellipse(i, j, 12-j/8, 20-j/10);
  }
}


