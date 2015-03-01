
int sz = 400, num=20;
float theta, angle, rad = 60;

void setup() {
  size(500, 500);
  fill(0);
  stroke(255);
  strokeWeight(8);
}

void draw() {
  background(255);
  angle=0;
  for (int i=0; i<num; i++) {
    float x = width/2-rad/2 + cos(angle)*rad;
    float y = height/2 + sin(angle)*rad;
    float s = map(sin(theta+TWO_PI/num*i),-1,1,1,.6);
    float scal = 1-0.045*i;
    int f=i==num-1 ? 255 : 0;
    fill(f);
    ellipse(x-20, y, sz*scal*s, sz*scal*s);
    angle -= (PI/num);
  }
  theta +=0.0523;
}

