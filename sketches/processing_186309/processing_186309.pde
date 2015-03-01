
int num = 10000, frames=120;
float theta;

void setup() {
  size(750, 540);
}

void draw() {
  randomSeed(5656);
  background(20);
  noStroke();
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float r = random(TWO_PI);
    rotate(r);
    float s = 100;
    float d =  random(s-5, height*.35);
    float x = map(sin(theta+random(TWO_PI)), -1, 1, s, d);
    float sz = random(1, 2);
    fill(255,150);
    ellipse(x, 0, sz, sz);
    popMatrix();
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}
