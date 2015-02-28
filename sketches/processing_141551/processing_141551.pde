
int num = 100;
float[] posX = new float[num];
float unit, theta, x;

void setup() {
  size(500, 500);
  noFill();
  stroke(0);
  strokeWeight(1);
  unit = width/num;
}


void draw() {
  background(255);
  for (int i=0; i<num; i++) {
    x = map(sin(theta+(TWO_PI/num)*i), -1, 1, i*unit, width/2);
    line(x, 0, x+random(50), height);
  }
  theta += 0.0523;
}

