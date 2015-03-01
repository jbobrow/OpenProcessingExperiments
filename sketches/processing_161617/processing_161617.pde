
int th = 1000;


void setup() {
  size(1000, 1000);
  background(255);
  frameRate(20);
  noStroke();
}

void draw() {
  float c1 = random(128, 255);
  float c2 = random(128, 255);
  float c3 = random(128, 255);
  float a1 = random(th);
  float a2 = random(th);
  float a3 = random(th);
  float a4 = random(th);
  float a5 = random(th);
  float a6 = random(th);
  float o = random(100);
  float size = 100;
  fill(c1,c2,c3,o);
  triangle(a1,a2,a3,a4,a5,a6);
}
void mouseClicked(){
background(255);
}
