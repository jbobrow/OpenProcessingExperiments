
//copyright Matthew Weidner 7/5/2013
//a patriotic robot; first use of 3D space

boolean doImagesWork = false;
boolean doesScaleWork = false;
String flagImageLocation = "flag.jpg";
String americaImageLocation = "america.png";
int fireworksUpLength = 20;//in frames
int fireworksSpreadLength = 20;//in frames
float fireworksHeight = 500;//height in pixels
float fireworksSpread = 200;//radius in pixels
float keyPressMovement = 10.0;//in pixels per frame

PImage flagImage, americaImage;

boolean isFireworksGoing;
int fireworksFramesSoFar;

float scale = 0.5;
float viewerX = 0.0, viewerY = 0.0, viewerZ = 0.0;
boolean isAPressed, isDPressed, isWPressed, isSPressed, isQPressed, isZPressed;
boolean isShiftPressed;

void setup()
{
  size(500, 500, OPENGL);
  frameRate(20);
  if(doImagesWork) {
    flagImage = loadImage(flagImageLocation);
    americaImage = loadImage(americaImageLocation);
  }
}

void draw()
{
  background(0);
  
  //process key inputs
  processKeyInputs();
  
  //move the view reference based on the mouse
  translate(width/2.0, height/2.0);
  if(doesScaleWork) {
    scale(scale);
  }
  translate(viewerX, viewerY, viewerZ);
  rotateY((mouseX - width/2.0) / width * 2*PI);
  rotateX((mouseY - height/2.0) / height * (-2*PI));
  
  //draw the scene
  lights();
  directionalLight(100, 100, 100, 1, 1, 1);
  
  //box in the center
  pushMatrix();
    fill(200, 200, 200);
    //box is drawn twice because it is 1 x 2 x 1
    pushMatrix();
      translate(0, 50);
      box(100);
    popMatrix();
    pushMatrix();
      translate(0, -50);
      box(100);
    popMatrix();
  popMatrix();
  
  //right arm
  pushMatrix();
    translate(75, 0);
    fill(0, 0, 200);
    box(50);
  popMatrix();
  
  //left arm
  pushMatrix();
    translate(-75, 0);
    fill(200, 0, 0);
    box(50);
  popMatrix();
  
  //flag head
  pushMatrix();
    translate(0, -100);
    head2Sides(false);
    head2Sides(true);
  popMatrix();
  
  //fireworks
  fireworks();
  
  //words
  pushMatrix();
    translate(0, -50, 200);
    textAlign(CENTER, BOTTOM);
    textSize(32);
    fill(255, 150);
    text("4th of July", 0, 0);
    textAlign(CENTER, TOP);
    text("Click for 'Murica", 0, 5);
  popMatrix();
}

void processKeyInputs()
{
  float movement = keyPressMovement;
  if(isShiftPressed) movement *= 2.0;
  
  if(isDPressed) viewerX -= movement;
  if(isAPressed) viewerX += movement;
  if(isQPressed) viewerY += movement;
  if(isZPressed) viewerY -= movement;
  if(isWPressed) viewerZ += movement;
  if(isSPressed) viewerZ -= movement;
}

void head2Sides(boolean flipped)
{
  if(doImagesWork) {
    pushMatrix();
      if(flipped) rotateY(PI);
      translate(0, 0, 10);
      image(flagImage, -50, -50, 100, 50);
      pushMatrix();
        translate(50, 0);
        rotateY(PI/2.0);
        //translate(20, 0);
        rotateZ(-PI/2);
        image(americaImage, 0, 0, 50, 20);
      popMatrix();
    popMatrix();
  }
}

void fireworks()
{
  if(mousePressed) {
    if(!isFireworksGoing) {
      isFireworksGoing = true;
      fireworksFramesSoFar = 0;
    }
  }
  if(isFireworksGoing) {
    pushMatrix();
      translate(0, 0, -300);
      
      if(fireworksFramesSoFar < fireworksUpLength) {
        //ascending into the sky
        float scale = ((float) fireworksFramesSoFar) / fireworksUpLength;
        pushMatrix();
          translate(0, -fireworksHeight * scale);
          fill(255, 255, 255);
          noStroke();
          box(10);
        popMatrix();
      }
      
      else {
        //spreading out in a circle (after explosion)
        translate(0, -fireworksHeight);
        float scale = ((float) fireworksFramesSoFar - fireworksUpLength) /
            fireworksSpreadLength;
        for(int i = 0; i < 20; i++) {
          pushMatrix();
            rotateZ(radians(i*(360/20)));
            translate(0, fireworksSpread * scale);
            //red, white, and blue
            if(i % 3 == 0) fill(255, 0, 0);
            else if (i % 3 == 1) fill(255);
            else fill(0, 0, 255);
            noStroke();
            sphereDetail(10);
            sphere(10 * scale);
          popMatrix();
        }
      }
      
      fireworksFramesSoFar++;
      if(fireworksFramesSoFar >
          (fireworksUpLength + fireworksSpreadLength)) {
        isFireworksGoing = false;
      }
    popMatrix();
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  if(e > 0.0) {
    scale *= 1.1;
  }
  else if(e < 0.0) {
    scale /= 1.1;
  }
}

void keyPressed()
{
  char lowerKey = Character.toLowerCase(key);
  if(lowerKey == 'w') isWPressed = true;
  if(lowerKey == 'a') isAPressed = true;
  if(lowerKey == 's') isSPressed = true;
  if(lowerKey == 'd') isDPressed = true;
  if(lowerKey == 'q') isQPressed = true;
  if(lowerKey == 'z') isZPressed = true;
  if(keyCode == SHIFT) isShiftPressed = true;
}

void keyReleased()
{
  char lowerKey = Character.toLowerCase(key);
  if(lowerKey == 'w') isWPressed = false;
  if(lowerKey == 'a') isAPressed = false;
  if(lowerKey == 's') isSPressed = false;
  if(lowerKey == 'd') isDPressed = false;
  if(lowerKey == 'q') isQPressed = false;
  if(lowerKey == 'z') isZPressed = false;
  if(keyCode == SHIFT) isShiftPressed = false;
}
