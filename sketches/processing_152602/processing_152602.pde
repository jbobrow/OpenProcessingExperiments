
int num =20;
float step, sz, offSet, theta, angle;

void setup() {
  size(1024, 1024);
  strokeWeight(10);
  step = 22;
}

void draw() {
  background(20);
  translate(width/2, height*.5);
  angle=0;
  colorMode(100,100,100,100);
  for (int i=0; i<num; i++) {
    stroke(255/num*i,90,90);
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI+PI/1);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .05;  
}

