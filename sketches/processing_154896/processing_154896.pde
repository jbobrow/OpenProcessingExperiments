
float r, theta;

void setup() {
  size(500, 500);
  rectMode(CENTER);
}

void draw() {
  background(255);
  drawLines(width/2, height/2,10);
  theta += 0.0523;
}

void drawLines(int _x, int _y, int _n) {
  fill(0);
  int num=_n;
  translate(_x, _y);
  pushMatrix();
  rotate(r);
  for (int i=0; i<num; i++) {
    float w = map(sin(theta+(TWO_PI/num*i)),-1,1,width*.1,width*1.2);
    float h = 60;
    float x = 0;
    float y = -(num*h*1.5/2)+i*h*1.5;
    rect(x, y, w, h);
  }
  popMatrix();
  r += 0.0523/2;
}

