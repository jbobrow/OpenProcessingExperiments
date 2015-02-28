
PImage eyebg;
PImage eyeoverlay;
PImage eyeoverlay2;
PImage eyeoverlay3;
PImage eyeoverlay4;
PImage eyepupil;

PVector defaultPos = new PVector(312, 260);
PVector curOffset = new PVector(0, 0);
PVector prevOffset = new PVector(0, 0);
int eyeRadius = 26;

final int STATE_IDLE = 0;
final int STATE_BLINKTRANSITIONTOF = 1;
final int STATE_FOLLOWING = 2;
final int STATE_FOLLOWINGBLINK = 3;
final int STATE_FASTFOLLOWINGBLINK = 4;
final int STATE_BLINKTRANSITIONTOI = 5;

int state = STATE_IDLE;

int waitTime = 0;
int waitForBlink = 0;
int blinkTime = 0;

void setup()
{
  size(640, 480);
  frameRate(60);
  background(255);
  smooth();
  
  eyebg = loadImage("eyebg.png");
  eyeoverlay = loadImage("eyeoverlay.png");
  eyeoverlay2 = loadImage("eyeoverlay2.png");
  eyeoverlay3 = loadImage("eyeoverlay3.png");
  eyeoverlay4 = loadImage("eyeoverlay4.png");
  eyepupil = loadImage("eyepupil.png");
}

void draw()
{
  background(255);
  
  // Draw background
  imageMode(CORNER);
  rectMode(CORNER);
  image(eyebg, 0, 0, width, height);
  
  RenderEye();
}

void mouseClicked()
{
  switch(state)
  {
    case STATE_IDLE:
      state = STATE_BLINKTRANSITIONTOF;
      blinkTime = 0;
      break;
    case STATE_FOLLOWING:
      state = STATE_BLINKTRANSITIONTOI;
      blinkTime = 0;
      break;
  }
}

