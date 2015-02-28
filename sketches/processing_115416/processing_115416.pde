
void setup() {
  size(400, 400);
  background(255);
  noStroke();
  rectMode(CENTER);
  frameRate(29);
}

void draw() {

  translate(width/2, height/2);

  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  fill(r, g, b, 180);

  rotate(r);
  rect(0, 20, 100, 10);

  rotate(PI);
  rect(0, 100, 200, 30);
}
