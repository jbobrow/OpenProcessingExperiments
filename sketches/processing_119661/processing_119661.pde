
color bodyColor1 = color(238, 173, 14);
color spotColor = color(255, 255, 255);
color strokeColor = color(205, 149, 12);
color bgColor = color(50, 100, 255);

//setup
void setup() {
  size(500, 500);
  background(bgColor);
  smooth();
}

void draw() {  
  background(bgColor);
  translate(250, 250);//move the head and body to center of screen
  drawBody();

  float angle = radians(mouseX - 250);
  if(angle >= HALF_PI){angle = HALF_PI;}
  else if(angle <= -(HALF_PI)){angle = -(HALF_PI);}
  pushMatrix();
    rotate(angle);
    drawHead();
  popMatrix();
  
  translate(-250, -250);//undo translate
  drawBone(mouseX, mouseY);
}

//body
void drawBody() {
  //back feet/legs
  //foot
  fill(spotColor);
  stroke(0, 0, 0);
  ellipse(-50, 150, 20, 40);
  ellipse(50, 150, 20, 40);
  //legs
  fill(bodyColor1);
  rect(-60, 95, 20, 50);
  rect(40, 95, 20, 50);

  //body
  fill(bodyColor1); 
  stroke(0, 0, 0);
  ellipse(0, 50, 150, 180);


  fill(bgColor);
  stroke(bgColor);
  //  rect(-110,135,150,50);

  //front legs/feet
  //foot
  fill(spotColor);
  stroke(0, 0, 0);
  ellipse(-35, 150, 20, 40);
  ellipse(35, 150, 20, 40);


  //leg
  fill(bodyColor1);
  stroke(bodyColor1);
  rect(-45, 95, 20, 50);
  rect(25, 95, 20, 50);

  //leg outline
  stroke(0, 0, 0);
  line(-45, 145, -50, 85);
  line(-25, 145, -25, 125);  
  line(25, 145, 25, 125);
  line(45, 145, 50, 85);
  line(-55, 145, -25, 145);
  line(25, 145, 55, 145);
  //chest spot
  fill(spotColor);
  stroke(strokeColor);
  ellipse(0, 65, 65, 130);
}

void drawHead() {

  //ears

  fill(bodyColor1);
  stroke(0, 0, 0);

  //ear 1
  beginShape();
  curveVertex(10, -120);
  curveVertex(10, -120);
  curveVertex(55, -170);
  curveVertex(65, -82);
  curveVertex(65, -82);
  endShape();

  //ear 2
  beginShape();
  curveVertex(-10, -120);
  curveVertex(-10, -120);
  curveVertex(-55, -170);
  curveVertex(-65, -82);
  curveVertex(-65, -82);
  endShape();

  fill(spotColor);
  stroke(strokeColor);

  //inner ear 1

  beginShape();
  curveVertex(20, -115);
  curveVertex(20, -115);
  curveVertex(50, -150);
  curveVertex(60, -62);
  curveVertex(60, -62);
  endShape();

  //inner ear 2

  beginShape();
  curveVertex(-20, -115);
  curveVertex(-20, -115);
  curveVertex(-50, -150);
  curveVertex(-60, -62);
  curveVertex(-60, -62);
  endShape();

  //head
  fill(bodyColor1);
  stroke(0, 0, 0);
  ellipse(0, -55, 140, 140);


  //snout

  //mouth

  fill(spotColor);
  stroke(0, 0, 0);
  ellipse(0, -30, 30, 50);
  ellipse(0, -40, 30, 50);
  stroke(spotColor);
  ellipse(0, -30, 27, 47);
  stroke(0, 0, 0);


  //tongue

  fill(255, 114, 86);
  ellipse(0, -30, 20, 40);

  fill(spotColor);
  stroke(spotColor);
  rect(-10, -55, 20, 20);

  stroke(0, 0, 0);
  line(-15, -35, 15, -35);

  stroke(138, 51, 36);
  line(0, -35, 0, -13);

  //nose

  stroke(0, 0, 0);
  fill(0, 0, 0);
  ellipse(0, -50, 20, 12);

  //eyes

  fill(255, 255, 255);
  stroke(strokeColor);
  ellipse(-30, -80, 25, 25);

  fill(255, 255, 255);
  stroke(strokeColor);
  ellipse(30, -80, 25, 25);

  //pupils

  fill(0, 0, 0);
  stroke(0, 0, 0);
  ellipse(-30, -80, 10, 10);

  fill(0, 0, 0);
  stroke(0, 0, 0);
  ellipse(30, -80, 10, 10);
}

void drawBone(int x, int y) {
  fill(255, 246, 143);
  stroke(255, 246, 143);

  //top left nub
  ellipse(x-12, y+5, 10, 12);

  //bot left nub
  ellipse(x-12, y+20, 10, 12);

  //top right nub
  ellipse(x+37, y+5, 10, 12);

  //top left nub
  ellipse(x+37, y+20, 10, 12);
  //shaft
  rect(x-12, y+7, 50, 10);
}

//change breed
int value = 0;

void mouseClicked() {
  if (value == 0) {
    value = 1;
    bodyColor1 = color(55, 55, 55);
    spotColor = color(160, 160, 160);
    strokeColor = color(0, 0, 0);
  } else {
    bodyColor1 = color(238, 173, 14);
    spotColor = color(255, 255, 255);
    strokeColor = color(205, 149, 12);
    value = 0;
  }
}



