


//variables
int circ = 30;

int xPos1, yPos1; //set below
int xPos2, yPos2; //set below
//int xPos3, yPos3; //set below
//int xPos4, yPos4; //set below

int xSpeed1 = 1;
int xSpeed2 = 3;
//int xSpeed3 = 1;
//int xSpeed4 = 2;

int ySpeed1 = 2;
int ySpeed2 = 1;
//int ySpeed3 = 3;
//int ySpeed4 = 1;

int xDirection1 = 1;
int xDirection2 = 1;
//int xDirection3 = 1;
//int xDirection4 = 1;

int yDirection1 = 1;
int yDirection2 = 1;
//int yDirection3 = 1;
//int yDirection4 = 1;

//style
void setup() 
{
  size(250, 250);
  noStroke();
  smooth(); 
  
  //shape starting point (center)
  xPos1 = width / 2;
  yPos1 = height / 2;

  xPos2 = 10;
  yPos2 = 10;

//CUT// ball three + four
//  xPos3 = 45;
//  yPos3 = 23;
//
//  xPos4 = 97;
//  yPos4 = 86;
//END CUT//

}


//bounce variables
 void draw() 
 {
  background(39, 64, 169);
  xPos1 = xPos1 + (xSpeed1 * xDirection1);
  yPos1 = yPos1 + (ySpeed1 * yDirection1);
  
  xPos2 = xPos2 + (xSpeed2 * xDirection2);
  yPos2 = yPos2 + (ySpeed2 * yDirection2);

//CUT// ball three + four  
//  xPos3 = xPos3 + (xSpeed3 * xDirection3);
//  yPos3 = yPos3 + (ySpeed3 * yDirection3);
  
//  xPos4 = xPos4 + (xSpeed4 * xDirection4);
//  yPos4 = yPos4 + (ySpeed4 * yDirection4);
//END CUT//

//ball one bounce_wall
  if(xPos1 > width - circ || xPos1 < 0) {
    xDirection1 *= -1;
  }
  if(yPos1 > height - circ || yPos1 < 0) {
    yDirection1 *= -1;
  }  
  fill(127, 255, 212);
  ellipse(xPos1 + circ/2, yPos1 + circ/2, 30, 30);
  
//ball two bounce_wall
  if(xPos2 > width - circ || xPos2 < 0) {
    xDirection2 *= -1;
  }
  if(yPos2 > height - circ || yPos2 < 0) {
    yDirection2 *= -1;
  }  
  fill(224, 255, 255);
  ellipse(xPos2 + circ/2, yPos2 + circ/2, 30, 30);

//CUT// ball three + four
//ball three bounce_wall
//  if(xPos3 > width - circ || xPos3 < 0) {
//    xDirection3 *= -1;
//  }
//  if(yPos3 > height - circ || yPos3 < 0) {
//    yDirection3 *= -1;
//  }  
//  fill(0, 245, 255, 15);
//  ellipse(xPos3 + circ/2, yPos3 + circ/2, 30, 30);
//ball four bounce_wall
//  if(xPos4 > width - circ || xPos4 < 0) {
//    xDirection4 *= -1;
//  }
//  if(yPos4 > height - circ || yPos4 < 0) {
//    yDirection4 *= -1;
//  }  
//  fill(187, 255, 255, 15);
//  ellipse(xPos4 + circ/2, yPos4 + circ/2, 30, 30);
//END CUT

//ball one collide
  if(dist(xPos1, yPos1, xPos2, yPos2) < 30) {
    xDirection1 *= -1;
  }  if(dist(xPos1, yPos1, xPos2, yPos2) < 30) {
    yDirection1 *= -1;
  }
  
//ball two collide
  if(dist(xPos1, yPos1, xPos2, yPos2) < 30) {
    xDirection2 *= -1;
  } if (dist(xPos1, yPos1, xPos2, yPos2) < 30) {
    yDirection2 *= -1;  
  }
  
  
  
}

