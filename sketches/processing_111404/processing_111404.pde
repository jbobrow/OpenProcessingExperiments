

size(600, 600);
background(255);
smooth();
//stroke(255);
//strokeWeight(5);

for (int i=0; i<=width; i=i+60) {
  for (int j=0; j<=height; j=j+60) {
    float fillVal = map(i, 0, width, 0, 255);
    fill(i,i/2,j/2,30);
    stroke(i/2);
    ellipse(i, height,j,i);
    ellipse(i+j, height,j,i);
    ellipse(i+j,height,j/2,i/2);
  }
}








