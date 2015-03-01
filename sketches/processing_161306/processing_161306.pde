
//set draw Logo function
void drawLogo(int logoSize, int xCenter, int yCenter) {

  //declare variables for background circle
  int xBackCircleCenter;
  int yBackCircleCenter;
  int backCircleSize;

  //initialize variable values for background circle
  xBackCircleCenter = xCenter;
  yBackCircleCenter = yCenter;
  backCircleSize = logoSize;
  
  //declare variables for top triangle
  int xTriTopTop; 
  int yTriTopTop; 
  int xTriTopRight; 
  int yTriTopRight; 
  int xTriTopLeft; 
  int yTriTopLeft;

  //initialize variable values for top triangle
  xTriTopTop = xCenter;
  yTriTopTop = yCenter - logoSize/4 - (logoSize/16) ;
  xTriTopRight = xCenter + (logoSize/8);
  yTriTopRight = yCenter - (logoSize/16);
  xTriTopLeft = xCenter - (logoSize/8);
  yTriTopLeft = yCenter - (logoSize/16);

  //declare variables for left triangle
  int xTriLeftTop; 
  int yTriLeftTop; 
  int xTriLeftRight; 
  int yTriLeftRight; 
  int xTriLeftLeft; 
  int yTriLeftLeft;

  //initialize variable values for left triangle
  xTriLeftTop = xTriTopLeft;
  yTriLeftTop = yTriTopLeft;
  xTriLeftRight = xCenter;
  yTriLeftRight = yTriTopTop + logoSize/2;
  xTriLeftLeft = xTriLeftRight - logoSize/4;
  yTriLeftLeft = yTriTopTop + logoSize/2;

  //declare variables for right triangle
  int xTriRightTop; 
  int yTriRightTop; 
  int xTriRightRight; 
  int yTriRightRight; 
  int xTriRightLeft; 
  int yTriRightLeft;

  //initialize variable values for right triangle
  xTriRightTop = xTriTopRight;
  yTriRightTop = yTriTopRight;
  xTriRightLeft = xTriLeftRight;
  yTriRightLeft = yTriLeftRight;
  xTriRightRight = xTriRightLeft + logoSize/4;
  yTriRightRight = yTriRightLeft;
  
  //declare variables for main red circle
  int xRedMedCircleCenter;
  int yRedMedCircleCenter;
  int redMedCircleSize;
  
  //initialize variable values for main red circle
  redMedCircleSize = logoSize/16;
  xRedMedCircleCenter = xTriRightRight;
  yRedMedCircleCenter = yCenter - (2 * redMedCircleSize);
  
  //declare variables for top small red circle
  int xTopSmallRedCircleCenter;
  int yTopSmallRedCircleCenter;
  float topSmallRedCircleSize;
  
  //initialize variavble values for top small red circle
  topSmallRedCircleSize = logoSize/32;
  xTopSmallRedCircleCenter = xRedMedCircleCenter - logoSize/14;
  yTopSmallRedCircleCenter = yRedMedCircleCenter - logoSize/8;
  
  //declare variables for second small red circle
  int x2ndSmallRedCircleCenter;
  int y2ndSmallRedCircleCenter;
  float secondSmallRedCircleSize;
  
  //initialize variable values for second small red circle
  secondSmallRedCircleSize = logoSize/32;
  x2ndSmallRedCircleCenter = xRedMedCircleCenter - logoSize/24;
  y2ndSmallRedCircleCenter = yRedMedCircleCenter - logoSize/14;
  
  //declare variables for third small red circle
  int x3rdSmallRedCircleCenter;
  int y3rdSmallRedCircleCenter;
  float thirdSmallRedCircleSize;
  
  //initialize variable values for third small red circle
  thirdSmallRedCircleSize = logoSize/32;
  x3rdSmallRedCircleCenter = xRedMedCircleCenter + logoSize/24;
  y3rdSmallRedCircleCenter = yRedMedCircleCenter + logoSize/14;
  
  //declare variables for bottom small red circle
  int xBottomSmallRedCircleCenter;
  int yBottomSmallRedCircleCenter;
  float bottomSmallRedCircleSize;
  
  //initialize variable values for bottom small red circle
  bottomSmallRedCircleSize = logoSize/32;
  xBottomSmallRedCircleCenter = xRedMedCircleCenter + logoSize/14;
  yBottomSmallRedCircleCenter = yRedMedCircleCenter + logoSize/8;

  //declare variables for main blue circle
  int xBlueMedCircleCenter;
  int yBlueMedCircleCenter;
  int blueMedCircleSize;
  
  //initialize variable values for main blue circle
  blueMedCircleSize = logoSize/16;
  xBlueMedCircleCenter = xTriLeftLeft;
  yBlueMedCircleCenter = yCenter - (2 * redMedCircleSize);
  
  //declare variables for top small blue circle
  int xTopSmallBlueCircleCenter;
  int yTopSmallBlueCircleCenter;
  float topSmallBlueCircleSize;
  
  //initialize variable values for top small blue circle
  topSmallBlueCircleSize = logoSize/32;
  xTopSmallBlueCircleCenter = xBlueMedCircleCenter + logoSize/14;
  yTopSmallBlueCircleCenter = yBlueMedCircleCenter - logoSize/8;
  
  //declare variables for second small blue circle
  int x2ndSmallBlueCircleCenter;
  int y2ndSmallBlueCircleCenter;
  float secondSmallBlueCircleSize;
  
  //initialize variable values for second small blue circle
  secondSmallBlueCircleSize = logoSize/32;
  x2ndSmallBlueCircleCenter = xBlueMedCircleCenter + logoSize/24;
  y2ndSmallBlueCircleCenter = yRedMedCircleCenter - logoSize/14;
  
  //declare variables for third small blue circle
  int x3rdSmallBlueCircleCenter;
  int y3rdSmallBlueCircleCenter;
  float thirdSmallBlueCircleSize;
  
  //initialize variable values for third small blue circle
  thirdSmallBlueCircleSize = logoSize/32;
  x3rdSmallBlueCircleCenter = xBlueMedCircleCenter - logoSize/24;
  y3rdSmallBlueCircleCenter = yRedMedCircleCenter + logoSize/14;
  
  //declare variables for bottom small blue circle
  int xBottomSmallBlueCircleCenter;
  int yBottomSmallBlueCircleCenter;
  float bottomSmallBlueCircleSize;
  
  //initialize variable values for bottom small red circle
  bottomSmallBlueCircleSize = logoSize/32;
  xBottomSmallBlueCircleCenter = xBlueMedCircleCenter - logoSize/14;
  yBottomSmallBlueCircleCenter = yBlueMedCircleCenter + logoSize/8;
  
  //declare variables for main green circle
  int xGreenMedCircleCenter;
  int yGreenMedCircleCenter;
  int greenMedCircleSize;
  
  //initialize variable values for main green circle
  greenMedCircleSize = logoSize/16;
  xGreenMedCircleCenter = xCenter;
  yGreenMedCircleCenter = yCenter + (logoSize/4) + (logoSize/16);
  
  //declare variables for left small green circle
  int xLeftSmallGreenCircleCenter;
  int yLeftSmallGreenCircleCenter;
  float leftSmallGreenCircleSize;
  
  //initialize variable values for left small green circle
  leftSmallGreenCircleSize = logoSize/32;
  xLeftSmallGreenCircleCenter = xGreenMedCircleCenter -  3* greenMedCircleSize;
  yLeftSmallGreenCircleCenter = yGreenMedCircleCenter;
  
  //declare variables for second small green circle
  int x2ndSmallGreenCircleCenter;
  int y2ndSmallGreenCircleCenter;
  float secondSmallGreenCircleSize;
  
  //initialize variable values for third small green circle
  secondSmallGreenCircleSize = logoSize/32;
  x2ndSmallGreenCircleCenter = xGreenMedCircleCenter -  greenMedCircleSize - greenMedCircleSize/2;
  y2ndSmallGreenCircleCenter = yGreenMedCircleCenter;
  
  //declare variables for third small green circle
  int x3rdSmallGreenCircleCenter;
  int y3rdSmallGreenCircleCenter;
  float thirdSmallGreenCircleSize;
  
  //initialize variable values for third small green circle
  thirdSmallGreenCircleSize = logoSize/32;
  x3rdSmallGreenCircleCenter = xGreenMedCircleCenter +  greenMedCircleSize + greenMedCircleSize/2;
  y3rdSmallGreenCircleCenter = yGreenMedCircleCenter;
  
   //declare variables for right small green circle
  int xRightSmallGreenCircleCenter;
  int yRightSmallGreenCircleCenter;
  float rightSmallGreenCircleSize;
  
  //initialize variable values for right small green circle
  rightSmallGreenCircleSize = logoSize/32;
  xRightSmallGreenCircleCenter = xGreenMedCircleCenter +  3 * greenMedCircleSize;
  yRightSmallGreenCircleCenter = yGreenMedCircleCenter;
  
  
  //draw background circle
  stroke(0);
  fill(255);
  ellipse(xBackCircleCenter, yBackCircleCenter, backCircleSize, backCircleSize);
  
  //draw top triangle
  //fill to gold
  noStroke();
  fill(242, 206, 0);
  triangle(xTriTopTop, yTriTopTop, xTriTopRight, yTriTopRight, xTriTopLeft, yTriTopLeft);

  //draw left triangle
  triangle(xTriLeftTop, yTriLeftTop, xTriLeftRight, yTriLeftRight, xTriLeftLeft, yTriLeftLeft);

  //draw right triangle
  triangle(xTriRightTop, yTriRightTop, xTriRightLeft, yTriRightLeft, xTriRightRight, yTriRightRight);
  
  //draw main red circle
  stroke(0);
  fill(255,0,0);
  ellipse(xRedMedCircleCenter, yRedMedCircleCenter, redMedCircleSize ,redMedCircleSize);
  
  //draw top small red circle
  ellipse(xTopSmallRedCircleCenter, yTopSmallRedCircleCenter, topSmallRedCircleSize, topSmallRedCircleSize);
  
  //draw second small red circle
  ellipse(x2ndSmallRedCircleCenter, y2ndSmallRedCircleCenter, secondSmallRedCircleSize, secondSmallRedCircleSize);
  
  //draw third small red circle
  ellipse(x3rdSmallRedCircleCenter, y3rdSmallRedCircleCenter, thirdSmallRedCircleSize, thirdSmallRedCircleSize);

  //draw bottom small red circle
  ellipse(xBottomSmallRedCircleCenter, yBottomSmallRedCircleCenter, bottomSmallRedCircleSize, bottomSmallRedCircleSize);
  
  //draw main blue circle
  fill(0,0,255);
  ellipse(xBlueMedCircleCenter, yBlueMedCircleCenter, blueMedCircleSize, blueMedCircleSize);
  
  //draw top small blue circle
  ellipse(xTopSmallBlueCircleCenter, yTopSmallBlueCircleCenter, topSmallBlueCircleSize, topSmallBlueCircleSize);
  
  //draw second small blue circle
  ellipse(x2ndSmallBlueCircleCenter, y2ndSmallBlueCircleCenter, secondSmallBlueCircleSize, secondSmallBlueCircleSize);
  
  //draw third small blue circle
  ellipse(x3rdSmallBlueCircleCenter, y3rdSmallBlueCircleCenter, thirdSmallBlueCircleSize, thirdSmallBlueCircleSize);
  
  //draw bottom small blue circle
  ellipse(xBottomSmallBlueCircleCenter, yBottomSmallBlueCircleCenter, bottomSmallBlueCircleSize, bottomSmallBlueCircleSize);
  
  //draw main green circle
  fill(0,255,0);
  ellipse(xGreenMedCircleCenter, yGreenMedCircleCenter, greenMedCircleSize, greenMedCircleSize);
  
  //draw left small green circle
  ellipse(xLeftSmallGreenCircleCenter, yLeftSmallGreenCircleCenter, leftSmallGreenCircleSize, leftSmallGreenCircleSize);
  
  //draw second small green circle
  ellipse(x2ndSmallGreenCircleCenter, y2ndSmallGreenCircleCenter, secondSmallGreenCircleSize, secondSmallGreenCircleSize);
  
  //draw third small green circle
  ellipse(x3rdSmallGreenCircleCenter, y3rdSmallGreenCircleCenter, thirdSmallGreenCircleSize, thirdSmallGreenCircleSize);
  
  //draw right small green circle
  ellipse(xRightSmallGreenCircleCenter, yRightSmallGreenCircleCenter, rightSmallGreenCircleSize, rightSmallGreenCircleSize);
}




