
void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  background(0, 20, 100);
  smooth();
  noLoop();
}

void draw() {
  //赤
  for(int s = 0 ; s < 450 ; s++){
    drawred(random(width), random(height));
  }
  //種
  noStroke();
  for(int i = 0 ; i < 5 ; i++){
    fill(0, random(50, 100));
    drawSizuku(50+100*i, random(40, 60));
  }
  for(int i = 0 ; i < 7 ; i++){
    fill(20, 20, 80, random(100));
    drawSizuku(0+80*i, random(150, 160));
  }
  for(int i = 0 ; i < 8 ; i++){
    fill(0, random(100));
    drawSizuku(0+90*i, random(240, 260));
  }
  //下
  fill(40, 30, 100);
  rect(0, 450, 500, 500);
  fill(0, 100, 100);
  drawSizuku(450, 448);
}


void drawSizuku(float x, float y) {
  beginShape();
  curveVertex(x, y);
  curveVertex(x, y);
  curveVertex(x+10, y+30);
  curveVertex(x, y+40);
  curveVertex(x-10, y+30);
  curveVertex(x, y);
  endShape(CLOSE);
}
void drawred(float x, float y) {
  for(int i = 0; i < 15; i++){
    noStroke();
    fill(0, 100, 100, 2);
    float d = random(100);
    ellipse(x, y, d, d);
  }
}



