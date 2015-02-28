
void setup() {
  size(500, 500);
  smooth();
}


void draw() {
}


void blurredLine(float x1, float y1, float x2, float y2) {
  //ここから
  line(x1, y1, x2, y2);
  for(int i = 0 ; i < 800 ; i++){  
  point(random(x1-5, x2+5), random(y1-5, y2+5));
  point(random(x2-5, x1+5), random(y2-5, y1+5));
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


