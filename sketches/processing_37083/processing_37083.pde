
//Joel Simon
//Electronic Media Studio D
//sept, 14 2010

int hatState=0;
int stacheStateR;
int stacheStateG;
int stacheStateB;

void setup() {

  size(800, 600); //600x 491 pixels

  background(100); //greyscale
  smooth();
  drawMan(40, 50);
  drawMan(40, 350);
  drawMan(300, 50);
  drawMan(300, 350);
  drawMan(580, 350);
  drawMan(580, 50);

}

void draw() {

  background(100);
  drawMan(40, 50);
  drawMan(40, 350);
  drawMan(300, 50);
  drawMan(300, 350);
  drawMan(580, 350);
  drawMan(580, 50);

  fill(37, 193, 101);
  rect(250, 290, 250, 20);
  buttonClicked();
}

void buttonClicked() {
  if ((mousePressed) && (mouseX >250)  && (mouseX <500)&& (mouseY <310) && (mouseX >290)) {
    stacheStateR = int(random(256));
    stacheStateG = int(random(256));
    stacheStateB = int(random(256));
    hatState =int(random(0, 2));
  }
}

void drawMan(int x, int y) {
  strokeWeight(3);
  noFill();
  drawBody(x, y);
  drawNose(x, y);

  drawFunnyHat(x, y);

  //drawTopHat(x, y);
  drawStache(x, y);
  drawEyes(x, y);
}

void drawEyes(int x, int y) {
  strokeWeight(6);
  int eyesX = int(map(mouseX, 0, 600, -5, 5));
  int eyesY = int(map(mouseY, 0, 491, -5, 5));

  point(45+x+eyesX, 80+y+eyesY);
  point(115+x+eyesX, 80+y+eyesY); 

  strokeWeight(3);
  noFill();
  arc(45 +x, 80+y, 30, 20, 0, PI);
  arc(115+x, 80+y, 30, 20, 0, PI);
}

void drawNose(int x, int y) {
  noFill();
  beginShape();
  curveVertex(76+x, 62+y); // the first control point
  curveVertex(76+x, 62+y); // is also the start point of curve
  curveVertex(78+x, 82+y);
  curveVertex(86+x, 107+y);
  curveVertex(76+x, 112+y);
  curveVertex(106 +x, 112+y);
  endShape();
}

void drawBody(int x, int y) {
  strokeWeight(3);

  fill(200);
  arc(76 +x, 241+y, 120, 275, PI, TWO_PI);
  ellipse(76+x, 92+y, 150, 170);
} 
void drawTopHat(int x, int y) {
  x+=25;
  fill(0);
  rectMode(CORNERS);
  quad(40+x, 15+y, 105+x, 46+y, 148+x, -12+y, 88+x, -42+y);// HAT
  strokeWeight(10);
  line(10+x, -3+y, 147+x, 62+y);
}
void drawHat(int x, int y) {
  int h = int(random(2));
  if (h ==0) {
    drawTopHat(x, y);
  }
  else {
    drawFunnyHat(x, y);
  }
}

void drawFunnyHat(int x, int y) {


  x+=30;
  y+=5;
  fill( 255, 0, 0);
  rect(x-15, y+15, 125, 15);
  rect(x, y, 95, 15);
  rect(x+15, y-15, 65, 15);
  rect(x+28, y-30, 40, 15);
}


void drawStache(int x, int y) {

  fill(stacheStateR, stacheStateG, stacheStateB);//mustache color
  arc(76+x, 140+y, 65, 40, PI, TWO_PI);
}

