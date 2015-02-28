
void setup() {
  size(500, 500);
  smooth();
}


void draw() {
}


void blurredLine(float x1, float y1, float x2, float y2) {
  //ここから
  noSmooth();
  stroke(0, 0, 0, random(200, 255));
  strokeWeight(random(0.5, 3));
  for(int i = 0; i < 6; i++){
    line(x1 + random(1, 8), y1 + random(1, 8), x2 + random(1, 8), y2 + random(1, 8));
  }
  //ここまでを書き替える
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

