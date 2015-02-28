
float ang;
float x, y;

void setup() {
  size(400, 400);
}


void draw() {
  fill(0, 20);
  rect(-1, 1, width, height);

  x = cos(ang) * 100 + 200;
  // y = sin(ang)*100 + 200;
  ang += .05;

  stroke(255);
  strokeWeight(3);
  point(x, 200);
  //point(200,y);
}


