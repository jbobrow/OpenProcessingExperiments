
void setup(){
  size(500, 500);
  noLoop(); //繰り返し無しを設定
  colorMode(HSB, 360, 256, 256);
  background(110, 160, 200); //枠無しを設定
  noStroke(); //なめらか設定
}

void draw(){
//背景
pushMatrix();
for(int i = 0; i < 1200; i++) {
    drawGreen(0, 0 , random(20, 100));
}
//赤い部分

for(int i = 0; i < 5000; i++) {
    drawRed(0, 0, random(5, 50));
}
popMatrix();
//種
for(int i = 0; i < 15; i++){
  drawTane(0, 0, 30, 15);
}
save("watermelon.png");
}

//↓↓詳細設定
//背景
void drawGreen(int x, int y, float d) {
  pushMatrix();
  translate(random(width), random(height));
  rotate(random(PI/2));
  fill(random(100, 150), 255, random(150,255), 100);
  ellipse(x, y, d, d);
  popMatrix();
}
//赤い部分
void drawRed(int x, int y, float d){
  pushMatrix();
  translate(random(width), random(150, 500));
  rotate(random(PI/2));
  fill(0, random(200, 256), random(200, 256), 100);
  rect(x, y, d, d);
  popMatrix();
}
//種
void drawTane(int x, int y, int d, int e){
  pushMatrix();
  translate(random(width), random(200, 500));
  rotate(random(PI/2));
  fill(0, 0, 0);
  ellipse(x, y, d, e);
  popMatrix();
}


