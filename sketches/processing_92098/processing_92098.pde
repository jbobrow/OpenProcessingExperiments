
/* @pjs font="times.ttf"*/
PFont font;

//x value
int[] x = { 102, 70, 84, 102, 119, 136 };
//y value
int[] y = { 31, 87, 115, 122, 115, 87 };

void setup() {
  //javascript
  font = loadFont("times.ttf");

  //regular java
  //font = loadFont("ArialMT-10.vlw");
  textFont(font, 14);
  size(500, 720);
  background(0, 0, 255);
}

void draw() {

  pushStyle();
  pushMatrix();
  fill(#15CBCA);
  translate(115, 90);
  scale(1.5);
  rotate(radians(-45));
  drawTearDrop(-100, -82);
  popMatrix();
  popStyle();

  pushStyle();
  text("Tears are like", 80, 93);
  text("rain", 110, 117);
  popStyle();
  
  pushStyle();
  pushMatrix();
  fill(#15CBCA);
  translate(220, 130);
  scale(1.3);
  drawTearDrop(-100, -82);
  popMatrix();
  popStyle();
  
  pushStyle();
  pushMatrix();
  text("Constantly", 189, 134);
  popMatrix();
  popStyle();
  
  pushStyle();
  pushMatrix();
  fill(#15CBCA);
  translate(220, 250);
  scale(1.1);
  drawTearDrop(-100, -82);
  popMatrix();
  popStyle();
  
  pushStyle();
  text("dripping", 194, 255);
  popStyle();
  
  pushStyle();
  pushMatrix();
  fill(#15CBCA);
  translate(220, 350);
  scale(.9);
  //rotate(radians(-45));
  drawTearDrop(-100, -82);
  popMatrix();
  popStyle();
  
  pushStyle();
  text("down", 205, 360);
  popStyle();
  
  //top left of the four 
  pushStyle();
  pushMatrix();
  fill(#15CBCA);
  translate(330, 380);
  scale(.9);
  rotate(radians(-45));
  drawTearDrop(-100, -82);
  popMatrix();
  popStyle();
  
  //bottom left of the four
  pushStyle();
  pushMatrix();
  fill(#15CBCA);
  translate(330, 440);
  scale(.9);
  rotate(radians(-135));
  drawTearDrop(-100, -82);
  popMatrix();
  popStyle();
  
  //top right of the four
  pushStyle();
  pushMatrix();
  fill(#15CBCA);
  translate(390, 380);
  scale(.9);
  rotate(radians(45));
  drawTearDrop(-100, -82);
  popMatrix();
  popStyle();
  
  //bottom right of the four
  pushStyle();
  pushMatrix();
  fill(#15CBCA);
  translate(390, 440);
  scale(.9);
  rotate(radians(135));
  drawTearDrop(-100, -82);
  popMatrix();
  popStyle();
  
  pushStyle();
  text("running in", 327, 394);
  text("all directions", 317, 434);
  popStyle();
  
  pushStyle();
  pushMatrix();
  fill(#15CBCA);
  translate(239, 532);
  scale(.9);
  rotate(radians(45));
  drawTearDrop(-100, -82);
  popMatrix();
  popStyle();
  
  pushStyle();
  text("until it", 217, 526);
  text("starts to", 211, 546);
  popStyle();
  
  pushStyle();
  pushMatrix();
  fill(21, 203, 222, 5);
  translate(200, 610);
  scale(.9, .7);
  //rotate(radians(90));
  drawTearDrop(-100, -82);
  popMatrix();
  popStyle();
  
  pushStyle();
  textFont(font, 11.5);
  text("evaporate", 175, 615);
  popStyle();
  
  pushStyle();
  pushMatrix();
  fill(21, 203, 202, 2);
  translate(250, 670);
  scale(.9, .5);
  rotate(radians(-45));
  drawTearDrop(-100, -82);
  popMatrix();
  popStyle();
  
  pushStyle();
  textFont(font, 11.5);
  text("and no", 233, 670);
  text("trace", 233, 680);
  popStyle();
  
  pushStyle();
  textFont(font, 11.5);
  text("is left.", 300, 700);
  popStyle();

  
}



void drawTearDrop(float xOffset, float yOffset) {  
  noStroke();
  
  
  beginShape(); 
  for (int i = 0; i < x.length; i++)
  {
    vertex(x[i] + xOffset, y[i] + yOffset);
  }
  endShape(CLOSE);
}



