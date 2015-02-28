
// 初回に1回だけ実行
void setup() {
  size(320, 480); // ウィンドウを幅320px、高さ480pxにする
  smooth(); // アンチエイリアスをオンにする（境界を滑らかに）
  noStroke(); // 線を描かない
  fill(0); // 塗り色を黒にする
  noLoop(); // draw関数を繰り返し実行しない（1回だけ実行）
}

// 繰り返し実行
void draw() {
  ellipse(50, 50, 20, 20); // 座標(50, 50) に横直径20px、縦直径20pxの楕円を描く
}

