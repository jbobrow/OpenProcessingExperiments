

size(600, 600);
background(0);
//stroke(255);
//strokeWeight(5);


for (int i=0; i<=width; i=i+10) {
  for (int j=0; j<=height; j=j+20) {
    fill(255);
    ellipse(i,j,3,3);
    fill(255,50);
    ellipse(i,j,i,j);
  }
}



