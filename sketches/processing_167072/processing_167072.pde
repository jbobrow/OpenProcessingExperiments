
int num =20;
float step, sz, offSet, theta, angle;
  
void setup() {
  size(600, 600);
  strokeWeight(5);
  step = 22;
}
  
void draw() {
  background(20);
  translate(width/2, height*.5);
  angle=0;
  for (int i=0; i<num; i++) {
    stroke(255*(i)/num);
    noFill();
    sz = i*step;
    float offSet = TWO_PI*sin(theta/10)/num*i;
    strokeWeight(10/num*i);
    stroke(255*(num-i)/num);
    float arcEnd = map(cos(theta-offSet),-1,1,  TWO_PI+offSet,0+offSet);
    arc(0, 0, sz, sz, arcEnd-PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .0523;
    
}
