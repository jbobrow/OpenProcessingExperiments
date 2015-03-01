
float theta,sz;
int num = 150, min=40, max=100;

void setup() {
  size(500, 500);
  colorMode(HSB, num,100,100);
}


void draw() {
  background(0);
  stroke(255,100);
  fill(255,5);
  noStroke();
  for (int i=0; i<num; i++) {
    fill(i,90,100,25);
    float offSet = TWO_PI/num*i;
    float y = map(sin(theta+offSet), -1, 1, height*.2, height*.8);
    float x = map(sin(theta-offSet), -1, 1, width*.2, width*.8);
    float sz = map(sin(theta*1+offSet*2), -1, 1, min, max);

    ellipse(x, y, sz*1.5, sz);
  }
  theta += 0.0523/3;
}

