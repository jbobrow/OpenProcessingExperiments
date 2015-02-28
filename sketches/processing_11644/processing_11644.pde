
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
  strokeWeight(random(2.0 , 2.5));
  stroke(0, 0, 0, random(50, 100));
  line(x1, y1, x2 + 1, y2 + 1);
  point(x2 + 1, y2 + 1);
}


void keyPressed() {
  //キーボートをクリックしたときに画像を保存
  save("blurredLine.png");
}

