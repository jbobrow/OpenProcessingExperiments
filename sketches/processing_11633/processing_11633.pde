
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
  
  stroke(0, 0, 0, 100);
  line(x1-random(1, 10), y1-5, x2-4, y2-5);
  line(x1-1, y1-random(1, 10), x2-1, y2-3);
  line(x1-2, y1-1, x2-random(2, 5), y2-1);
  line(x1, y1, x2, y2);
  //ここまでを書き替える
}

void keyPressed() {
  //キーボートをクリックしたときに画像を保存
  save("blurredLine.png");
}

