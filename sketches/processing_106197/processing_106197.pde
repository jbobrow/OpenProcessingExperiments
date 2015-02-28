
PFont font;
float angle;

void setup() {
  size(200, 200);
  smooth();
  background(255);
  font = createFont("微软雅黑", 32);
  textFont(font, 64);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  angle+=0.01;
  rotate(angle);
  for (int i = 0; i< 10; i++) {
    pushMatrix();
    textAlign(CENTER);
    rotate(TWO_PI*i/10);
    fill(0, 120);
    text("竹", -10, 0);
    popMatrix();
  }
}



