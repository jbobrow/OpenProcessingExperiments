
int num=30, step=10;
float theta;
int vel=1;
void setup() {
  size(500, 500);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(237, 136, 34);
  float offSet = TWO_PI/num;
  for (int i=0; i<num; i++) {
    fill(20, i*2);
    float sz = 20+i*step;
    float corner = map(sin(theta+offSet*i), -1, 1, sz*.50, sz/6);
    rect(width/2, height/2, sz, sz, corner);
  }
  for (int i=0; i<num; i++) {
    stroke(220);
    strokeWeight(5);
    noFill();
    float sz = 20+i*step;
    ellipse(width/2, height/2, sz, sz);
  }
  theta += 0.0523;
  num=num+vel;
  if ( num > 
  40) {
    vel= -1;
  }
  if (num < 0) {
    vel = 1;
  }
}

