
void setup() {
  colorMode(HSB, 360, 100, 100);
  size(236, 236);
  frameRate(1);
  background(0);
  noStroke();
}

void draw() {
  background(0);
  int s = second();
  int m = minute();
  int h = hour();
  //時間
  fill(300, 100, 100, 200);
  rect(width/2, height/2, h*5, h*5);
  rect(width/2, height/2, h*(-5), h*(-5));
  rect(width/2, height/2, h*5, h*(-5));
  rect(width/2, height/2, h*(-5), h*5);
  //分
  fill(60, 100, 100, 150);
  rect(width, height, m*(-4), m*(-4));
  //秒
  fill(180, 100, 100, 100);
  rect(0, 0, s*4, s*4);
} 
