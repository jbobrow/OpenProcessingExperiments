
int num=30;
float theta;

void setup() {
  size(500, 500);
  background(0);
  stroke(255,200);
  strokeWeight(2);
  colorMode(HSB,255,100,100);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float offSet = TWO_PI/num*i;
    rotate(offSet);
    float x1 = 0;
    float x2 = x1+50 ;
    float x3 = map(sin(theta+offSet*5),-1,1,100,150);
    float x4 = x3 + 50;
    int f = 100;
    fill(f,100,100,100);
    bezier(x1, 0, 100, -100, x3, 50, x4, -100);
    popMatrix();
  }
  theta -= 0.0523;
}