class Logo {
  //properties:
  int sizeLogo;
  int xCenterLogo;
  int yCenterLogo;
  boolean rotateClockwise = true;
  boolean moveRight = true;

  //methods:
  //create constructor class
  public Logo(int newSize, int xNew, int yNew) {
    //assign properties
    sizeLogo = newSize;
    xCenterLogo = xNew;
    yCenterLogo = yNew;
  }

  //method to draw logo
  public void display() {
    drawLogo(sizeLogo, xCenterLogo, yCenterLogo);
  }
}
/** 
 * Title: Simple Logo Brush
 * Name: JULIAN GLASS-PILON
 * Date: Nov 10th, 2013
 * Description: Using the logo class that you created in DB3, write a sketch where the 
 * logo gets drawn whenever the user clicks and/or drags the mouse.
 **/


//create logoBrush instance
Logo logoBrush;
Logo pressBrush;

void setup() {
  //determine size of canvas
  size(400, 400);

  //make background color white
  background(255);

  //instantiate the logoBrush instance to a default location of (mouseX,mouseY) with a size of 50
  //This is to instatiate the Brush1 instance without it reacting to the default position 
  //of the mouse 
  logoBrush = new Logo(0, 0, 0);
}  

//instantiate the pressBrush instance to a location of (mouseX, mouseY) with a size of 50 when the mouse
//is moved.
void mouseMoved() {
  pressBrush = new Logo(50, mouseX, mouseY);
}

//display the pressBrush when the mouse is pressed
void mousePressed() {
  pressBrush.display();
}

//re-define the brush instance each time the mouse is dragged
void mouseDragged() {
  //re-define x and y position of the brush to the mouse coordinates
  //re-define the size of the brush relative to the absolute value of the 
  //distance between the previous location and the actual location of the mouse
  logoBrush.xCenterLogo = mouseX;
  logoBrush.yCenterLogo = mouseY;
  logoBrush.sizeLogo = abs(5 * (mouseX - pmouseX));
}

void draw() {
  //draw the brush 
  logoBrush.display();
}



