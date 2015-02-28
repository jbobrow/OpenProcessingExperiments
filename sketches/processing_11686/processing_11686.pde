
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  if(mousePressed == true){

    blurredLine(pmouseX, pmouseY, mouseX, mouseY);

  }
}

void blurredLine(float x1, float y1, float x2, float y2) {
  //ここから
  for(int i = 0; i< 7; i++){
    stroke(0, random(255));
    line(x1+ 1 * i, y1+ 1 * i , x2+ 1 * i, y2+ 1 * i);
  }
}
  //ここまでを書き替える

void keyPressed() {
  //キーボートをクリックしたときに画像を保存
  save("blurredLine.png");
}

