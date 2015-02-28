
float x, y;
float _x, _y;

void setup(){
  size(300, 300);
  background(120);
  noStroke();
  ellipseMode(CENTER);
  x = 0.0;
  y = 0.0;
}

void draw() {
  fill(0, 3);
  rect(0, 0, width, height);
  _x = map(x, 0, width, -PI, PI);
  _y = map(sin(_x), -1, 1, 0, height);
  fill(255);
  ellipse(x, _y, 4, 4);
  x = ++x % width;
}


