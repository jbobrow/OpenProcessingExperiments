
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
  noSmooth();
  strokeWeight(random(0.1, 3));
  line(x1, y1, x2, y2);
  strokeWeight(random(0.5, 3));
  line(x1 + 2, y1 + 2, x2 + 1, y2 + 1);
  //ここまでを書き替える
}


void keyPressed() {
  //キーボートをクリックしたときに画像を保存
  save("blurredLine.png");
}

