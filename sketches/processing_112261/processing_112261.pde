
size(500, 500);
smooth();

background(255);
fill(0);
noStroke();

for (int i=0; i<=width; i=i+25) {
  for (int j=0; j<=height; j=j+25) {
    fill(i,j,30,80);
    ellipse(i, j, 50, 50);
  }
}



