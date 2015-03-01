
int num =200;
float step, sz, offSet, theta, angle;

void setup() {
  size(600, 600, JAVA2D);
  strokeWeight(2);
  strokeCap(PROJECT);
  step = 2;
}

void draw() {
  background(20);
  translate(300, 300);
  angle=0;
  colorMode(HSB,255,100,100);
  for (int i=0; i<num; i++) {
    stroke(255/num*i,90,90);
    noFill();
    sz = i*step;
    float offSet = TWO_PI*2/num*i;
    float arcEnd = map(sin(theta+offSet),-1,1, -TWO_PI-HALF_PI, TWO_PI);
    arc(0, 0, sz, sz, arcEnd-HALF_PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .0323;  
}
