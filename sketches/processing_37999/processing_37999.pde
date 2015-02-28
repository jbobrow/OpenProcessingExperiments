
final int kInc = 5;  // how many pixels to move each step
final int kStepTime = 20;  // how fast to step

// current x/y location of animation
int gX = 0;
int gY = 0;

// direction in x/y - these will either be 1 or -1
int gXDir = 1;
int gYDir = 1;

int gLastTime = 0;  // last time in ms that a frame was drawn

PFont gFont;  // our font

int gLastKey = 'a';  // last key pressed

void setup()
{
  // do the usual setup stuff
  smooth();
  size(437, 533);
  gFont = loadFont("Crackhouse-48.vlw");
  textFont(gFont); 
  fill(255, 0, 0);
}

void draw()
{
  // check current time
  int thisTime = millis();
  
  // if enough time has elapsed...
  if (thisTime - gLastTime >= kStepTime) {
    // draw character and save time in gLastTime
    background(0, 255, 0);
    drawChar();
    gLastTime = thisTime;
  }
}

void drawChar()
{
  // draw the char - note that the int gLastKey has to be
  // cast to a char using char()
  text(char(gLastKey), gX, gY);
  
  // move x/y by amount kInc in the positive or negative
  // directions (based on gXDir/gYDir)
  gX += (kInc * gXDir);
  gY += (kInc * gYDir);
  
  // if we hit a wall, reverse direction
  if (gX >= width || gX <= 0) {
    gXDir = -gXDir;
  }
  if (gY >= height || gY <= 0) {
    gYDir = -gYDir;
  }
}

// save the last key pressed
void keyPressed()
{
    gLastKey = key;
}


