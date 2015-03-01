
int num =22;
float step, sz, offSet, theta, angle;

void setup() {
  size(600, 600);
  strokeWeight(7);
  step = 20;
}

void draw() {
  background(#F1F0EB);
  translate(width/2, height*.5);
  angle=0;
  colorMode(HSB,255,100,100);
  for (int i=0; i<num; i++) {
    float s = map(i,0,num,100,200);
    stroke(s,90,90);
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(theta+offSet/2),-1,1, PI, TWO_PI+PI/2);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .0523; 
}

