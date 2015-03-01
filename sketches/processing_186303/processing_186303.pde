
int num = 4000, frames=120;
float theta;

void setup() {
  size(540, 540);
}

void draw() {
  randomSeed(5656);
  background(20);
  fill(255,100);
  noStroke();
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float r = random(TWO_PI);
    rotate(r);
    float d =  random(width*.05, width*.35);
    float x = map(sin(theta+random(TWO_PI)), -1, 1, 0, d);
    float sz = random(2, 4);
    ellipse(x, 0, sz, sz);
    popMatrix();
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}
