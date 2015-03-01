
int num = 120, dx=100, frames=120;
float theta;

void setup() {
  size(540, 540, P2D);
  smooth(4);
  stroke(255, 150);
}

void draw() {
  background(20);

  for (int i=0; i<num; i++) {
    float offSet = TWO_PI/num*i;
    pushMatrix();
    float x = width/2 + map(sin(theta+offSet*1), -1, 1, -dx, dx);
    float y = height/2;
    float d = map(sin(theta+offSet*2), -1, 1, 50, 150);
    translate(x, y);
    float r = offSet;
    rotate(r);
    line(-d, 0, d, 0);
    popMatrix();
  }

  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

