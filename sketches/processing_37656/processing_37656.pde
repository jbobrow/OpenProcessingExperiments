
import netscape.javascript.*;

float v;
void setup() {
  size(550, 650);
  //Sky and Ground
  background(0, 112, 170);
   noStroke();
  fill(0,112,220);
  rect(0,216.66,550,108.33);
  fill(0,112,130);
  rect(0,0,550,108.33);
  rectMode(CORNER);
  fill(1, 116, 0);
  rect(0, 325, 550, 325);
  smooth();
  fill(240);
  
  //Clouds
  ellipse(100, 100, 80, 65);
  ellipse(100, 120, 80, 65);
  ellipse(140, 110, 50, 50);
  ellipse(60, 110, 50, 50);
  ellipse(430, 200, 80, 65);
  ellipse(430, 220, 80, 65);
  ellipse(470, 210, 50, 50);
  ellipse(390, 210, 50, 50);
  
  //PPG House
  fill(255);
  rect(375, 375, 175, 140);
  rect(300, 445, 75, 70);
  fill(190, 0, 0);
  fill(230, 0, 0);
  rect(415, 465, 30, 50);

  fill(175, 196, 255);

  //Windows
  ellipse(400, 400, 32, 32);
  ellipse(450, 400, 32, 32);
  ellipse(500, 400, 32, 32);
  rect(475, 475, 65, 35);
  rect(315, 457, 50, 45);
  stroke(150);
  line(315,479.5,365,479);
  line(331.66,457,331.66,502);
  line(348.32,457,348.32,502);
  
  noStroke();
}

void draw() {
}

void mousePressed() {
  v=abs((float)mouseY-height/2) / (height/2);
  if (mouseY<=320) {
    drawFirefly(mouseX, mouseY, v);
  }
  if (mouseY>325&&mouseY<372) {
    drawFlower(mouseX, mouseY, v);
  }
  if (mouseY>372&&mouseY<435&&mouseX<372) {
    drawFlower(mouseX, mouseY, v);
  }
  if (mouseY>445&&mouseY<495&&mouseX<292) {
    drawFlower(mouseX, mouseY, v);
  }
  if (mouseY>495) {
    drawFlower(mouseX, mouseY, v);
  }
}
//Firefly
void drawFirefly(float x, float y, float scal) {
  for (int c=30;c>=10;c-=10) {
    fill(250+c, 230+c, 0, 120);
    ellipse(x, y, c*scal/.6, c*scal/.6);
  }
}

//Red Flower
void drawFlower(float x, float y, float scal) {
  fill(234, 0, 0);
  ellipse(x, y, 12*scal, 12*scal);
  ellipse(x-10*scal, y+8*scal, 11*scal, 11*scal);
  ellipse(x+10*scal, y+8*scal, 11*scal, 11*scal);
  ellipse(x+7*scal, y+20*scal, 11*scal, 11*scal);
  ellipse(x-7*scal, y+20*scal, 11*scal, 11*scal);
  fill(255, 255, 0);
  ellipse(x, y+11*scal, 7*scal, 7*scal);
  fill(59, 201, 0);
  ellipse(x, y+40*scal, 1*scal, 20*scal);
}


