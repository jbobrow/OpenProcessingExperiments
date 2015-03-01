
int num=100;
float theta;

void setup() {
  size(500, 500);
  background(0);
  stroke(255,50);
  strokeWeight(09);
  fill(255, 50);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float offSet = TWO_PI/num*i;
    rotate(offSet);
    float x1 = map(sin(theta+offSet*5),-1,1,0,80);
    float x2 = x1 -50 ;
    float x3 = 100;
    float x4 = x3 + 100;
    bezier(x1, 0, 100, -100, x3, 50, x4, -100);
    popMatrix();
  }
  theta -= 0.0523;
}

