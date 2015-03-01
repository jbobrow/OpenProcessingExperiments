
/*
 * First version of a birthday gift for dad.
 * Press 'r' or 'R' to restart.
 */

// javaScript preprocessor commands to preload images
/* @pjs preload="paper.png; */
/* @pjs preload="gift0.png; */

PImage mPaper;
PImage mGift;

int OPEN_GIFT_STEPS = 512;
int OPEN_DOODLE_STEPS = 500;

boolean mWrapped = true;
int mOpenGift = 0;
boolean mUnWrapped = false;
int mOpenDoodle = 0;
boolean mDoodling = false;

int mSkip = 0;
Ball mBalls;

int CENTER_X = 256;
int CENTER_Y = 256;

void setup()
{
  size(512,512);
  frameRate(30);
  smooth();
  
  mPaper = loadImage("paper.png");
  mGift = loadImage("gift0.png");
}

void draw()
{
  imageMode(CENTER);
  
  if (mWrapped) {
    image(mPaper, CENTER_X, CENTER_Y, width, height);
  } else if (mOpenGift < OPEN_GIFT_STEPS) {
    image(mGift, CENTER_X, CENTER_Y, width, height);
    image(mPaper, CENTER_X+mOpenGift, CENTER_Y, width, height);
    mOpenGift += 3;
  } else if (mUnWrapped) {
    image(mGift, CENTER_X, CENTER_Y, width, height);
  } else if (mOpenDoodle >= 0) {
    mOpenDoodle -= 10;
    image(mGift, CENTER_X, CENTER_Y, width, height);
    fill(0);
    noStroke();
    rectMode(CENTER);
    rect(CENTER_X, CENTER_Y, width-mOpenDoodle, height-mOpenDoodle);
  } else {
    background(0);
    fill(#CE0404);
    strokeWeight(2);
    stroke(255);
    mBalls.contract(mouseX, mouseY);
    mBalls.draw(70);
  }
}

void mouseClicked()
{
  if (mWrapped) {
    mWrapped = false;
    mUnWrapped = true;
    mOpenGift = 0;
  } else if (!mDoodling && mOpenGift >= OPEN_GIFT_STEPS) {
    mUnWrapped = false;
    mOpenDoodle = OPEN_DOODLE_STEPS;
    mDoodling = true;
    mBalls = new Ball(null, mouseX, mouseY);
  }
}

void mouseMoved()
{
  if (mDoodling && mOpenGift >= OPEN_GIFT_STEPS)
    if (++mSkip % 8 == 0)
      mBalls = new Ball(mBalls, mouseX, mouseY);
}

void keyPressed()
{
  if (key == 'r' || key == 'R') {  // restart
    mWrapped = true;
    mOpenGift = 0;
    mDoodling = false;
    mSkip = 0;
    mBalls = null;
  }
}
    
class Ball
{
  float mX;
  float mY;
  Ball mPrev;

  public Ball(Ball b, float x, float y)
  {
    mX = x;
    mY = y;
    mPrev = b;
  }
  
  void contract(float x, float y)
  {
    mX -= (mX-x) * 0.5;
    mY -= (mY-y) * 0.5;

    if (mPrev != null)
      mPrev.contract(mX, mY);
  }  
  
  void draw(int count)
  {
    if (count == 0)
      mPrev = null;
      
    if (mPrev != null)
      mPrev.draw(count-1);

    int diameter = (count < 15) ? count+5 : 20;
    ellipse(mX, mY, diameter, diameter);
  }
}



