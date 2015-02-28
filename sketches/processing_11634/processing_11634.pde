
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
  stroke(0,0,0,random(0,200));
  strokeWeight(0.3);
  line(x1, y1, x2, y2);
  line(x1 +1, y1 +1, x2 +1, y2 +1);
  line(x1 +2, y1 +2, x2 +2, y2 +2);
  strokeWeight(0.5);
  line(x1 +3, y1 +3, x2 +3, y2 +3);
  strokeWeight(0.3);
  line(x1 +4, y1 +4, x2 +4, y2 +4);
  line(x1 +7, y1 +7, x2 +7, y2 +7);
}

void keyPressed() {
  //キーボートをクリックしたときに画像を保存
  save("blurredLine.png");
}

