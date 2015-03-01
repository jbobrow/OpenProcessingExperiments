
float r, theta;

void setup() {
  size(500, 500);
  rectMode(CENTER);
}

void draw() {
  background(255);
  drawLines(width/2, height/2, 40, -1);
  stroke(255);
  noFill();
  strokeWeight(145);
  ellipse(width/2, height/2, width*1.2, height*1.2);
  theta += 0.0523;
}

void drawLines(int _x, int _y, int _n, int _dir) {
  fill(0);
  noStroke();
  int num=_n;
  pushMatrix();
  translate(_x, _y);
  rotate(r*_dir);
  for (int i=0; i<num; i++) {
    float w = map(sin(theta+(TWO_PI/num*i)*2), -1, 1, width*.3, width*1.5);
    float h = 20;
    int x = 0;
    int y = int(-(num*h*1.5/2)+i*h*1.5);
    rect(x, y, w, h);
  }
  popMatrix();
  r += 0.0523/2;
}

