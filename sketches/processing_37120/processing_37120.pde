
// AeonX
// Carnegie Mellon University
// Electronic Media Studio II
// Section D, Professor Eric Singer
// Assignment 03, DUE 09/14/11 (extended from 9/12)


PImage img;

int buttonX = 117;
int buttonY = 682;
int buttonRadius = 50;

void setup() {
  size(800, 800);
  smooth();
  noStroke();
  frameRate(5);
}


void draw()
{   
  img = loadImage("PinkBlueSkyWater5.jpg");
  image(img, 0, 0, 800, 800);
  
  for (int x = 0; x <= width; x += 80) {
    for (int y = 0; y <= height; y += 80) {


      // *** mouse button detection code from Samantha Oleson :) ***

      float d = dist(mouseX, mouseY, buttonX, buttonY);
      if (d < buttonRadius) {
        if (mousePressed == true) {  
          drawPrettySquares();
          drawBigEyes();
        }
      }


      // *** calling subroutines for face components ***

      drawFace(x, y);

      drawEarLeft(x, y);

      drawEarRight(x, y);

      drawEyeShadowLeft(x, y);

      drawEyeLeft(x, y);

      drawEyeShadowRight(x, y);

      drawEyeRight(x, y);

      // *** calling subroutine for button ***

      drawButton();
    }
  }
}


// *** flashing squares from 9/7/11 class example ***

void drawPrettySquares ()
{
  int oneTenthWidth = width /  10;
  int oneTenthHeight = height / 10;
  for (int x = 0; x <=9; x++) {
    for (int y= 0; y <=9; y++) {

      int r = int(random(256));
      int g = int(random(256));
      int b = int(random(256));
      fill(r, g, b, 5);

      rect(oneTenthWidth * x, oneTenthHeight * y, oneTenthWidth, oneTenthHeight);
    }
  }
}


// *** face component drawing subroutines ***

void drawFace(int x, int y)
{
  fill(255, 185, 244);  // pink (medium)
  ellipse(x + 36, y + 42, 50, 50);
}

void drawEarLeft(int x, int y)
{
  fill(255, 185, 244);  // pink (medium)
  triangle(x + 11, y + 37, x + 2, y + 7, x + 30, y + 18);
}

void drawEarRight(int x, int y)
{
  fill(255, 185, 244);  // pink (medium)
  triangle(x + 42, y + 17, x + 78, y + 17, x + 61, y + 38);
}

void drawEyeShadowLeft(int x, int y)
{
  fill(185, 144, 174);  // pink (dark)
  ellipse(x + 30, y + 44, 30, 30);  // drop shadow 1 pixel right & down
}

void drawEyeLeft(int x, int y)
{
  fill(91, 94, 98);  // gray
  ellipse(x + 29, y + 43, 30, 30);  // eyelid

  fill(229, 242, 255);  // blue (light)
  float BlinkLeft = constrain(map(float(mouseY), 0, 800, 30, 0), 0, 30);
  // tracking mouseY from anywhere in the window
  // constraining mouseY from 0 to a height of 30
  ellipse(x + 29, y + 43, 30, BlinkLeft);  // sclera

  fill(91, 94, 98);  // gray
  arc(x + 29, y + 43, 5, 25, radians(10), radians(350));  // pupil
}

void drawEyeShadowRight(int x, int y)
{
  fill(185, 144, 174);  // pink (dark)
  ellipse(x + 53, y + 44, 12, 12);  // shadow 1 pixel right & down
}

void drawEyeRight(int x, int y)
{
  fill(91, 94, 98);  // gray
  ellipse(x + 52, y + 43, 12, 12);  // eyelid

  fill(229, 242, 255);  // blue (light)
  float BlinkRight = constrain(map(float(mouseY), 0, 800, 12, 0), 0, 12);
  // tracking mouseY from anywhere in the window
  // constraining mouseY from 0 to a height of 12
  ellipse(x + 52, y + 43, 12, BlinkRight);  // sclera

  fill(91, 94, 98);  // gray
  arc(x + 52, y + 43, 2, 5, radians(10), radians(350));  // pupil
}

void drawButton()
{
  strokeWeight(6);
  stroke(203, 14, 109);  // pink (hot)
  fill(229, 242, 255, 25);  // blue (light)
  ellipse(117, 682, 100, 100);
  noStroke();
}

void drawBigEyes()
{
  // Eye Left
  fill(185, 144, 174);  // pink (dark)
  ellipse(328, 413, 300, 300);  // shadow 3 pixels right & down
  fill(229, 242, 255);  // blue (light)
  ellipse(325, 410, 300, 300);
  fill(0, 150);  // black (transparent)
  arc(325, 410, 50, 150, radians(10), radians(350));  // pupil
  
  //Eye Right
  fill(185, 144, 174);  // pink (dark)
  ellipse(558, 413, 120, 120);  // shadow 3 pixels right & down
  fill(229, 242, 255);  // blue (light)
  ellipse(555, 410, 120, 120);
  fill(0, 150);  // black (transparent)
  arc(555, 410, 20, 50, radians(10), radians(350));  // pupil
}


/*
 The trick for the blink is to control the size of the
 light blue elipse (the sclera)... Not the gray eyelid.
 The pupil appears to be covered by the eyelid,
 but in fact it remains in front of the "moving" eyelid.
 This only works because the pupil and eyelid are the same color.
 Thank you, Eric!!     :)
     
 Eric's class instruction from 9/12/11
 (ems_code_9_12 folder, sketch_sep12o):
 1) showed how to put the components of the face into subroutines
 2) expanded mouseY to track anywhere on the screen (to control the blinking eyes)
 3) addressed how to tile a triangle (different than tiling an ellipse or an arc)
*/

