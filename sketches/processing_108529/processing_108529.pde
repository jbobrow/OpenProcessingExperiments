
size (360,560);

noFill();

for (int row = 0; row <22; row += 1) {
  for (int col = 0; col < 12; col += 1) {
    pushMatrix();
    translate(60+20*col,60+20*row);
    float jitter = random(-3.5*row,3.5*row);  //degree of jitter
    rotate(radians(jitter));
    rect(0,0,20,20);
    popMatrix();
  }
}


