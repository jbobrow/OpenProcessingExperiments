

size(600, 600);
background(255);
//stroke(255);
//strokeWeight(5);


for (int i=0; i<=width; i=i+5) {
  for (int j=0; j<=height; j=j+5) {
    fill(0);
    ellipse(i,j,1,1);
  }
}

for (int i=0; i<=width; i=i+10) {
  for (int j=0; j<=height; j=j+10) {
    fill(0);
    ellipse(i,j,9,9);
  }
}

for (int i=0; i<=width; i=i+15) {
  for (int j=0; j<=height; j=j+15) {
    fill(0);
    ellipse(i,j,12,12);
  }
}



