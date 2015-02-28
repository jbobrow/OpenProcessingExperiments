
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
  stroke(random(80, 100));
  strokeWeight(random(0.2, 0.8));
  line(x1, y1, x2, y2);
  strokeWeight(random(0.4, 1));
  line(x1 + 1, y1 + 1, x2 + 1, y2 + 1);
}

void keyPressed() {
  //キーボートをクリックしたときに画像を保存
  save("blurredLine.png");
}

