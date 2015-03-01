
int num = 50;
float theta, yStart;

void setup() {
  size(500, 500);
  noFill();
  strokeCap(SQUARE);
}

void draw() {
  background(#202020);
  translate(width/2, height/2);
  strokeWeight(2);
  stroke(#00ffff,200);
  for (int i=0; i<num; i++) {
    fill(#00ffff, 75);
    noStroke();
    pushMatrix();
    float offSet = TWO_PI/num*i;
    rotate(offSet);
    float sz = map(sin(theta+offSet*(num/10)), -1, 1, 50, 120);
    float start = theta/2;
    float end = start + PI;
    yStart = width*.25;
    arc(0, yStart, sz, sz, start, end);
    popMatrix();
  }
  theta += 0.0523;
}

