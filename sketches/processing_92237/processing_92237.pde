
/*
This program draws a rocket that takes off when the user presses and holds the mouse. While the mouse is pressed, a UFO appears and rotates. The program
resets the rocket and UFO once the mouse is unpressed. 

*/

// Variables
int xpos, ypos;
int rocketWidth, rocketHeight;
int rightSmokeX, rightSmokeY, leftSmokeX, leftSmokeY;
int ufoDia, ufoX, ufoY;
float theta;
int lightX,lightY, lightDia;




PImage img;

void setup() {
  // Set the size and background
   size(500,500);
  frameRate (30);
  smooth();
  noStroke();
  
  img = loadImage("url2.jpg");
  
 
  // Rocket variables
  rocketWidth = 70;
  rocketHeight = 150;
  xpos = 215;
  ypos = 250;
  rightSmokeX = 250;
  rightSmokeY = 450;
  leftSmokeX = 250;
  leftSmokeY = 450;
  
  // UFO variables
  theta = PI/4;
  ufoX = -250;
  ufoY = 0;
  ufoDia = 150;
  lightX = 0;
  lightY = 0;
  lightDia = 25;
  
}

void draw() {
  
  // Start takeoff
  if (mousePressed) {
   fill (0);
    rect (0, height-100, width, 100);
    
    image(img, 0, 0);
    
     // Draw the rocket
     fill (69,173,47);
     rect (xpos, ypos, rocketWidth, rocketHeight);
     fill (255);
     triangle (xpos, ypos, xpos+70, ypos, xpos+35, ypos-25);
     //Draw fins of the rocket
     triangle (xpos, ypos+120, xpos, ypos+150, xpos-30, ypos+150);
     triangle (xpos+70, ypos+120, xpos+70, ypos+150, xpos+100, ypos+150);
     
     // Draw the flames
     fill (230,42,32);
     rect (xpos, ypos+150, rocketWidth, rocketHeight-100);
     triangle (xpos, ypos+200, xpos+11.66, ypos+220, xpos+23.33, ypos+200);
     triangle (xpos+23.33, ypos+200, xpos+34.99, ypos+220, xpos+46.66, ypos+200);
     triangle (xpos+46.66, ypos+200, xpos+58.32, ypos+220, xpos+70, ypos+200);     
     
     // Draw right side smoke
     fill (255, 128);
     ellipse (rightSmokeX , rightSmokeY, 100, 50);
     ellipse (rightSmokeX+50, rightSmokeY-10, 60, 50);
     ellipse (rightSmokeX+65, rightSmokeY+15, 70, 40);
     ellipse (rightSmokeX+75, rightSmokeY, 50, 50);
     
     // Draw left side smoke
     ellipse (leftSmokeX , leftSmokeY, 100, 50);
     ellipse (leftSmokeX-50, leftSmokeY-10, 60, 50);
     ellipse (leftSmokeX-65, leftSmokeY+15, 70, 40);
     ellipse (leftSmokeX-75, leftSmokeY, 50, 50);
     // Make smoke move
     rightSmokeX = rightSmokeX+5; 
     leftSmokeX = leftSmokeX-5;
     
     // Make rocket move
     ypos = ypos-10;
     xpos = 215;
     
     // Start UFO entrance
     if (ypos<=(height-750)) {
        background (12,21,54);
        fill (0);
        // Rotate and draw UFO
        rect (0, height-100, width, 100);
        translate (width/2, height/2);
        rotate (theta);
        theta = theta+(PI/8);
        fill (128);
        ellipse (ufoX, ufoY, ufoDia, ufoDia);
        ufoX = ufoX+5;
          // Turn on lights on UFO once it reaches the center
          if (ufoX >= 0) {
            ufoX = 0;
            fill (247,40,40);
            ellipse (lightX+50, lightY, lightDia, lightDia);
            fill (30,245,81);
            ellipse (lightX-50, lightY, lightDia, lightDia);
          }
     }
      
   } else { 
     // Reset rocket and UFO
     background (12,21,54);
     ypos = 250;
     xpos = 215;
     rightSmokeX = 250;
     rightSmokeY = 450;
     leftSmokeX = 250;
     leftSmokeY = 450;
     ufoX = -250;
     
     // Draw the ground
     fill (0);
     rect (0, height-100, width, 100);
     
     // Draw the rocket
     fill (69,173,47);
     rect (xpos, ypos, rocketWidth, rocketHeight);
     fill (255);
     triangle (xpos, ypos, xpos+70, ypos, xpos+35, ypos-25);
     //Draw fins of the rocket
     triangle (xpos, ypos+120, xpos, ypos+150, xpos-30, ypos+150);
     triangle (xpos+70, ypos+120, xpos+70, ypos+150, xpos+100, ypos+150);
   }
}
  


