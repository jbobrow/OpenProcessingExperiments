
int d, f;

void setup() {
  colorMode(RGB, 255, 255, 255);
  size(236, 236);
  frameRate(1);
  background(0);
  noStroke();
  f = 5;
  d = 4;
}

void draw() {
  background(0);
  int s = second();
  int m = minute();
  int h = hour();
  
  //時間
  fill(255, 0, 255, 220);
  rect(width/2, height/2, h*f, h*f);
  rect(width/2, height/2, h*(-f), h*(-f));
  rect(width/2, height/2, h*f, h*(-f));
  rect(width/2, height/2, h*(-f), h*f);
  
  //分
  fill(255, 255, 0, 190);
  rect(width, height, m*(-d), m*(-d));
  
  //秒
  fill(0, 255, 255, 160);
  rect(0, 0, s*d, s*d);
  
  //画像を保存
  //save("24clock3.png");
}
