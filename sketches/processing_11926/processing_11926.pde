
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
}

void blurredLine(float x1, float y1, float x2, float y2) {
  noFill();
  strokeWeight(0.3);
  stroke(0,0,0,100); 
  for(int i = 0 ; i<500 ; i++){
  rect(random(x1-10, x2+10), random(y1-10, y2+10),10,10);
  rect(random(x2-10, x1+10), random(y2-10, y1+10),10,10);
  }
  
  stroke(200);
  strokeWeight(0.1);
  for(int i = 0 ; i<100 ; i++){
  curve(100,100,random(width),random(height),random(width),random(height),200,200);
  }
 
}

void blurredRect(float x, float y, float w, float h) {
  blurredLine(x, y, x+w, y);
  blurredLine(x+w, y, x+w, y+h);
  blurredLine(x+w, y+h, x, y+h);
  blurredLine(x, y+h, x, y);
}

void mousePressed() {
  //マウスをクリックしたときに矩形を描く
  blurredRect(mouseX, mouseY, random(40, 100), random(40, 100));
}

void keyPressed() {
  //キーボートをクリックしたときに画像を保存
  save("blurredRect.png");
}

