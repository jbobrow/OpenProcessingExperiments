

size(600, 600);
background(0);
//stroke(255);
//strokeWeight(5);


for (int i=0; i<=width; i=i+10) {
  for (int j=0; j<=height; j=j+10) {
    fill(255);
    rect(i-10,j-10,i,j);
  }
}

for (int i=0; i<=width; i=i+20) {
  for (int j=0; j<=height; j=j+20) {
    fill(255,5);
    strokeWeight(3);
    rect(i-20,j-20,i,j);
  }
}

for (int i=0; i<=width; i=i+80) {
  for (int j=0; j<=height; j=j+80) {
    noFill();
    strokeWeight(5);
    rect(i-80,j-80,i+40,j+40);
  }
}






