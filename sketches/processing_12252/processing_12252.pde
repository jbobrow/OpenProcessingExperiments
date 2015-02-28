
int x; // ボディの中心のx座標
int y; // ボディの中心のy座標
int h = 60; // ボディの高さ、幅の基準
int d = 30; // 車輪の直径の基準
int speed = 1; // 進む速さ

void setup() {
  size(400, 400);
  x = -h; // ボディの中心のx座標
  y = height / 2; // ボディの中心のy座標
  //noLoop(); // 繰り返さない
}

void draw() {
  background(255); // 画面をリセットする
  drawBus(x, y); // バスを描く
  x = x + speed; // 進む
  if(x > width + h){ 
    x = -h; // バスが右端まで行ったら左端に戻る
  }
}

void drawBus(int x, int y) {
  rectMode(CENTER);
  rect(x, y, h*2, h); // ボディ
  ellipse(x-35, y+h/2, d, d); // 後輪・外側
  ellipse(x+35, y+h/2, d, d); // 前輪・外側
  ellipse(x-35, y+h/2, d-10, d-10); // 後輪・内側
  ellipse(x+35, y+h/2, d-10, d-10); // 前輪・内側
  rectMode(CORNER);
  rect(x+45, y-20, h/4, h/3); // 窓・前
  rect(x-5, y-20, h/2, h/3); // 窓・中
  rect(x-50, y-20, h/2, h/3); // 窓・後
}

