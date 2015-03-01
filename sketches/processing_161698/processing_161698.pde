
/********************************
 *Assignment 3
 *Name: Hunter Jones
 *Course: CSC 103-Creative Computing- Fall 2014
 *submitted 9/17/2014
 
 *This program builds on the static sketch of a bike and adds motion into that program. Also, when the mouse is pressed, 
 everything is sped up and random colors flash simulating hyperspace.
 *********************************/

int spacing = 30;

float cloudOneX;
float cloudTwoX;

float YellowX;
boolean movingLeft = true;

float YellowY;

void setup() {
  size(600, 600);

  cloudOneX = 70;
  cloudTwoX = 400;

  YellowX = 8;
  YellowY = 460;
}


void draw() {

  background(0, 150, 200);

  //int yellowX= 8; // starting X position for the yellow lines

  //pavement
  fill(80, 240);
  rect(0, 390, 600, 600);


  // Clouds
  drawCloud1(cloudOneX, 100);
  drawCloud1(cloudOneX + width, 100);
  cloudOneX = cloudOneX - .5;
  if (mousePressed) {
    cloudOneX = cloudOneX - 2;
  }

  if (cloudOneX < -200) cloudOneX = cloudOneX + width;

  drawCloud2(cloudTwoX, 100);
  drawCloud2(cloudTwoX + width, 100);
  cloudTwoX = cloudTwoX - .3;
  if (mousePressed) {
    cloudTwoX = cloudTwoX - 2.1;
  }


  //Yellow lines
  drawYellow(YellowX, YellowY);
  if (mousePressed) {
    YellowX = YellowX - random(11,13);           //makes the lines go faster when the mouse is pushed
  } else {
    YellowX = YellowX - 1;
  }
  if (YellowX < -width) YellowX = YellowX+width+spacing;

  // draws the bike
  drawBike();

// crazy colors when mouse pushed  
  if (mousePressed) {
  fill(random(255), random(255), random(255), random(100, 255));
  rect(0, 0, width, height);  
  }
}

void drawYellow(float YellowX, float YellowY) {
  //yellow lines on the road

  stroke(1);
  strokeWeight(1);
  fill(255, 255, 0);
  rect(YellowX, YellowY, 50, 10);
  rect(YellowX+90, YellowY, 50, 10);
  rect(YellowX+180, YellowY, 50, 10);
  rect(YellowX+270, YellowY, 50, 10);
  rect(YellowX+360, YellowY, 50, 10);
  rect(YellowX+450, YellowY, 50, 10);
  rect(YellowX+540, YellowY, 50, 10);

  // off-to-the-right copies
  rect(YellowX + width + spacing, YellowY, 50, 10);
  rect(YellowX+90 + width + spacing, YellowY, 50, 10);
  rect(YellowX+180 + width + spacing, YellowY, 50, 10);
  rect(YellowX+270 + width + spacing, YellowY, 50, 10);
  rect(YellowX+360 + width + spacing, YellowY, 50, 10);
  rect(YellowX+450 + width + spacing, YellowY, 50, 10);
  rect(YellowX+540 + width + spacing, YellowY, 50, 10);
}

void drawBike() {

  //starting left position of the left wheel
  int xA = 150;     //Center X point of left wheel
  int yA = 400;     //center Y point of left wheel
  int wr = 100;     //wheel radius

  //left wheel
  fill(200);
  strokeWeight(2);
  ellipseMode(CENTER);
  ellipse(xA, yA, wr, wr);


  //right wheel
  ellipse(xA+300, yA, wr, wr);


  //rear frame triangle
  strokeWeight(2);
  noFill();
  triangle(xA, yA, xA+120, yA, xA+30, yA-130);

  //middle part of frame
  triangle(xA+120, yA, xA+250, yA-135, xA+40, yA-118);

  //front fork
  strokeWeight(3);
  line(xA+250, yA-135, xA+300, yA);

  //bottom crank circle
  strokeWeight(1);
  fill(80, 65);
  ellipse(xA+120, yA, 40, 40);

  //crank arms
  strokeWeight(5);
  fill(150);
  line(xA+90, yA-20, xA+150, yA+20);

  //seat
  noFill();
  smooth();
  beginShape();
  vertex(xA+15, yA-130);
  vertex(xA+50, yA-128);
  vertex(xA+48, yA-127);
  vertex(xA+15, yA-125);
  endShape();

  //handle bars
  strokeWeight(2);
  line(xA+250, yA-135, xA+225, yA-150);
  line(xA+250, yA-135, xA+225, yA-120);
}

void drawCloud1(float x, float y) {
  // Left Clouds
  noStroke();
  fill(255);
  ellipse(x, y, 300, 200);
  ellipse(x+30, y+40, 220, 150);
  ellipse(x+20, y+60, 150, 150);
}

void drawCloud2(float x, float y) {
  //right clouds
  ellipse(x, y, 250, 200);
  ellipse(x+50, y+20, 200, 100);
  ellipse(x+20, y+20, 100, 200);
  ellipse(x-20, y-70, 200, 120);
  ellipse(x+30, y-40, 130, 130);
}



