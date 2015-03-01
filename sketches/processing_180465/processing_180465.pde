
int num = 30;
float step, sz, theta, angle, offSet, arcEnd;

void setup() {
  size(600, 400);
  strokeWeight(8);
  step = 18;
}

void draw() {
  background(20);
  translate(width*.5, height*.8);
  angle=0;
  for (int i=0; i<num; i++) {
    stroke(255);
    noFill();
    sz = i*step+1;
    offSet = TWO_PI*i*.8/num;
    arcEnd = map(sin(theta+offSet),-1,1, PI+.01, TWO_PI);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += PI / 150.;
}
