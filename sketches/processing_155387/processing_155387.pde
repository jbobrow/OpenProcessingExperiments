
float sz=30, theta;
int num = 10;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  fill(255, 0, 0);
  noStroke();
  translate(width/2, height/2);
  ellipse(0, 0, 400, 400);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float offSet=(PI/num)*i;
    rotate(offSet);
    float x = map(sin(theta+offSet), -1, 1, -200+sz/2, 200-sz/2);
    fill(255);
    ellipse(x, 0, sz, sz);
    popMatrix();
  }
  theta += 0.04;
}

