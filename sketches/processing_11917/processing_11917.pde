
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
}

void blurredLine(float x1, float y1, float x2, float y2) {
  for(int x = 0; x < 10; x++){
    strokeWeight(random(0.01, 0.02));
    fill(x*10, 10, 99);
    line(x1, y1, x2, y2);
    strokeWeight(random(0.03, 0.04));
    line(x1+1.2, y1+1.2, x2+1.2, y2+1.2);
    strokeWeight(random(0.05, 0.06));
    line(x1+2.4, y1+2.4, x2+2.4, y2+2.4);
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

