
/* Intro to Computational Media
 Assignment Week #4
 Manuela Donoso
 */

//(x,y) define the higher-left corner
int x = 15;
int y = 116;
// width and height of the rectangle
int w = 370;
int h = 270;

// variable button on off
int ellipseOneRadius = 20;
int ellipseOneState = 0;

// channelThree variable
int bouncingBall = 60; 
int speed = 3; 

//adjust the curve of the corner(should be less than min(w,h)/2)
int c = 30;

// on off
boolean overOn = false;
boolean overOff = false;
boolean buttonOnPressed = false;
boolean buttonOffPressed = true;
boolean overChannelOne = false;
boolean buttonChannelOnePressed = false;
boolean overChannelTwo = false;
boolean buttonChannelTwoPressed = false;
boolean overChannelThree = false;
boolean buttonChannelThreePressed = false;
boolean overChannelFour = false;
boolean buttonChannelFourPressed = false;

PFont fontChannel; // font
PImage funeral; // channel 3 image

void setup() {
  size(400, 400);
  background(255);
  noStroke();
  funeral = loadImage("funeral.jpg");
  smooth();
}


void draw() {

  update(mouseX, mouseY);

  fill(100);

  ellipse(200, 110, 180, 80);
  drawRoundedBox (x, y, w, h, c);

  // white line up tv box
  fill(255);
  rect(70, 113, 350, 3);

  // tv anthena
  stroke(100);
  strokeWeight(3);
  line(150, 20, 180, 70);

  stroke(100);
  strokeWeight(3);
  line(250, 20, 220, 70);

  // button on off
  fill(80);
  ellipse(350, 160, 38, 38); //on
  ellipse(350, 210, 38, 38); //off

  fill(100);
  ellipse(150, 20, 10, 10);
  ellipse(250, 20, 10, 10);

  // channel buttons
  fill(80);
  rect(325, 319, 25, 25); //one
  rect(350, 319, 25, 25); // two
  rect(325, 345, 25, 25); // three
  rect(350, 345, 25, 25); // four

  fontChannel = loadFont("Futura-Medium-12.vlw");
  textFont(fontChannel, 12);
  fill(100);
  text("1", 334, 336);
  text("2", 360, 336);
  text("3", 334, 363);
  text("4", 360, 363);

  textFont(fontChannel, 10);
  text("ON", 341, 166);
  text("OFF", 340, 216);

  noStroke();

  if (buttonOnPressed) {

    fill(40);
    ellipse(350, 160, 40, 40);
    fill(255);
    text("ON", 341, 166);

    // inside tv lines when is on buttonOn
    fill(255);
    rect(35, 134, 35, 235);

    fill(250, 226, 8);
    rect(70, 134, 35, 235);

    fill(57, 212, 216);
    rect(105, 134, 35, 235);

    fill(41, 227, 104);
    rect(140, 134, 35, 235);

    fill(216, 20, 216);
    rect(175, 134, 35, 235);

    fill(242, 2, 30);
    rect(210, 134, 35, 235);

    fill(38, 54, 152);
    rect(245, 134, 35, 235);

    fill(0);
    rect(280, 134, 35, 235);


    // channels button action
    if (buttonChannelOnePressed) {
      image(funeral, 35, 134);
      fill(40);
      rect(325, 319, 25, 25);
      fill(255);
      text("1", 334, 336);
    }

    if (buttonChannelTwoPressed) {
      // variable
      float r;
      float g;
      float b;
      float a;
      float diam;
      float x2;
      float y2;
      float x3;
      float y3;

      //channel button number 2
      rect(350, 319, 25, 25);
      fill(255);
      text("2", 360, 336);

      fill(230);
      rect(35, 134, 280, 235);

      r= random (255);
      g= random (255);
      b= random (255);
      a= random (255);
      diam= random (40);
      x2= random (55, 300);
      y2= random (150, 350);
      x3= random (55, 300);
      y3= random (150, 350);
      noStroke();
      fill(r, g, b, a);
      ellipse(x2, y2, diam, diam);
      ellipse(x3, y3, diam, diam);

      delay(100);
    }

    if (buttonChannelThreePressed) {

      //channnel button 3
      fill(40);
      rect(325, 345, 25, 25);
      fill(255);
      text("3", 334, 363);

      fill(#FFDA03);
      rect(35, 134, 280, 235);

      bouncingBall = bouncingBall + speed;

      if (( bouncingBall > 235) || ( bouncingBall< 60 )) {
        speed = speed * -1;
      }
      // Draw the circle
      noStroke(); 
      fill(255); 
      ellipse(bouncingBall, 250, 32, 32); 
      ellipse(bouncingBall+50, 250, 32, 32); 
      ellipse(bouncingBall+25, 280, 5, 5); 

      fill(0); 
      ellipse(bouncingBall, 250, 10, 10); 
      ellipse(bouncingBall+50, 250, 10, 10); 
      ellipse(bouncingBall+25, 300, 10, 10);
      noFill();
      stroke(0);
      ellipse(bouncingBall+25, 260, 100, 100); 
      noStroke();
    }
  }

  if (buttonChannelFourPressed) {
    //image(funeral, 35, 134);
    fill(40);
    rect(350, 345, 25, 25);
    fill(255);
    text("4", 360, 363);

    fill(0);
    rect(35, 134, 280, 235);

    //dibujo botn 4
    float M = random(45, 300);
    float D = random(150, 350);
    noStroke();
    fill(255, 100);
    ellipse(M, D, 5, 5);
  }


  if (buttonOffPressed) {
    fill(40);
    ellipse(350, 210, 38, 38);
    fill(255);
    text("OFF", 340, 216);
    fill(0);
    rect(35, 134, 280, 235);
  }
}

void drawRoundedBox(int x, int y, int w, int h, int c)
{
  //tv gray box
  fill(100);
  noStroke();
  beginShape();

  vertex(x, y+c);
  bezierVertex(x, y, x, y, x+c, y);

  vertex(x+w-c, y);
  bezierVertex(x+w, y, x+w, y, x+w, y+c);

  vertex(x+w, y+h-c);
  bezierVertex(x+w, y+h, x+w, y+h, x+w-c, y+h);

  vertex(x+c, y+h);
  bezierVertex(x, y+h, x, y+h, x, y+h-c);
  vertex(x, y+c);

  endShape();
}

void update (int x, int y) {
  overOff = overCircle(350, 210, 40);
  overOn = overCircle(350, 160, 40);
  overChannelOne = overChannel(325, 319, 25, 25);
  overChannelTwo = overChannel(350, 319, 25, 25);
  overChannelThree = overChannel(325, 345, 25, 25);
  overChannelFour = overChannel(350, 345, 25, 25);
}

void mousePressed()
{
  if (overOn) {
    buttonOnPressed = true;
    buttonOffPressed = false;
  }
  if (overOff) {
    buttonOffPressed = true;
    buttonOnPressed = false;
    buttonChannelOnePressed = false;
    buttonChannelTwoPressed = false;
    buttonChannelThreePressed = false;
    buttonChannelFourPressed = false;
  }
  if (overChannelOne) {
    buttonChannelOnePressed = true;
    buttonChannelTwoPressed = false;
    buttonChannelThreePressed = false;
    buttonChannelFourPressed = false;
  }
  if (overChannelTwo) {
    buttonChannelTwoPressed = true;
    buttonChannelOnePressed = false;
    buttonChannelThreePressed = false;
    buttonChannelFourPressed = false;
  }
  if (overChannelThree) {
    buttonChannelThreePressed = true;
    buttonChannelOnePressed = false;
    buttonChannelTwoPressed = false;
    buttonChannelFourPressed = false;
  }
  if (overChannelFour) {
    buttonChannelFourPressed = true;
    buttonChannelOnePressed = false;
    buttonChannelTwoPressed = false;
    buttonChannelThreePressed = false;
  }
}


boolean overCircle(int x, int y, int diameter) 
{
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } 
  else {
    return false;
  }
}

boolean overChannel(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}


