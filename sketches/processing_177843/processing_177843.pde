
int num=12, frames = 35;
float theta;

void setup() {
  size(500, 500);
}


void draw() {
  background(66,180,230);
  stroke(25);
  noFill();

  for (int i=0; i<num; i++) {
    float sz = i*35;
    float sw = map(sin(theta+TWO_PI/num*i), -1, 1, 1, 16);
    strokeWeight(sw);
    ellipse(width/2, height/2, sz, sz);
  }
  theta += TWO_PI/frames;
  // if (frameCount<=frames) saveFrame("image-###.gif");
}

