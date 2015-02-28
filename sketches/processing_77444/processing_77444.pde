
//Rohan Rathod, rkrathod
//Hw_8, tuesday oct 30, 2012
//All materials and images on this code Copyright (c) Rohan Rathod, 2012. 

float lineModuleSize = 50;
float angle = radians(1);
float angleSpeed = radians(10);
color col = color(181, 157, 0, 100);
PShape lineModule = null;
//==============================================================================================
void setup() {
  size(800, 400);
  background(255);
  smooth();
  cursor(CROSS);
  lineModule = loadShape("01.svg");//Load shape
}
//==============================================================================================
void draw() {
  stroke(col);
  angle = angle + angleSpeed;//start rotations

  //  rectMode(CENTER);
  //  fill(0);
  //  rect(width/2, height/2, 200, 20);
  //  textAlign(CENTER);  
  //  fill(255);
  //  text("BRUSH SIZE" + " " + lineModuleSize, width/2, height/2);
  drawShape();
  //  if (mousePressed) {
  //    pushMatrix();
  //    translate(mouseX, mouseY);
  //    rotate(angle);
  //    stroke(c1);
  //    shape(lineModule, 0, 0, lineModuleSize, lineModuleSize);
  //    popMatrix();
  //  }

  if (mousePressed) {// reverse direction
    angleSpeed = -1*angleSpeed;
  }
}
//===============================================================================================

void drawShape()
{
  float x = 0;
  strokeWeight(0.5);
  while (x < mouseX )
  { 
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(angle);

    shape(lineModule, 0, 0, x+lineModuleSize/10, x+lineModuleSize/10);
    popMatrix();
    x = x + 1;
  }
}

//===============================================================================================
void keyPressed() {
  if (key == '1') {
    lineModule = loadShape("01.svg");
  }
  else if (key == '2') {
    lineModule = loadShape("02.svg");
  }
  else if (key == '3') {
    lineModule = loadShape("03.svg");
  }
  else if (key == '4') {
    lineModule = loadShape("04.svg");
  }
  else if (key == '5') {
    lineModule = loadShape("05.svg");
  }

  if (key == 'r' || key == 'R') {//RESETS THE SCREEN
    background(255);
  }

  if (key == 'q') {
    noFill();
    stroke(col);
    strokeWeight(20);
    ellipse(mouseX, mouseY, random(50, 200), random(50, 200));
  }

//==============================================================================================

  switch(key) {
  case 's':
    save("screenshot"+".jpg");
    break;
  }
}


