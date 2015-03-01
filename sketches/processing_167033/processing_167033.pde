
int num =25;
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
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(-theta+offSet),-1,1, 0+offSet, TWO_PI+offSet);
    arc(0, 0, sz, sz, arcEnd-PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .0523;
   
}

