
float step, sz, offSet, theta, angle;
float d = .7;
int num = 20/d;

void setup() {
  size(600, 600);
  step = 22;
  angle = -PI/2;
}

void draw() {
  background(#181817);
  translate(width/2, height/2);
  noFill();
  stroke(#EE4444);
  strokeWeight(4*d);
  for (int i=0; i<num; i++) {
    sz = i*step*d;
    arc(0, 0, sz, sz, 0, 2*PI);
  }
  strokeWeight(5*d);
  for (int i=0; i<num; i++) {
    sz = i*step*d;
    float a = angle;
    float offSet = TWO_PI/num*i;
    float arcEnd  = max(.01,PI/2*(1+sin(theta+offSet)));
    arc(0, 0, sz, sz, a-arcEnd, a+arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta -= PI/60;
}
