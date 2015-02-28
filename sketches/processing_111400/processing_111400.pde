

size(600, 600);
background(0);
//stroke(255);
//strokeWeight(5);

for (int i=0; i<=width; i=i+80) {
  for (int j=0; j<=height; j=j+80) {
    noFill();
    stroke(50,0,0);
    strokeWeight(1);
    arc(i-10,j-10,60,60,PI/2,PI);
  }
}


for (int i=0; i<=width; i=i+50) {
  for (int j=0; j<=height; j=j+50) {
    fill(50,250,190,20);
    stroke(255);
    strokeWeight(1);
    arc(i+50,j+50,200,200,PI/2,PI+2/PI);
  }
}




