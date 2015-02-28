
void setup() {
  size(500, 500);
}

void draw() {

  noStroke();
  background(50);
  float h = map(hour(), 0, 24, 0, 400);
  float m = map(minute(), 0, 59, 0, h);
  float s = map(second(), 0, 59, 0, m);
  


  fill(255, 33);
  ellipse(width/2, height/2, m, m);
  ellipse(width/2, height/2, h, h);
  stroke(193, 37, 37, 170);
  noFill();
  ellipse(width/2, height/2, s, s);
}



