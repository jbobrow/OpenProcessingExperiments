
void setup() {
  size(400, 400);
  background(137, 181, 242);
}

void draw() {
  if (mousePressed) {
    for (int a=25; a<width-15; a+=25) {
      for (int b=25; b<height; b+=35) {
        block(a, b);
        spot(a, b);
      }
    }
  }
}




void spot(float x, float y) {
  fill(62, random(0, 255), random(0, 80));
  ellipse(x, y, 20, 20);
}

void block(float x, float y) {
  pushMatrix();
  translate(x-25,y-27);
  fill(255, random(0, 40), random(0, 33));
  rectMode(CORNER);
  rect(35, 30, 5, 30);
  popMatrix();
}

