
// AeonX
// Carnegie Mellon University
// Electronic Media Studio II
// Section D, Professor Eric Singer
// Assignment 04, DUE 09/21/11


PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;

int timeImg1 = 1000;
int timeImg2 = 2000;
int timeImg3 = 3000;
int timeImg4 = 4000;
int timeImg5 = 5000;
int timeImg6 = 6000;
int timeImg7 = 7000;
int timeImg8 = 8000;

//int x = 40;
//int y = 40;

int buttonX = 25;
int buttonY = 375;
int buttonRadius = 15;

float angle = 0.0;
float offset = 60;
float scalar = 40;
float speed = 0.15;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  //frameRate(60);
}


void draw()
{


  // *** calling subroutine for background animation ***

  drawBackground();


  // *** kitty animation ***

  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  angle += speed;
  // Circular motion (GSWP, pg 103)   


  // *** calling subroutines for face components ***

  drawFace(x, y);
  drawEarLeft(x, y);
  drawEarRight(x, y);
  drawEyeShadowLeft(x, y);
  drawEyeLeft(x, y);
  drawEyeShadowRight(x, y);
  drawEyeRight(x, y);


  // *** calling subroutine for button ***

  // The button currently does nothing. I would like it to be able
  // to control a change in the kitty's movement (and color).

  drawButton();
}



/*

 for (int x = 0; x <= width; x += 80) {
 for (int y = 0; y <= height; y += 80) {
 
 // *** mouse button detection code from Samantha Oleson :) ***
 
 float d = dist(mouseX, mouseY, buttonX, buttonY);
 if (d < buttonRadius) {
 if (mousePressed == true) {  
 drawPrettySquares();
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
 fill(r, g, b, 25);
 
 rect(oneTenthWidth * x, oneTenthHeight * y, oneTenthWidth, oneTenthHeight);
 }
 }
 }
 
 */


// *** background animation subroutine ***

void drawBackground()
{
  int currentTime = millis(); 

  img1 = loadImage("PinkSkyWaterBoat01.jpg");
  image(img1, 0, 0, 400, 400);

  if (currentTime > timeImg2) {
    img2 = loadImage("PinkSkyWaterBoat02.jpg");
    image(img2, 0, 0, 400, 400);

    if (currentTime > timeImg3) {
      img3 = loadImage("PinkSkyWaterBoat03.jpg");
      image(img3, 0, 0, 400, 400);

      if (currentTime > timeImg4) {
        img4 = loadImage("PinkSkyWaterBoat04.jpg");
        image(img4, 0, 0, 400, 400);

        if (currentTime > timeImg5) {
          img5 = loadImage("PinkSkyWaterBoat05.jpg");
          image(img5, 0, 0, 400, 400);

          if (currentTime > timeImg6) {
            img6 = loadImage("PinkSkyWaterBoat06.jpg");
            image(img6, 0, 0, 400, 400);

            if (currentTime > timeImg7) {
              img7 = loadImage("PinkSkyWaterBoat07.jpg");
              image(img7, 0, 0, 400, 400);

              if (currentTime > timeImg8) {
                img8 = loadImage("PinkSkyWaterBoat08.jpg");
                image(img8, 0, 0, 400, 400);
              }
            }
          }
        }
      }
    }
  }
}


// *** kitty face component drawing subroutines ***

void drawFace(float x, float y)
{
  fill(255, 185, 244);  // pink (medium)
  ellipse(x + 36, y + 42, 50, 50);
}

void drawEarLeft(float x, float y)
{
  fill(255, 185, 244);  // pink (medium)
  triangle(x + 11, y + 37, x + 2, y + 7, x + 30, y + 18);
}

void drawEarRight(float x, float y)
{
  fill(255, 185, 244);  // pink (medium)
  triangle(x + 42, y + 17, x + 78, y + 17, x + 61, y + 38);
}

void drawEyeShadowLeft(float x, float y)
{
  fill(185, 144, 174);  // pink (dark)
  ellipse(x + 30, y + 44, 30, 30);  // drop shadow 1 pixel right & down
}

void drawEyeLeft(float x, float y)
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

void drawEyeShadowRight(float x, float y)
{
  fill(185, 144, 174);  // pink (dark)
  ellipse(x + 53, y + 44, 12, 12);  // shadow 1 pixel right & down
}

void drawEyeRight(float x, float y)
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
  fill(255, 185, 244);  // pink (medium)
  ellipse(25, 375, 30, 30);
  strokeWeight(3);
  stroke(203, 14, 109);  // pink (hot)
  fill(229, 242, 255);  // blue (light)
  ellipse(25, 375, 20, 20);
  noStroke();
  fill(91, 94, 98);  // gray
  arc(25, 375, 5, 20, radians(10), radians(350));  // pupil
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

