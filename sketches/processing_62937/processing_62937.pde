
size(600, 600);
smooth();
background(255);
stroke(0);

noStroke();
fill(0);

for (int i=10; i<=height; i+=10) 
{
  for (int j=3; j<width; j+=4) {
    fill(50+i, 10, j);
    ellipse(j,i-(j*4), (2*j)+11, 2);
    ellipse(600-j, 600-i, 4, 4);
  }
}