void RenderEye()
{
  switch(state)
  {
    case STATE_IDLE:
      imageMode(CENTER);
      rectMode(CENTER);
      image(eyepupil, defaultPos.x, defaultPos.y - 10, 41, 41);
      imageMode(CORNER);
      rectMode(CORNER);
      image(eyeoverlay, 220, 140, 200, 200);
      break;
    case STATE_BLINKTRANSITIONTOF:
      blinkTime++;
      
      curOffset.x = (defaultPos.x - mouseX) / 10;
      curOffset.y = (defaultPos.y - mouseY) / 10;
      curOffset.limit(eyeRadius);
      
      // Draw eye overlay
      imageMode(CENTER);
      rectMode(CENTER);
      
      switch(blinkTime)
      {
        case 0:
          image(eyepupil, defaultPos.x, defaultPos.y - 10, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay, 220, 140, 200, 200);
          break;
        case 1:
          image(eyepupil, defaultPos.x, defaultPos.y - 10, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay2, 220, 140, 200, 200);
          break;
        case 2:
          image(eyepupil, defaultPos.x, defaultPos.y - 10, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay3, 220, 140, 200, 200);
          break;
        case 3:
          image(eyepupil, defaultPos.x, defaultPos.y - 10, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay4, 220, 140, 200, 200);
          break;
        case 4:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay4, 220, 140, 200, 200);
          break;
        case 5:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay3, 220, 140, 200, 200);
          break;
        case 6:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay, 220, 140, 200, 200);
          state = STATE_FOLLOWING;
          waitTime = 0;
          waitForBlink = int(random(180, 500));
          blinkTime = 0;
        break;
      }
      
      break;
    case STATE_FOLLOWING:
      waitTime++;
      
      prevOffset = new PVector(curOffset.x, curOffset.y);
      
      curOffset.x = (defaultPos.x - mouseX) / 10;
      curOffset.y = (defaultPos.y - mouseY) / 10;
      curOffset.limit(eyeRadius);
      imageMode(CENTER);
      rectMode(CENTER);
      
      // If the mouse is moved fast, blink!
      if(dist(pmouseX, pmouseY, mouseX, mouseY) > 200)
      {
        blinkTime = 0;
        state = STATE_FASTFOLLOWINGBLINK;
        image(eyepupil, defaultPos.x - prevOffset.x, defaultPos.y - prevOffset.y, 41, 41);
      }
      else
      {
        image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
      }
      
      // Draw eye overlay
      imageMode(CORNER);
      rectMode(CORNER);
      
      // Blink
      if(waitTime > waitForBlink)
      {
        state = STATE_FOLLOWINGBLINK;
        waitTime = 0;
        waitForBlink = int(random(180, 500));
        blinkTime = 0;
      }
      
      if(mouseY > height * 0.6)
      {
        image(eyeoverlay2, 220, 140, 200, 200);
      }
      else
      {
        image(eyeoverlay, 220, 140, 200, 200);
      }
      
      break;
    case STATE_FOLLOWINGBLINK:
      blinkTime++;
      
      curOffset.x = (defaultPos.x - mouseX) / 10;
      curOffset.y = (defaultPos.y - mouseY) / 10;
      curOffset.limit(eyeRadius);
      
      // Draw eye overlay
      imageMode(CENTER);
      rectMode(CENTER);
      
      switch(blinkTime)
      {
        case 0:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay, 220, 140, 200, 200);
          break;
        case 1:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay2, 220, 140, 200, 200);
          break;
        case 2:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay3, 220, 140, 200, 200);
          break;
        case 3:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay4, 220, 140, 200, 200);
          break;
        case 4:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay4, 220, 140, 200, 200);
          break;
        case 5:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay3, 220, 140, 200, 200);
          break;
        case 6:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay, 220, 140, 200, 200);
          state = STATE_FOLLOWING;
          waitTime = 0;
          waitForBlink = int(random(180, 500));
          blinkTime = 0;
        break;
      }
      
      break;
    case STATE_FASTFOLLOWINGBLINK:
      blinkTime++;
      
      curOffset.x = (defaultPos.x - mouseX) / 10;
      curOffset.y = (defaultPos.y - mouseY) / 10;
      curOffset.limit(eyeRadius);
      
      // Draw eye overlay
      imageMode(CENTER);
      rectMode(CENTER);
      
      switch(blinkTime)
      {
        case 0:
          image(eyepupil, defaultPos.x - prevOffset.x, defaultPos.y - prevOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay, 220, 140, 200, 200);
          break;
        case 1:
          image(eyepupil, defaultPos.x - prevOffset.x, defaultPos.y - prevOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay2, 220, 140, 200, 200);
          break;
        case 2:
          image(eyepupil, defaultPos.x - prevOffset.x, defaultPos.y - prevOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay3, 220, 140, 200, 200);
          break;
        case 3:
          image(eyepupil, defaultPos.x - prevOffset.x, defaultPos.y - prevOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay4, 220, 140, 200, 200);
          break;
        case 4:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay4, 220, 140, 200, 200);
          break;
        case 5:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay3, 220, 140, 200, 200);
          break;
        case 6:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay, 220, 140, 200, 200);
          state = STATE_FOLLOWING;
          waitTime = 0;
          waitForBlink = int(random(180, 500));
          blinkTime = 0;
        break;
      }
      
      break;
    case STATE_BLINKTRANSITIONTOI:
      blinkTime++;
      
      curOffset.x = (defaultPos.x - mouseX) / 10;
      curOffset.y = (defaultPos.y - mouseY) / 10;
      curOffset.limit(eyeRadius);
      
      // Draw eye overlay
      imageMode(CENTER);
      rectMode(CENTER);
      
      switch(blinkTime)
      {
        case 6:
          image(eyepupil, defaultPos.x, defaultPos.y - 10, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay, 220, 140, 200, 200);
          state = STATE_IDLE;
          break;
        case 5:
          image(eyepupil, defaultPos.x, defaultPos.y - 10, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay2, 220, 140, 200, 200);
          break;
        case 4:
          image(eyepupil, defaultPos.x, defaultPos.y - 10, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay3, 220, 140, 200, 200);
          break;
        case 3:
          image(eyepupil, defaultPos.x, defaultPos.y - 10, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay4, 220, 140, 200, 200);
          break;
        case 2:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay4, 220, 140, 200, 200);
          break;
        case 1:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay3, 220, 140, 200, 200);
          break;
        case 0:
          image(eyepupil, defaultPos.x - curOffset.x, defaultPos.y - curOffset.y, 41, 41);
          imageMode(CORNER);
          rectMode(CORNER);
          image(eyeoverlay, 220, 140, 200, 200);
        break;
      }
      
      break;
  }
}

