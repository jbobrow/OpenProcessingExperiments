
//////////////////////////////////////////////////////////////////////
// Daniel Bickley
// A Phone
// 10/02/2012
// This is a Program designed to use several programmer-defined methods
// as well as different kinds of variables and contants to create something
// that is supposed to look lilke a phone with apps on it, but with
// squares that change colors.
// Clicking the ellipse on the bottom of the phone will turn on the apps
// Moving the mouse around creates a mosaic pattern on the apps.
//////////////////////////////////////////////////////////////////////

//Variables

//Two variables to use paramaters from the "drawApps" method in other methods quickly
// and easily.
int appXStore, appYStore;

//Variable to turn on phone and initialize animation
boolean phoneOn = false;

//Variables to change the color of the apps every time the program runs, NOT
// when the frame is redrawn
float fillR;
float fillG;
float fillB;

//Constants for the X Positions of the Apps
final int ROW_1X = 210;
final int ROW_2X = 270;
final int ROW_3X = 330;
final int ROW_4X = 390;

//Constants for the Y Positions of the Apps
final int COLLUM_1Y = 135;
final int COLLUM_2Y = 195;
final int COLLUM_3Y = 255;
final int COLLUM_4Y = 315;
final int COLLUM_5Y = 375;
final int COLLUM_6Y = 435;

void setup () {
  size (600, 600);
  
  //Creating the App colors
  fillR = random (255);
  fillG = random (255);
  fillB = random (255);
}


void draw () {
  background (131, 70, 8);
  stroke (0);
  
  //Drawing the phone, as well as apps when the phone button is pressed
  drawPhone();
  if (phoneOn) {
    noStroke();
    putAppsOnPhone();
  }
}

void drawPhone() {
  //Simply creating the phone background and 'On' button
  rectMode (CORNER);
  fill (0, 0, 50);
  rect (150, 50, 300, 500);
  fill (0);
  rect (175, 100, 250, 425);
  stroke (255);
  fill (0);
  ellipse (300, 525, 40, 40);
}

void mousePressed () {
  //Actually turning on the phone by clicking the button
  if (mouseX >= 260 && mouseX <= 320 && mouseY >= 505 && mouseY <= 545) {
    phoneOn = !phoneOn;
  }
 
}



void drawApps (int appX, int appY) {
  
  //Drawing apps using the paramaters given in "putAppsOnPhone" method. 
  rectMode (CENTER);
  fill (fillR, fillG, fillB);
  rect (appX, appY, 50, 50);
  
  //Making the apps become brighter when the mouse is closer, and making a mosaic pattern using the apps
  fill (0, distanceFromMouse());
  rect (appX, appY, 50, 50);
  appXStore = appX;
  appYStore = appY;
}

//Method to determine how far the mouse is from each app for use in the "drawApps" method.
float distanceFromMouse() {
  float distance;
  distance = (float) Math.sqrt ( Math.pow ((mouseX-appXStore), 2)+ Math.pow ((mouseY-appYStore), 2));
  return distance;
}

//Series of "drawApps" methods to make them easier to look at and read. Change the X and Y values of the
// apps here.

void putAppsOnPhone() {
    drawApps (ROW_1X, COLLUM_1Y);
    drawApps (ROW_2X, COLLUM_1Y);
    drawApps (ROW_3X, COLLUM_1Y);
    drawApps (ROW_4X, COLLUM_1Y);
    drawApps (ROW_1X, COLLUM_2Y);
    drawApps (ROW_2X, COLLUM_2Y);
    drawApps (ROW_3X, COLLUM_2Y);
    drawApps (ROW_4X, COLLUM_2Y);
    drawApps (ROW_1X, COLLUM_3Y);
    drawApps (ROW_2X, COLLUM_3Y);
    drawApps (ROW_3X, COLLUM_3Y);
    drawApps (ROW_4X, COLLUM_3Y);
    drawApps (ROW_1X, COLLUM_4Y);
    drawApps (ROW_2X, COLLUM_4Y);
    drawApps (ROW_3X, COLLUM_4Y);
    drawApps (ROW_4X, COLLUM_4Y);
    drawApps (ROW_1X, COLLUM_5Y);
    drawApps (ROW_2X, COLLUM_5Y);
    drawApps (ROW_3X, COLLUM_5Y);
    drawApps (ROW_4X, COLLUM_5Y);
    drawApps (ROW_1X, COLLUM_6Y);
    drawApps (ROW_2X, COLLUM_6Y);
    drawApps (ROW_3X, COLLUM_6Y);
    drawApps (ROW_4X, COLLUM_6Y);
  }




