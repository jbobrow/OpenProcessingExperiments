
//how to rotate a rectangle
float rotation = 0;
void setup() {
  size(350, 500);
  //noLoop();
}
void draw () {
  background(200);
  pushMatrix();
  translate(200, 200);
  rotate(radians(rotation));
  rect(-15, -15, 30, 30);
  rotation +=10;
  popMatrix();
}

