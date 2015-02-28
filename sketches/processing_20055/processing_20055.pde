
/* ASSIGNMENT 3 - RESPOND
Simon Wiscombe

For 544. Make 2 eyes and have them respond, dynamically, to the mouse input.
These pair of eyes move away from the cursor, the eyes avoiding eye contact with the cursor itself, until the user clicks,
when the eyes tell the user to stop clicking, etc. Keep clicking for more reactions from eyes.

 Future ideas:
 perspective: using camera
 beginCamera();
 camera();
 rotateX(#);
 rotateY(#);
 translate the camera s.t. eyes are still in frame;
 endCamera();
 */
import processing.opengl.*;

int bgColor = 255;

float eyeLocX, eyeLocY;
float pupilRX, pupilRY;
float pupilLX, pupilLY;
Boolean pupilLock = false;

int clickCount = 0;

int[] eyeCenterX = new int[2];
int[] eyeCenterY = new int[2];
int[] pupilOffsetX = new int[2];
int[] pupilOffsetY = new int[2];

int clickX;
int clickY;

float followX, followY;
float eyeEasing = 0.02;
float pupilEasing = 0.1;

/* Cursor location and eye location. In general, they're opposites, with
 the screen divided into 4 quadrants, as defined by maths:
 ---------------
 |   2   |   1   |
 |-------|-------|
 |   3   |   4   |
 ---------------   
 */

int cursorLoc;
int eyeLoc;

// Eye mode: 0 = "normal", 1 - look at cursor
int eyeMode = 0;

int timer = 0;

PFont talkingFont;

void setup()
{
  size(640,480,OPENGL);
  smooth();
  strokeCap(ROUND);
  frameRate(60);
  cursor(HAND);

  eyeLocX = width/2;
  eyeLocY = height/2;

  pupilRX = 70;
  pupilLX = -70;
  pupilRY = pupilLY = 0;

  eyeCenterX[0] = -70;
  eyeCenterX[1] = 70;
  eyeCenterY[0] = eyeCenterY[1] = 0;

  pupilOffsetX[0] = pupilOffsetX[1] = 0;
  pupilOffsetY[0] = pupilOffsetX[1] = 0;
  
  timer = 0;
  
  talkingFont = loadFont("Rabiohead-48.vlw");
  textFont(talkingFont);
  textAlign(CENTER);
}

