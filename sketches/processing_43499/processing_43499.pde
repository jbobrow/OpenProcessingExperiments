
int num = 50; //円の個数
int[] x = new int[num]; //x座標を記録する配列
int[] y = new int[num]; //y座標を記録する配列

void setup() {
  size(600, 300);
}

void draw() {
   background(204); //画面をリセット
  //配列を参照して円を描画する
  for(int i = 0 ; i < num ; i++) {
    fill(i * 3);
    ellipse(x[i], y[i], i, i);
  }
}

//マウスが動いたときの処理：マウスの座標を記録する
void mouseMoved() {
  //配列の値をひとつ後ろへ移動する
  for(int i = num - 1 ; i > 0 ; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  x[0] = mouseX;
  y[0] = mouseY;
}
