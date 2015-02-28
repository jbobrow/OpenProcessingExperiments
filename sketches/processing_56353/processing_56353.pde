
import JMyron.*;

JMyron theMov;
int[] currFrame;
int[] prevFrame;
int tolerance;
boolean revealing;

int currentFrame = 0;
PImage[] frames = new PImage[50];
int lastTime = 0;

void setup() 
{
  size(640, 480, P2D);
  strokeWeight(12);
  smooth();
  background(0);
  for (int i = 0; i < frames.length; i++) {
  frames[i] = get(); // Create a blank frame  
  smooth();
  }
  
  theMov = new JMyron();
  theMov.start(width, height);
  theMov.findGlobs(0);
  
  loadPixels();
  currFrame = prevFrame = pixels;

  tolerance = 30;  
  revealing = true;
}

void draw() 
{
  theMov.update();
  // save the last frame before updating it
  prevFrame = currFrame;
  currFrame = theMov.image();
  
  int currentTime = millis();
  if (currentTime > lastTime+60) {
    nextFrame();
    lastTime = currentTime;
  }
  if (mousePressed == true) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  
  // draw each pixel to the screen only if its change factor is 
  // higher than the tolerance value
  loadPixels();
  for (int i=0; i < width*height; i++) {
    if (comparePixels(i)) {
      pixels[i] = currFrame[i];
    }
  }
  updatePixels();
}

boolean comparePixels(int index) {
  if (Math.abs(red(currFrame[index])-red(prevFrame[index])) < tolerance) 
    if (Math.abs(green(currFrame[index])-green(prevFrame[index])) < tolerance)
      if (Math.abs(blue(currFrame[index])-blue(prevFrame[index])) < tolerance)
        return !revealing;

  return revealing;
}

void nextFrame() 
{
  frames[currentFrame] = get(); // Get the display window
  currentFrame++; // Increment to next frame
  if (currentFrame >= frames.length) {
    currentFrame = 0;
  }
  image(frames[currentFrame], 0, 0);
}


public void stop() {
  theMov.stop();
  super.stop();
}

void keyReleased() {
  if (key == '.' || key == '>') {
    // increase tolerance
    tolerance += 2;
  } else if (key == ',' || key == '<') {
    // decrease tolerance
    tolerance -= 2;

  // toggle the revealing mode
  } else if (key == ' ') {
    revealing = !revealing;
  }
}

void keyPressed() {
  if (key == 'c') {
    for (int i = 0; i < frames.length -1; i++) {
      frames[i] = get();
      background(0);
    }
  }
}

