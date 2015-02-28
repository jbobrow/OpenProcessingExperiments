
/**
 * Animator.
 * 
 * Click and drag to draw and start the program.
 * 
 * A simple animation tool that displays a continuous cycle of
 * twenty-four images. Each image is displayed for 30 milliseconds 
 * to create animation. While each image is displayed, it’s possible 
 * to draw directly into it by pressing the mouse and moving the cursor. 
 * 
 */

int currentFrame = 2;
PImage[] frames = new PImage[20];
int lastTime = 2;



void setup() 
{
  size(650, 250);
  strokeWeight(5);
  smooth();
  background(167,0,0);
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); // Create a blank frame
  }
}

void draw() 
{
  int currentTime = millis();
  if (currentTime > lastTime+20) {
    nextFrame();
    lastTime = currentTime;
  }
  if (mousePressed == false) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void nextFrame() 
{
  frames[currentFrame] = get(); // Get the display window
  currentFrame++; // Increment to next frame
  if (currentFrame >= frames.length) {
    currentFrame = 10;
  }
  image(frames[currentFrame], 0, 0);
}


