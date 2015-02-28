
//Garrett Rauck
//Introduction to Digital Media Fall 2012 - Assignment 01b
//Section B
//9.13.12

int locationX=0;
int locationY =0;

int value=0;

boolean wormLeft = false;
boolean wormRight = false;
boolean wormUp = false;
boolean wormDown = false;
boolean drawBackground = false;

float instX = 0;
float instY = 0;

float a1 = 0;
float b1 =0;
float a2 = 0;
float b2 =0;
float a3 = 0;
float b3 = 0;

boolean paintBlue = false;
boolean paintRed = false;
boolean paintGreen = false;
boolean paintOrange = false;
boolean paintPurple = false;
boolean paintYellow = false;
boolean paintBlack = false;
boolean paintWhite = false;
boolean paintVariables = false;

float theta = 0.0;

PFont f;


void setup() {
  size(1200, 600);
  background(255);
  smooth();
  f = loadFont("KodchiangUPC-48.vlw");
      textFont(f, 400);
      fill(255);
      text("Carnegie", 125, 250);
      text("Mellon", 235, 525);
  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      wormUp = true;
      wormDown = false;
      wormRight = false;
      wormLeft = false;
      paintBlue = false;
      paintRed = false;
      paintGreen = false;
      paintOrange = false;
      paintPurple = false;
      paintYellow = false;
      paintBlack = false;
      paintWhite = false;
    }
    else if (keyCode == DOWN) {
      wormDown = true;
      wormUp = false;
      wormRight = false;
      wormLeft = false;
      paintBlue = false;
      paintRed = false;
      paintGreen = false;
      paintOrange = false;
      paintPurple = false;
      paintYellow = false;
      paintBlack = false;
      paintWhite = false;
    }
    else if (keyCode == RIGHT) {
      wormRight = true;
      wormUp = false;
      wormDown = false;
      wormLeft = false;
      paintBlue = false;
      paintRed = false;
      paintGreen = false;
      paintOrange = false;
      paintPurple = false;
      paintYellow = false;
      paintBlack = false;
      paintWhite = false;
      
    }
    else if (keyCode == LEFT) {
      wormLeft = true;
      wormUp = false;
      wormRight = false;
      wormDown = false;
      paintBlue = false;
      paintRed = false;
      paintGreen = false;
      paintOrange = false;
      paintPurple = false;
      paintYellow = false;
      paintBlack = false;
      paintWhite = false;
    }
    else if (keyCode == SHIFT) {
      wormLeft = false;
      wormUp = false;
      wormRight = false;
      wormDown = false;
      paintBlue = false;
      paintRed = false;
      paintGreen = false;
      paintOrange = false;
      paintPurple = false;
      paintYellow = false;
      paintBlack = false;
      paintWhite = false;
    }
  }
}


