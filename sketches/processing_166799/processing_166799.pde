
float[][] eColor = new float[3][5];    //円の色
float[][] speed = {{1.5, 2.5, 9.0, 7.2, 10.9}, 
                   {0.5, 2.0, 5.0, 4.0, 10.0}, 
                   {1.5, 12.0, 7.0, 1.0, 0.5}};    //円の色の変化のスピード
 
void setup() {
  size(400, 200);
  background(255);
  smooth();
  noStroke();
  fill(0);
  rectMode(CENTER);
 
  for (int y = 0; y < 3; y ++) {
    for (int x = 0; x < 5; x ++) {
      eColor[y][x] = 0;    //円の色を黒に設定
    }
  }
}
 
void draw() {
  background(255);
 
  for (int y = 0; y < 3; y ++) {
 
    for (int x = 0; x < 5; x ++) {
      eColor[y][x] += speed[y][x];    //円の色を変化させる
      //もし円の色が255を超えたか0未満になったら、方向を変える
      if (eColor[y][x] > 255 || eColor[y][x] < 0) speed[y][x] = -speed[y][x];
 
      fill(0, eColor[y][x], 255, 127);
      rect(x*100, y*100, 100, 100);    //円を描く
 
      fill(0, eColor[y][x], 0, 127);
      ellipse(x*100, y*100, 100, 100);    //円を描く
 
      fill(255, eColor[y][x], 0, 127);
      ellipse(x*100+50, y*100+50, 100, 100);    //円を描く
    }
  }
}


