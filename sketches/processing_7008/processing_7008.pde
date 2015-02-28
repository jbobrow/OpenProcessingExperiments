
void setup() {
  size(320, 480);
  background(204);
  smooth();
  noStroke();
  fill(0);
  // noLoop();
}

void draw() {
  if (mousePressed == true) {
    // マウスボタンが押されているときに以下を実行
    ellipse(mouseX, mouseY, 20, 20); // マウスポインタの位置を中心にして楕円を描く
  }
}

void keyPressed() {
  // キーボードが押されたら、画面をリセット
  background(204);
}