void draw() {


  //background(255);
  fill(255);


  //BALLS
  theta +=.05;
  float x1 = 20*sin(2.5*theta);
  float y1 = 20*cos(2.5*theta);
  ellipse(locationX+600+x1, locationY+300+y1, 15, 15);
  float x2 = 20*sin(2.5*(theta-.4));
  float y2 = 20*cos(2.5*(theta-.4));
  ellipse(locationX+600+x2, locationY+300+y2, 10, 10);
  float x3 = 20*sin(2.5*(theta-.7));
  float y3 =20*cos(2.5*(theta-.7));
  ellipse(locationX+600+x3, locationY+300+y3, 5, 5);

  //PAINT
  if (paintVariables==true) {
    instX = locationX;
    instY = locationY;
    a1 = x1;
    b1 = y1;
    a2 = x2;
    b2 = y2;
    a3 = x3;
    b3 = y3;
  }
  if (keyPressed) {
    if (key == '5') {
      paintVariables=true;
      paintBlue = true;
      paintRed = false;
      paintGreen = false;
      paintOrange = false;
      paintPurple = false;
      paintYellow = false;
      paintBlack = false;
      paintWhite = false;
    }
  }
  if (keyPressed) {
    if (key == '1') {
      paintVariables=true;
      paintRed = true;
      paintBlue = false;
      paintGreen = false;
      paintOrange = false;
      paintPurple = false;
      paintYellow = false;
      paintBlack = false;
      paintWhite = false;
    }
    if (key == '4') {
      paintVariables=true;
      paintGreen = true;
      paintRed = false;
      paintBlue = false;
      paintOrange = false;
      paintPurple = false;
      paintYellow = false;
      paintBlack = false;
      paintWhite = false;
    }
    if (key == '3') {
      paintVariables=true;
      paintYellow = true;
      paintGreen = false;
      paintRed = false;
      paintBlue = false;
      paintOrange = false;
      paintPurple = false;
      paintBlack = false;
      paintWhite = false;
    }
    else if (key == '2') {
      paintVariables=true;
      paintOrange = true;
      paintGreen = false;
      paintRed = false;
      paintBlue = false;
      paintPurple = false;
      paintYellow = false;
      paintBlack = false;
      paintWhite = false;
    }
    else if (key == '6') {
      paintVariables=true;
      paintPurple = true;
      paintGreen = false;
      paintRed = false;
      paintBlue = false;
      paintOrange = false;
      paintYellow = false;
      paintBlack = false;
      paintWhite = false;
    }
//    else if (key == '7') {
//      paintVariables=true;
//      paintBlack = true;
//      paintGreen = false;
//      paintRed = false;
//      paintBlue = false;
//      paintOrange = false;
//      paintPurple = false;
//      paintYellow = false;
//      paintWhite = false;
//    }
//    else if (key == '8') {
//      paintVariables=true;     
//      paintWhite = true;
//      paintGreen = false;
//      paintRed = false;
//      paintBlue = false;
//      paintOrange = false;
//      paintPurple = false;
//      paintYellow = false;
//      paintBlack = false;
//    }
    
    if (paintBlue == true) {
      fill(0, 0, 255);
      ellipse(instX+600+a1, instY+300+b1, 15, 15);
      ellipse(instX+600+a2, instY+300+b2, 10, 10);
      ellipse(instX+600+a3, instY+300+b3, 5, 5);
    }
    if (paintRed == true) {
      fill(255, 0, 0);
      ellipse(instX+600+a1, instY+300+b1, 15, 15);
      ellipse(instX+600+a2, instY+300+b2, 10, 10);
      ellipse(instX+600+a3, instY+300+b3, 5, 5);
    }
    if (paintGreen == true) {
      fill(0, 255, 0);
      ellipse(instX+600+a1, instY+300+b1, 15, 15);
      ellipse(instX+600+a2, instY+300+b2, 10, 10);
      ellipse(instX+600+a3, instY+300+b3, 5, 5);
    }
    if (paintOrange == true) {
      fill(255, 150, 0);
      ellipse(instX+600+a1, instY+300+b1, 15, 15);
      ellipse(instX+600+a2, instY+300+b2, 10, 10);
      ellipse(instX+600+a3, instY+300+b3, 5, 5);
    }
    if (paintPurple == true) {
      fill(250, 0, 255);
      ellipse(instX+600+a1, instY+300+b1, 15, 15);
      ellipse(instX+600+a2, instY+300+b2, 10, 10);
      ellipse(instX+600+a3, instY+300+b3, 5, 5);
    }
    if (paintYellow == true) {
      fill(255, 255, 0);
      ellipse(instX+600+a1, instY+300+b1, 15, 15);
      ellipse(instX+600+a2, instY+300+b2, 10, 10);
      ellipse(instX+600+a3, instY+300+b3, 5, 5);
    }
    if (paintBlack == true) {
      fill(0);
      ellipse(instX+600+a1, instY+300+b1, 15, 15);
      ellipse(instX+600+a2, instY+300+b2, 10, 10);
      ellipse(instX+600+a3, instY+300+b3, 5, 5);
    }
    if (paintWhite == true) {
      fill(255);
      ellipse(instX+600+a1, instY+300+b1, 15, 15);
      ellipse(instX+600+a2, instY+300+b2, 10, 10);
      ellipse(instX+600+a3, instY+300+b3, 5, 5);
    }
  }

  //TEXT


  //WORM
  if (wormUp == true) {
    locationY = locationY-3;
  }
  if (wormDown == true) {
    locationY = locationY +3;
  }
  if (wormRight == true) {
    locationX = locationX + 3;
  }
  if (wormLeft == true) {
    locationX = locationX - 3;
  }
  fill(0);
  rect(595+locationX, 295+locationY, 10, 10);

  if (locationX<-605) {
    locationX=605;
  }
  if (locationX>605) {
    locationX=-605;
  }
  if (locationY<-305) {
    locationY=305;
  }
  if (locationY>305) {
    locationY=-305;
  }
}
void keyReleased(){
      paintVariables=false;
      paintGreen = false;
      paintRed = false;
      paintBlue = false;
      paintOrange = false;
      paintPurple = false;
      paintYellow = false;
      paintBlack = false;
      paintWhite = false;
    }
