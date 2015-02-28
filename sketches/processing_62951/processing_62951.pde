
size(600, 600);
smooth();
background(0);
stroke(255);

noStroke();
fill(255);

for (int i=10; i<=width; i+=10) 
{
  for (int j=3; j<width; j+=10) {
    fill(250, i, j);
    rect(i+j,i, i/(j*2), j-20);
    rect(i+2,i+(j*2), i/(j*2), j-20);
    rect(i+(j*2), i+2, j, i/(j*2));
  }
}



