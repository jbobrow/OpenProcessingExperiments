
void setup() {
  size(500, 500);
  noStroke();
  smooth();
}
 
void draw() {
  float x = mouseX;
  float y = mouseY;
  float ix = width - mouseX;
  float iy = height - mouseY;
  background(255);
  fill(240, 110, 230 , 100);
  ellipse(x, height/2, y, y);
  fill(100,220, 180, 100);
  ellipse(ix, height/2, iy, iy);
}



