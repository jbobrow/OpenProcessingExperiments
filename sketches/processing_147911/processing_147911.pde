
void setup() {
  size(500, 500);
  background(255);
  //frameRate(50);
}

void draw() {
  if (mousePressed) {
  } 
  else {
    background(255);
  }
  translate(250, 250);
  for (int y = 0; y < 500; y++) {
    rotate(millis()/10000.0);
    float x = randomGaussian() * 15;
    strokeWeight(2);
    stroke(x*10, 0, 0);
    if (keyPressed) {
      stroke(y, 0, 0);
    }
    line(0, y, 0 + x, y);
  }
}


