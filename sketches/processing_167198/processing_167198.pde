
int num =25;
float  step, sz, offSet, theta, angle;
  
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
    stroke(255*sin(PI*i/num));
    noFill();
    sz = i*step;

    float mposx = mouseX-300;
    float mposy = mouseY-300;
    float arcMid = atan(mposy/mposx);
    float offSet = TWO_PI/num*i;
    float arcLeft = arcMid + (-.1+.1*sin(-theta+offSet))*PI;
    float arcRight = arcLeft+PI*.1*sin(PI*i/num)
    strokeWeight(8*sin(PI*i/num));
    arc(mposx, mposy, sz, sz, arcLeft, arcRight);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .0523;
    
}
