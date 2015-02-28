
void setup() {
  size(500, 500);
  smooth();
}


void draw() {
}


void blurredLine(float x1, float y1, float x2, float y2) {
  strokeJoin(MITER); //留め継ぎにする
  for(int i = 0; i < 3; i++) {
  float a = random(0, 5);
  float b = random(5, 10);
  float c = random(10, 5);
  float d = random(15, 20);
  line(x1 - a, y1 - b, x2 - c, y2 - d);
  line(x1 - d, y1 - c, x2 - b, y2 - a);
  line(x1 - b, y1 - d, x2 - a, y2 - c);
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

