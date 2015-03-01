
float theta, x, y, r, off, maxSz=100, sz;
int num=50;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  off = (width-2*maxSz)/num;
}

void draw() {
  background(0);
  stroke(255, 100);
  noFill();
  fill(255, 5);
  for (int i=0; i<num; i++) {
    float offSet = TWO_PI/num*i;
    x = map(sin(theta), -1, 1, sz+i*off, width-sz-i*off);
    y = map(sin(theta), -1, 1, height-sz, sz);
    r = map(sin(theta), -1, 1, 0, TWO_PI);
    sz = map(sin(theta*2+offSet), -1, 1, maxSz/2, maxSz);
    pushMatrix();
    translate(x, y);
    rotate(r);
    rect(0, 0, sz, sz, 10);
    rect(0, 0, sz*.7, sz*.7, 10);
    popMatrix();
  }
  theta += 0.0523/2;
  //if (frameCount%3==0 && theta<TWO_PI) saveFrame("image-###.gif");
}

