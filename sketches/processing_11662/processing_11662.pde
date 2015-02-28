
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
    strokeWeight(random(1, 6));
    stroke(0, 0, 0, random(10, 60));
    line(x1, y1, x2, y2);
    for(int i = 0 ; i < 20 ; i++){
      point(random(x1-5, x1+5), random(y1-5, y1+5));
      point(random(x2-5, x2+5), random(y2-5, y2+5));
    }
  //ここまでを書き替える
}


void keyPressed() {
  //キーボートをクリックしたときに画像を保存
  save("blurredLine.png");
}

