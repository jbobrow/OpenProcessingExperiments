
//I have probelem with making two ellipses collision/second

PFont font;
float hourX;
float minuteX;
float secondX;

float xPos1 = 0; 
float xPos2 = 0;

float xSpeed1 = 3;
float xSpeed2 = 4;

color ballColor1 = color(100, 255, 0);
color ballColor2 = color(150, 0, 250);

float ballsize = 40;

int yPos = 200;

void setup() {
  size(400, 400);
  noStroke();
  font=loadFont("AgencyFB-Reg-48.vlw");

  xPos1 = random(width);
  xPos2 = random(width);
}

void draw() {
  background(255);
  fill(255);
  textFont(font);

  text((hour() + ":" + minute() + ":" + second()), 10, 40); 
  hourX = map(hour(), 0, 23, 0, (width-10)); 
  minuteX = map(minute(), 0, 59, 0, (width-10)); 
  secondX = map(second(), 0, 59, 0, (width-10)); 

  fill(ballColor1);
  smooth();
  ellipse(xPos1, yPos, ballsize, ballsize);

  fill(ballColor2);
  smooth();
  ellipse(xPos2, yPos, ballsize, ballsize);
  
  if(millis()<=1000){
  xSpeed1 = xSpeed1*-1;
  xSpeed2 = xSpeed2*-1;
  }
  
  if (dist(xPos1, yPos, xPos2, yPos)<ballsize){
    xSpeed1 = xSpeed1*-1;
    xSpeed2 = xSpeed2*-1;
  }
  
//  if (xPos1 > (width - ballsize/2)|| xPos1 <= ballsize/2) {
//    xSpeed1 = xSpeed1 * -1;
//  }
//  xPos1 = xPos1 + xSpeed1;
//
//  if (xPos2 > (width - ballsize/2)|| xPos2 <= ballsize/2) {
//    xSpeed2 = xSpeed2 * -1;
//  }
//    xPos2 = xPos2 + xSpeed2;
//
//  if (dist(xPos1, yPos, xPos2, yPos)<ballsize) {
//    xSpeed1 = xSpeed1*-1;
//    xSpeed2 = xSpeed2*-1;
//  }
}
