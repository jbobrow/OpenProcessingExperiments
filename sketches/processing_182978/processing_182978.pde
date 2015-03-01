
long rs;
int num = 3000, frames=80;
float theta;

void setup() {
  size(500, 500);
  rs = (long) random(123456);
  noStroke();
  background(0);
}

void draw() {
  background(20);
  fill(255, 255);
  randomSeed(rs);
  for (int i=0; i<num; i++) {
    float x = random(width);
    float y2=80;
    float y = random(height/2-y2, height/2+y2);
    float offSet = map(x, 0, width, 0, TWO_PI);
    float d=50;
    float varY = map(sin(theta+offSet), -1, 1, -d, d);
    float varX = map(sin(theta+offSet), -1, 1, -d, d);
    float sz = 1;
    stroke(255,150);
    line(x+varX,y+varY,x+cos(theta)*25,y+varY+sin(theta)*25);
  }
  theta+= TWO_PI/frames;
  //if (frameCount>120 && frameCount<frames+120) saveFrame("image-###.gif");
}

