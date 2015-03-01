
int num =20;
float step, sz, offSet, theta, angle;

void setup() {
  size(600, 600);
  strokeWeight(1);
  step = 27;
}

void draw() {
  background(20);
  translate(width/2, height/2);
  angle=0;
  for (int i=0; i<num; i++) {
    stroke();
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i*1.2;
    float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI*1.49);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .025;
  
}

void draw2() {
  background(20);
  translate(width/2, height/2);
  angle=0;
  for (int i=0; i<num; i++) {
    stroke();
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .1;
  
}
