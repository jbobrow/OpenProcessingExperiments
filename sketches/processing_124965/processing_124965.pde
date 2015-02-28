
int x = 0;
int y = 0;
int w = 0;
int h = 0;
int r = 0;
void setup(){
  size(600, 400);
  background(240);
  noFill();
  smooth();
  x = width/2;
  y = height/2;
  stroke(0);
}
void draw(){
  translate(width/2, height/2);
  rotate(radians(r));
  translate(-width/2, -height/2);
  noFill();
  ellipse(x, y, w, h);
  ellipse(y, x, w, h);
  ellipse(x, y, h, w);
  ellipse(y, x, h, w);
  x += 1;
  y += 1;
  w -= 2;
  h -= 2;
  r += 1;
}
