
int side = 20;

void setup() {
  size(320, 580);
  noLoop();
}
  
void draw() {
  background(225);
  fill(0, 0, 0, 0);
  smooth();
  
  for (int i = 0; i < 12; i++) {
    for (int j = 0; j < 24; j++) {
      pushMatrix();
      translate(i*side + 40, j*side + 40);
      rotate(random(PI*j/-54.0, PI*j/54.0)); //pick something good for this
      rect(0, 0, side, side);
      popMatrix();
    }
  }
}
