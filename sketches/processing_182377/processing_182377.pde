
int num=10, frames=100;
float radius=150, alpha, theta;

void setup() {
  size(750, 540);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw() {
  background(#202020);
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pushMatrix();
    rotate(TWO_PI/num*i);
    fill(360.0/num*i, 90, 100, 100);
    float v = map(sin(theta), -1, 1, -10, 50);
    ellipse(radius/2+v, 0, radius, radius);
    popMatrix();
  }
  theta+=TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.png");
}
