
// Oliver Haimson 
// Assignment 08E
// Copyright 2012

// Click at your own risk!

float ang1, ang2, ang3, ang4, ang5, ang6;

void setup() {
  size(700, 400);
}

void draw() {
  background(100); 
  smooth();
  if (!mousePressed) {
  drawText();
  }
  drawBody();
  drawArms();
}

void drawArms() {
  findAngles();
  fill(0, 11, 77); 
  noStroke();
  // right arm
  drawUpperArm(450, ang1);
  drawForeArm(ang2);
  drawHands(ang3);
  // left arm
  drawUpperArm(250, ang4);
  drawForeArm(ang5);
  drawHands(ang6);
}

void findAngles() {
  // sector1
  if (mouseX >= 350 && mouseY < 225) {
    ang1 =  0.5 * (sin(mouseX/100.0));
    ang2 = 1 * (sin(mouseX/100.0)) - (225-mouseY)/150.0;
    ang3 =  .4 * (sin(millis()/ 600.0)) +1;
  }
  // sector2
  else if (mouseX < 350 && mouseY < 225) {
    ang1 = 0.5 * (sin(-mouseX/100.0)+2);
    ang2 = sin(3/100.0) + ang1;
    ang3 = 1;
  }
  // sector3
  else if (mouseX < 350 && mouseY >= 225) {
    ang1 = 0.5 * (sin(-mouseX/100.0)+2);
    ang2 =  0.3 * (sin(mouseX/100.0)+2);
    ang3 = 1;
  }
  // sector4
  else if (mouseX >= 350 && mouseY >=225) {
    ang1 =  0.5 * (sin(mouseX/100.0));
    ang2 = min((1 * (sin(mouseX/100.0)) - (225-mouseY)/150.0), .9);
    ang3 =  .4 * (sin(millis()/ 600.0)) +1;
  }
  ang4 = radians(90) - ang1;
  ang5 = ang2 - radians(180);
  ang6 = radians(90) - ang3;
}

void drawUpperArm(int x, float angle) {
  pushMatrix();

  translate(x, 150);
  rotate( angle );
  ellipse(0, 0, 10, 10);

  // upper arm
  pushMatrix();
  rotate(radians(-45)); 
  ellipse(0, 50, 55, 135);
  popMatrix();
}

void drawForeArm(float angle2) {
  translate(75, 75); 
  rotate( angle2 );
  ellipse(0, 0, 10, 10);

  // forearm
  pushMatrix();
  rotate(radians(-11));
  ellipse(0, 65, 45, 155);
  popMatrix();
}

void drawHands(float angle3) {
  translate(25, 125); 
  rotate( angle3 );
  ellipse(0, 0, 10, 10);

  // hand
  triangle(0, 0, 0, 40, 40, 0);
  if (mousePressed) {
    fill(227, 40, 11);
  }
  else {
    fill(0, 11, 77);
  }
  triangle(0, 40, 30, 50, 13, 25);
  triangle(13, 25, 27, 10, 45, 35);
  triangle(27, 10, 55, 20, 40, 0);
  fill(0, 11, 77);

  popMatrix();
}

void drawBody() {
  // torso
  fill(5, 52, 13);
  rect(255, 116, 190, 300);
  fill(0, 11, 77); 
  // shoulders
  ellipse(260, 150, 60, 70);
  ellipse(440, 150, 60, 70);
  // neck
  ellipse(350, 120, 65, 30);
  // head
  ellipse(350, 65, 100, 110);
  if (mousePressed) {
    // eyes
    fill(227, 40, 11);
    ellipse(335, 65, 10, 10);
    ellipse(365, 65, 10, 10);
    // fangs
    fill(255);
    triangle(343, 90, 347, 90, 345, 95);
    triangle(357, 90, 353, 90, 355, 95);
  }
}

void drawText() {
  fill(227, 40, 11);
  text("CLICK AT YOUR OWN RISK", 5, 390);
}
