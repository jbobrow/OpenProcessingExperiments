
color[] tanzakuColor = {
  color(255, 230,   0), //yellow
  color(255,  26,   0), //red
  color(  1, 156, 197), //blue
  color(148,  30, 100), //purple
  color(255, 255, 255), //white
};

int tanzakuColorNum = 0;

void setup() {
  size(400, 100);
  rectMode(CENTER);
  noStroke();
  smooth();
  noLoop();
}

void draw() {
  background(0);
  drawNANANANA(30, 50);
  
  
}

void drawNANANANA (float x, float y) {
  for (int i = 0; i < 4; i++) {
    drawN(x + i*70, y);
    drawA(x + 35 + i*70, y);
  }

}

void changeColor() {
  fill(tanzakuColor[tanzakuColorNum]);
  tanzakuColorNum++;
  tanzakuColorNum %= 5;
}


void drawN (float x, float y) {
  
  pushMatrix();
  translate(x, y);
  
  pushMatrix();
  translate(-10, 0);
  changeColor();
  rect(0, 0, 8, 44);
  popMatrix();
  
  pushMatrix();
  rotate(-19*PI/180);
  changeColor();
  rect(0, 0, 8, 44);
  popMatrix();
  
  pushMatrix();
  translate(10, 0);
  changeColor();
  rect(0, 0, 8, 44);
  popMatrix();
  
  popMatrix();
}

void drawA (float x, float y) {
  pushMatrix();
  translate(x, y);
  
  pushMatrix();
  translate(-7, 0);
  rotate(15*PI/180);
  changeColor();
  rect(0, 0, 8, 44);
  popMatrix();
  
  pushMatrix();
  translate(0, 9);
  rotate(90*PI/180);
  changeColor();
  rect(0, 0, 8, 44);
  popMatrix();
  
  pushMatrix();
  translate(7, 0);
  rotate(-15*PI/180);
  changeColor();
  rect(0, 0, 8, 44);
  popMatrix();
  
  popMatrix();
}
                                                                
