

size(600, 600);
background(0);
//stroke(255);
//strokeWeight(5);

for (int i=0; i<=width; i=i+80) {
  for (int j=0; j<=height; j=j+80) {
    fill(255,70);
    strokeWeight(2);
    ellipse(i-10,j-10,60,60);
  }
}

for (int i=0; i<=width; i=i+30) {
  for (int j=0; j<=height; j=j+30) {
    fill(50,40);
    ellipse(i-10,j-10,20,20);
  }
}


for (int i=0; i<=width; i=i+60) {
  for (int j=0; j<=height; j=j+60) {
    fill(255,10);
    ellipse(i-10,j-10,10,10);
  }
}

for (int i=0; i<=width; i=i+40) {
  for (int j=0; j<=height; j=j+40) {
    noFill();
    stroke(255,50);
    strokeWeight(3);
    ellipse(i-10,j-10,200,200);
  }
}




