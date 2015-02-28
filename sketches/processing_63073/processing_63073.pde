

size(600, 600);
smooth();
noFill();
background(255);

for (int i=5; i<600; i=i+20) {
  for (int j=5; j<600; j=j+20) {
    stroke(0,225,223,200);
strokeWeight(5);
rect(i,j,2*j,2*i);

    stroke(0);
strokeWeight(1);
rect(i,j,2*j,2*i);

endShape();
  }
}


