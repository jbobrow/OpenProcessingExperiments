
int num =20;
float step, sz, offSet, theta, angle;

void setup() {
  size(1024, 768);
  strokeWeight(10);
  step = 35;
}

void draw() {
  background(22);
  translate(width/2.1, height*.50);
  angle=0;
  for (int i=0; i<num; i++) {
    stroke(255);
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI*2);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .0523;
  
}

