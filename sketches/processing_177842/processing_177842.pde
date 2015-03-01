
int num =20;
float step, sz, offSet, theta, angle;

void setup() {
  size(450, 225);
  strokeWeight(5);
  step = 22;
}

void draw() {
  background(66,180,230);
  translate(width/2, height-10);
  angle=0;
  for (int i=0; i<num; i++) {
    stroke(25);
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .0523;
  
}

