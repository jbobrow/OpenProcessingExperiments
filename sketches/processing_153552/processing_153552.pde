
int num =20;
float step, sz, offSet, theta, angle;
 
void setup() {
  size(600, 600);
  strokeWeight(5);
  step = 20;
}
 
void draw() {
  background(alpha);
  translate(width/2, height*.5);
  angle=0;
  colorMode(HSB,255,100,100);
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
  theta += .0423; 
}

