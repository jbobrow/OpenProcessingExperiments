
float amplitude = (PI/2)/2;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  float pos = (amplitude*cos(millis()/750.0));
  translate(width/2, 0);
  rotate(pos);
  stroke(255);
  line(0, 0, 0, 200);
  fill(0, 0, 255);
  noStroke();
  ellipse(0, 200, 30, 30);
}


