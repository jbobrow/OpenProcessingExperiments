
float rotation = 0;
void setup() {
  size(350, 350);
}
void draw() {
  background(#BF12FF);
  fill(255, 255, 255);
  pushMatrix();
  translate(200, 200);
  rotate(radians(rotation));
  rect(-15, -15, 30, 30);
  rotation += 8;
  popMatrix();
  fill(40, 140, 250);
  rect(195, 195, 10, 10);
}
