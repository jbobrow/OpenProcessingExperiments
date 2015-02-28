
void setup() {
  size(500, 500);
  smooth();
}


void draw() {
}


void blurredLine(float x1, float y1, float x2, float y2) {
  //ここから
  strokeWeight(3.0);
  stroke(0, random(30, 40));
  for(int i = 0; i < 90; i++) {
    //上辺と右辺
    point(random(x1, x2), random(y1, y2));
    
    //下辺と左辺
    point(random(x2, x1), random(y2, y1));
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

