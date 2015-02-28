
void setup() {
  size(500, 500);
  smooth();
}


void draw() {
}


void blurredLine(float x1, float y1, float x2, float y2) {
  //ここから
 strokeWeight(random(1, 2));
 stroke(0, 0, 0, random(20, 60));
 fill(0, 0, 0, 60);
 for(int i = 0 ; i < 30 ; i++){
   line((random(x1, x1+8)), (random(y1, y1-8)), (random(x2, x2+8)), (random(y2, y2+8)));  
   ellipse((random(x1, x2)), (random(y1, y2)), random(2, 7), random(2, 7));
   ellipse((random(x2, x1)), (random(y2, y1)), random(2, 7), random(2, 7));
 }
  //ここまでを書き替える
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

