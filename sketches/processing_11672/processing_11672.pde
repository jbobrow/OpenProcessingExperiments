
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
  line(x1, y1, x2, y2);
  for(int i = 0 ; i < 10 ; i++){
  noStroke();
  fill(random(0,10), random(0,10), random(0,10), random(60, 99));
  ellipse(random(x1-5, x1+5), random(y1-5, y1+5), random(3, 5), random(3, 5));  
  ellipse(random(x2-10, x2+10), random(y2-10, y2+10), random(1, 2), random(1, 2));    
}
  //ここまでを書き替える
}

void keyPressed() {
  //キーボートをクリックしたときに画像を保存
  save("blurredLine.png");
}


