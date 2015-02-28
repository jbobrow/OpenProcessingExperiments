
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: PARK Jeungeun
// ID: 201420080


float xLast;
float yLast;
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;
int value = 0;


void setup() {
  size(600, 600);
  smooth();
  frameRate(10);
}

void draw() {
  background(255);
  ellipseMode(CENTER);
  noStroke();
  fill(255);




  fill(#F72386);
  rect(mouseX+100, mouseY+1, 20, 20);
  fill(#FCE84C);
  rect(mouseX+105, mouseY+6, 10, 10);

  if (keyPressed == true) {
    fill(random(255), random(255), random(255));
    rect(mouseX+100, mouseY+1, 20, 20);
  }

  fill(#F72386);
  rect(mouseX-110, mouseY+1, 20, 20);
  fill(#FCE84C);
  rect(mouseX-105, mouseY+6, 10, 10);

  if (keyPressed == true) {
    fill(random(255), random(255), random(255));
    rect(mouseX-105, mouseY+6, 10, 10);
  }

  strokeWeight(3);
  stroke(#FA1235);
  line(mouseX+40, mouseY, pmouseX, pmouseY);

  strokeWeight(3);
  stroke(#FA1235);
  line(mouseX-40, mouseY, pmouseX, pmouseY);




  noStroke();
  fill(0);
  ellipse(xLast, yLast, 40, 40);
  xLast=pmouseX;
  yLast=pmouseY;
  title();
}



void title() { 
  fill(120);
  textAlign(RIGHT);
  text("PARK Jeungeun, fox, Dynamic Media, 2014", width-50, height-20);
}

