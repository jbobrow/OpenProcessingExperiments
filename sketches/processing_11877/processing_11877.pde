
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
}

void blurredLine(float x1, float y1, float x2, float y2) {
  strokeWeight(random(5,10));
  stroke(0,0,0,30);
  for(int i = 0 ; i < 10 ; i++){
  line(x1 +random(10), y1 +random(10), x2 +random(10), y2 +random(10));
  }
  
  strokeWeight(random(0.1,0.3));
  stroke(0,0,0,255);
  for(int i = 0 ; i < 20 ; i++){
  line(x1 +random(10), y1 +random(10), x2 +random(10), y2 + random(10));
  }
}

void blurredRect(float x, float y, float w, float h) {
  blurredLine(x, y, x+w, y);
  blurredLine(x+w, y, x+w, y+h);
  blurredLine(x+w, y+h, x, y+h);
  blurredLine(x, y+h, x, y);
}

void mousePressed() {
  //マウスをクリックしたときに矩形を描く
  blurredRect(mouseX, mouseY, random(40, 100), random(40, 100));
}

void keyPressed() {
  //キーボートをクリックしたときに画像を保存
  save("blurredRect.png");
}

