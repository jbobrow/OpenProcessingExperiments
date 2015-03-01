
long rs;
int num = 5000, frames=90;
float theta;

void setup() {
  size(750, 500);
  rs = (long) random(123456);
  noStroke();
  background(0);
}

void draw() {
  fill(0, 50);
  rect(0, 0, width, height);
  fill(255, 255);
  randomSeed(rs);
  for (int i=0; i<num; i++) {
    float x = random(width);
    float y2=80;
    float y = random(height/2-y2, height/2+y2);
    float offSet = map(x, 0, width, 0, TWO_PI);
    float d=50;
    float varY = map(sin(theta+offSet), -1, 1, -d, d);
    float varX = map(sin(theta+offSet*2), -1, 1, -d*2, d*2);
    float sz = 1;
    ellipse(x+varX, y+varY, sz, sz);
  }
  theta+= TWO_PI/frames;
  //if (frameCount>120 && frameCount<frames+120) saveFrame("image-###.gif");
}

