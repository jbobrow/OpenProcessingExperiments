
void setup() {
  size(500, 500);
  colorMode(RGB);
  background(255);//白 
  smooth();
  noLoop();
  noStroke();
}

void draw() {
  //実
  fill(250, 0, 0, 230);
  rect(0, 0, width, height);
  
  //種
  for(int i = 0; i < 30; i++) {
    drawTane(random(150, width), random(80, 400));
  }
  filter(BLUR, 1);
  
  //食べかけ
  for(int i = 0; i < 1; i++) {
    pushMatrix();
    translate(random(250, width - 80), - 30);//再生する度変化
    drawTabekake(10, 0);
    popMatrix();
  }
   
  //縦の皮
  for(int i = 0; i < 200; i++) {
    pushMatrix();
    translate(0, random(height));
    drawKawa(0, 0);
    popMatrix();
  }
   
  //横の皮
  for(int i = 0; i < 150; i++) {
    pushMatrix();
    translate(random(width), height - 12);
    drawKawa(0, 0);
    popMatrix();
  }
}


//種
void drawTane(float x, float y) {
  fill(0, 0, 0);//黒
  float d = random(20, 25);
  rect(x, y, d, d);
}

//食べかけ
void drawTabekake(float x, float y) {
  fill(255, 255, 255);//白
  float d = random(70, 75);
  rect(x, y, d, d);
  rect(x + 80, y + 7, d, d);
  rect(x + 40, y + 5, d, d);
}

//皮
void drawKawa(float x, float y) {
  fill(0, random(240, 255), 0);//緑
  float d = random(10, 15);
  rect(x, y, d, d);
}

