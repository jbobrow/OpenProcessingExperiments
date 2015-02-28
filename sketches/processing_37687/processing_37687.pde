
// AeonX
// Carnegie Mellon University
// Electronic Media Studio II
// Section D, Professor Eric Singer
// Assignment 04, DUE 09/21/11

// GSWP = Getting Started With Processing
// by Casey Reas & Ben Fry (thanks!!)


int numFrames = 8;  // number of background images/frames
PImage[] images = new PImage[numFrames];  
int currentFrame = 1;

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

  for (int i = 1; i < images.length; i++) {
    String imageName = "PinkSkyWaterBoat" + nf(i, 2) + ".jpg";
    images[i] = loadImage(imageName);
  }
  
  // Looping the sequence of background images/frames. (GSWP, pg 152)
  
  // I have to admit, I only partially understand how this works.
  
  // To see how I was trying (and failing) to loop the images
  // previously, view EMS_Assign04_AnimationTest01.
  
  // The images above are labeled PinkSkyWaterBoat01.jpg,
  // PinkSkyWaterBoat02.jpg, etc...
  // Therefore, nf(i, 2) because 01 or 02, etc are 2 characters.
  // If the images were labeled PinkSkyWaterBoat001.jpg,
  // PinkSkyWaterBoat002.jpg, etc...
  // Then nf(i, 3) because 001 or 002, etc are 3 characters.

  frameRate(3);
}


void draw()
{

  image(images[currentFrame], 0, 0);
  currentFrame++;
  if (currentFrame >= images.length) {
    currentFrame = 1;
  }

  // *** calling subroutine for button ***
  
  drawButton();
  

  // *** kitty animation ***

  // In AnimationTest03, I'm trying to get the kitty's movement to change
  // if the mouse is clicked. Here, I am just showing that one animation
  // will run without error:

  //  float x = 150;
  //  float y = offset + sin(angle) * scalar;
  //  angle += speed;
  // Vertical bounce. (GSWP, pgs 102-103)

  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  angle += speed;
  // Circular motion. (GSWP, pg 103)   


  // *** calling subroutine for kitty face ***
  
  drawKitty(x, y);
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



// *** kitty face subroutine ***
// Separate components of the kitty face from Assign03
// are now combined into one subroutine. (GSWP, pg 121)

void drawKitty(float x, float y)
{

  //  pushMatrix();
  translate(x, y);

  fill(255, 185, 244);  // HEAD - pink (medium)
  ellipse(36, 42, 50, 50);

  fill(255, 185, 244);  // EAR LEFT - pink (medium)
  triangle(11, 37, 2, 7, 30, 18);

  fill(255, 185, 244);  // EAR RIGHT - pink (medium)
  triangle(42, 17, 78, 17, 61, 38);

  fill(185, 144, 174);  // EYE SHADOW LEFT - pink (dark)
  ellipse(30, 44, 30, 30);

  fill(91, 94, 98);  // EYELID - gray
  ellipse(29, 43, 30, 30);

  fill(229, 242, 255);  // SCLERA - blue (light)
  float BlinkLeft = constrain(map(float(mouseY), 0, 800, 30, 0), 0, 30);
  // tracking mouseY from anywhere in the window
  // constraining mouseY from 0 to a height of 30
  ellipse(29, 43, 30, BlinkLeft);

  fill(91, 94, 98);  // PUPIL - gray
  arc(29, 43, 5, 25, radians(10), radians(350));

  fill(185, 144, 174);  // EYE SHADOW RIGHT - pink (dark)
  ellipse(53, 44, 12, 12);

  fill(91, 94, 98);  // EYELID - gray
  ellipse(52, 43, 12, 12);

  fill(229, 242, 255);  // SCLERA - blue (light)
  float BlinkRight = constrain(map(float(mouseY), 0, 800, 12, 0), 0, 12);
  // tracking mouseY from anywhere in the window
  // constraining mouseY from 0 to a height of 12
  ellipse(52, 43, 12, BlinkRight);

  fill(91, 94, 98);  // EYELID - gray
  arc(52, 43, 2, 5, radians(10), radians(350));
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

