
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
}

void blurredLine(float x1, float y1, float x2, float y2) {
  for(int i = 0; i < 12; i++){
    strokeWeight(random(2, 4));
    stroke(0, random(20, 100));
    line(x1 + i , y1 + i, x2 + i, y2 + i);
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

