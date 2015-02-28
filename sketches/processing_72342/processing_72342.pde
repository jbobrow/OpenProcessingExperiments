
int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;
PImage tempo;
float deg;
float degTwo;


void setup() {
 
 tempo = loadImage("tempo.jpeg");
 size(500,750);
 background(tempo);
 
 xOne = -43;
 yOne = -43;

 xTwo = -43;
 yTwo = 43;

 xThree = 43;
 yThree = -43;

 xFour = 43;
 yFour = 43;
 
 deg = 0.0;
 degTwo = 0.0;
 
 
}


void draw() {
  
 background(tempo);
 
  noFill();
  strokeWeight(19);
  strokeCap(SQUARE);
  smooth();
 
 
 pushMatrix();
  translate(246, 550);
  pushStyle();
  stroke(0,126);
  ellipse(0,0, 87,87);
 popStyle();
 popMatrix();
 
 
 pushMatrix();
  translate(246, 550);
  if(mousePressed==true) {
  deg+=5;
  }
  float rad = radians(deg);
  rotate(rad);

  stroke(255, 126);
  line(xOne,yOne, xFour, yFour);
  line(xTwo,yTwo, xThree,yThree);
 popMatrix();
 
 
 pushMatrix();
  translate(75, 155);
  pushStyle();
  stroke(0,87);
  strokeWeight(7);
  ellipse(0,0, 32,32);
 popStyle();
 popMatrix();
 
 
 pushMatrix();
  translate(75,157);
  if(mousePressed==true) {
  degTwo-=5;
  }
  float radTwo = radians(degTwo);
  rotate(radTwo);
 
 pushStyle();
  stroke(0,126);
  strokeWeight(3);
  line(-6,0, 12,0);
  line(0,-6, -2,20);
 popStyle();
 popMatrix();
 
 
 }

