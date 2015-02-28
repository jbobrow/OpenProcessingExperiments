
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
}

void blurredLine(float x1, float y1, float x2, float y2) {
  stroke(0, 0, 0, 50);
  line(x1, y1, x2, y2);
  line(x1, y1, x2+random(-3,  3), y2+3);
  line(x1-3, y1+random(-3,  3), x2, y2);
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

