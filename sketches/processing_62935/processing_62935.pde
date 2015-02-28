
size(600, 600);
smooth();
background(0);
stroke(255);

noStroke();
fill(255);

for (int i=10; i<=width; i+=10) 
{
  for (int j=3; j<300; j+=4) {
    ellipse(j,i-(j*4), (2*j)+11, 2);
    ellipse(600-j, 600-i, 4, 4);
  }
}




