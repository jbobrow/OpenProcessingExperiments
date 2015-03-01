
float radius = 150, theta = 0;
int num = 20, frames = 100;
void setup() {
  size (800, 800);
  colorMode (HSB, 360, 100, 100);
  noStroke();
}
void draw() {
  background(0, 0, 20);
  translate(width/2, height/2);
  float v = map(sin(theta), -1, 1, 0, 50);
  float w = map(cos(theta+PI/2), -1, 1, 0, 50);
  for (int i = 0; i < num; i++) {
    pushMatrix();
    rotate(TWO_PI/num*i);
    fill(360/num*i, 90, 100, 100);
    if (i%2==0) {
      ellipse(radius/2+v, 0, radius, radius);
    } else {
      ellipse(radius/2+w, 0, radius, radius);
    }
    popMatrix();
  }
  theta +=TWO_PI/frames;
}

