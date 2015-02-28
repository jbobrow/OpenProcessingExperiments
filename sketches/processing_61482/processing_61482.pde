
int a;
int b;
int x;
int y;
float r;
void setup() {
  size(400, 400);
  background(0);
  smooth();
  noStroke();
  ellipseMode(CENTER);
}

void draw() {
  a = 50;
  b = 5;
  x = mouseX;
  y = mouseY;
  r = random(255,50);
  fill(0, 0, 0);
  rect(0, 0, 400, 400);
  fill(x,y,r);
  ellipse(a+x, a+y, x, y);
  fill(r, y, x);
  ellipse(b+x, b+y, x, y);
  fill(x, r, y);
  ellipse(a+y, a+x, y, x);
  fill(y, x,r);
  ellipse(b+y,b+x, y, x);
}