void draw()
{
  background(bgColor);
  
  // A lot of the eye behavior depends heavily on the position of the mouse, ergo:
  if(mouseX > width/2) {
    if(mouseY < height/2) {
      cursorLoc = 1;

      eyeLoc = 3;
      followX = 150;
      followY = 400;
      pupilOffsetX[0] = -100;
      pupilOffsetX[1] = 45;
      pupilOffsetY[0] = pupilOffsetY[1] = 10;
    }
    else {
      cursorLoc = 4;

      eyeLoc = 2;
      followX = 150;
      followY = 70;
      pupilOffsetX[0] = -100;
      pupilOffsetX[1] = 45;
      pupilOffsetY[0] = pupilOffsetY[1] = -10;
    }
  }
  else {
    if(mouseY < height/2) {
      cursorLoc = 2;

      eyeLoc = 4;
      followX = 490;
      followY = 400;
      pupilOffsetX[0] = -45;
      pupilOffsetX[1] = 100;
      pupilOffsetY[0] = pupilOffsetY[1] = 10;
    }
    else {
      cursorLoc = 3;

      eyeLoc = 1;
      followX = 490;
      followY = 70;
      pupilOffsetX[0] = -45;
      pupilOffsetX[1] = 100;
      pupilOffsetY[0] = pupilOffsetY[1] = -10;
    }
  }

  eyeLocX += (followX - eyeLocX) * eyeEasing;
  eyeLocY += (followY - eyeLocY) * eyeEasing;
  
  // Constant updating to ask change whether and the amount of time the pupils are locked looking at something.
  pupilCheck();

  if(!pupilLock) {
    pupilLX += (pupilOffsetX[0] - pupilLX) * pupilEasing;
    pupilLY += (pupilOffsetY[0] - pupilLY) * pupilEasing;
    pupilRX += (pupilOffsetX[1] - pupilRX) * pupilEasing;
    pupilRY += (pupilOffsetY[1] - pupilRY) * pupilEasing;
  }
  else
  {
    if(eyeMode == 1) {
      fill(0);
      ellipse(clickX, clickY, 10,10);
      
      float distanceL = dist(clickX, clickY, (eyeLocX + eyeCenterX[0]), (eyeLocY + eyeCenterY[0]));
      float distanceR = dist(clickX, clickY, (eyeLocX + eyeCenterX[1]), (eyeLocY + eyeCenterY[1]));
      
      pupilLX = eyeCenterX[0] - 25*((eyeLocX + eyeCenterX[0]) - clickX)/distanceL;
      pupilLY = eyeCenterY[0] - 25*((eyeLocY + eyeCenterY[0]) - clickY)/distanceL;
      pupilRX = eyeCenterX[1] - 25*((eyeLocX + eyeCenterX[1]) - clickX)/distanceR;
      pupilRY = eyeCenterY[1] - 25*((eyeLocY + eyeCenterY[1]) - clickY)/distanceR;
      
      if(clickCount <= 2) {
        text("Stop that.", eyeLocX, eyeLocY + 80);
      }
      else if (clickCount == 3 ){
        text("I said, stop that.", eyeLocX, eyeLocY + 80);
      }
      else {
        text("Stop clicking.", eyeLocX, eyeLocY + 80);
      }
    }
    else if(eyeMode == 2) {
      eyeLocX = width/2;
      eyeLocY = height/2;
      
      pupilLX = eyeCenterX[0];
      pupilLY = eyeCenterY[0];
      pupilRX = eyeCenterX[1];
      pupilRY = eyeCenterY[1];
      
      fill(0);
      text("I SAID STOP CLICKING.", eyeLocX, eyeLocY + 80);
    }
  }

  /* ---- Drawing eyes ----   
   The eye draw order is as follows:
   1) pupil
   2) white "bounding box" of eyes, so the iris doesn't show beyond the eye
   3) the "eye liner"
   4) the eyebrows
   */

  /* ----- irises and pupils ----- */
  // stand back, I'm attempting 2d transforms.
  pushMatrix();
  translate(eyeLocX,eyeLocY);
  noStroke();
  
  drawGradientEllipse(pupilLX,pupilLY,25,25,color(0,150,255),color(0,100,255));
  fill(0);
  ellipse(pupilLX,pupilLY, 15,15);

  drawGradientEllipse(pupilRX,pupilRY,25,25,color(0,150,255),color(0,100,255));
  fill(0);
  ellipse(pupilRX,pupilRY, 15,15);
  
  fill(0);
  // left
  ellipse(pupilLX,pupilLY,15,15);
  // right
  ellipse(pupilRX,pupilRY,15,15);
  popMatrix();

  /* ----- white bounding box ----- */
  noStroke();
  fill(255);
  // top part of left eye:
  beginShape();
  vertex(eyeLocX - 20, eyeLocY);
  bezierVertex(eyeLocX-70,eyeLocY-60, eyeLocX-90,eyeLocY-20, eyeLocX-140,eyeLocY);
  vertex(eyeLocX-140, eyeLocY-50);
  vertex(eyeLocX-20, eyeLocY-50);
  endShape();

  // bottom part of left eye:
  beginShape();
  vertex(eyeLocX - 20, eyeLocY);
  bezierVertex(eyeLocX-70,eyeLocY+50, eyeLocX-90,eyeLocY+30, eyeLocX-140,eyeLocY);
  vertex(eyeLocX-140, eyeLocY+50);
  vertex(eyeLocX-20, eyeLocY+50);
  endShape();

  beginShape();
  vertex(eyeLocX + 20, eyeLocY);
  bezierVertex(eyeLocX+70,eyeLocY-60, eyeLocX+90,eyeLocY-20, eyeLocX+140,eyeLocY);
  vertex(eyeLocX+140, eyeLocY-50);
  vertex(eyeLocX+20, eyeLocY-50);
  endShape();

  // bottom part of right eye
  beginShape();
  vertex(eyeLocX + 20, eyeLocY);
  bezierVertex(eyeLocX+70,eyeLocY+50, eyeLocX+90,eyeLocY+30, eyeLocX+140,eyeLocY);
  vertex(eyeLocX+140, eyeLocY+50);
  vertex(eyeLocX+20, eyeLocY+50);
  endShape();

  /* ----- DRAWING OF EYELINER ----- */
  strokeWeight(4);
  stroke(0);
  noFill();

  // top left
  beginShape();
  vertex(eyeLocX - 20, eyeLocY);
  bezierVertex(eyeLocX-70,eyeLocY-60, eyeLocX-90,eyeLocY-20, eyeLocX-140,eyeLocY);
  endShape();

  // bottom left
  beginShape();
  vertex(eyeLocX - 20, eyeLocY);
  bezierVertex(eyeLocX-70,eyeLocY+50, eyeLocX-90,eyeLocY+30, eyeLocX-140,eyeLocY);
  endShape();

  // top right
  beginShape();
  vertex(eyeLocX + 20, eyeLocY);
  bezierVertex(eyeLocX+70,eyeLocY-60, eyeLocX+90,eyeLocY-20, eyeLocX+140,eyeLocY);
  endShape();

  // bottom right
  beginShape();
  vertex(eyeLocX + 20, eyeLocY);
  bezierVertex(eyeLocX+70,eyeLocY+50, eyeLocX+90,eyeLocY+30, eyeLocX+140,eyeLocY);
  endShape();

  /* ----- DRAWING OF EYEBROWS ----- */
  if(eyeMode == 0)
  {
    //left
    beginShape();
    vertex(eyeLocX-15, eyeLocY-25);
    bezierVertex(eyeLocX-70,eyeLocY-70, eyeLocX-90,eyeLocY-60, eyeLocX-160,eyeLocY-30);
    endShape();

    //right
    beginShape();
    vertex(eyeLocX+15, eyeLocY-25);
    bezierVertex(eyeLocX+70,eyeLocY-70, eyeLocX+90,eyeLocY-60, eyeLocX+160,eyeLocY-30);
    endShape();
  }
  else if (eyeMode >= 1)
  {
    //left
    beginShape();
    vertex(eyeLocX-15, eyeLocY-20);
    bezierVertex(eyeLocX-70,eyeLocY-60, eyeLocX-90,eyeLocY-40, eyeLocX-150,eyeLocY-40);
    endShape();

    //right
    beginShape();
    vertex(eyeLocX+15, eyeLocY-20);
    bezierVertex(eyeLocX+70,eyeLocY-60, eyeLocX+90,eyeLocY-40, eyeLocX+150,eyeLocY-40);
    endShape();
  }
    
}

void mousePressed()
{
  pupilLock = true;
  clickX = mouseX;
  clickY = mouseY;
  
  if(eyeMode == 0)
  {
    clickCount++;
    eyeMode = 1;
  }
  else if(eyeMode == 1)
  {
    clickCount++;
    if(clickCount == 5) {
      eyeMode = 2;
    }
  }
  
  timer = 0;
  
  fill(0);
  ellipse(mouseX,mouseY,10,10);
}

void pupilCheck()
{
  int lockLimit = clickCount*50 + 30;
  if(pupilLock) {
    timer++;
    if(timer >= lockLimit) {
      pupilLock = false;
      clickCount = 0;
      timer = 0;
      eyeMode = 0;
    }
  }
}

void drawGradientEllipse(float x, float y, float radiusX, float radiusY, int innerCol, int outerCol) {
  noStroke();
  beginShape(TRIANGLE_STRIP);
  for(float theta=0; theta<TWO_PI; theta+=TWO_PI/36) {
    fill(innerCol);
    vertex(x,y);
    fill(outerCol);
    vertex(x+radiusX*cos(theta),y+radiusY*sin(theta));
  }
  endShape();
}

