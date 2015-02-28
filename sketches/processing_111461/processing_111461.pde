

size(600, 600);
background(0);
//stroke(255);
//strokeWeight(5);


for (int i=0; i<=width; i=i+10) {
  for (int j=0; j<=height; j=j+10) {
    fill(255,31,32);
    ellipse(i,j,3,3);
  }
}

for (int i=0; i<=width; i=i+20) {
  for (int j=0; j<=height; j=j+20) {
    fill(255,0,255,85);
    ellipse(i,j,9,9);
  }
}

for (int i=0; i<=width; i=i+40) {
  for (int j=0; j<=height; j=j+40) {
    fill(255,152,208,80);
    ellipse(i,j,15,15);
  }
}



