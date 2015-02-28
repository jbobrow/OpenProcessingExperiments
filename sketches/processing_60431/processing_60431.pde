
/*
* Interactive Squares
*
* drag to start program and draw a serie of leaked squares with a
* random stroke color. click to draw a square with a white fill
* ich change of a movement. a animation loops the movement, create
* a awesome effect!
* Vinicius Franco - ESDI
*
*/


int currentFrame = 0;
PImage[] frames = new PImage[24];
int lastTime = 0;

void setup()
{
  size(720, 480);
  smooth();
  background (0);
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); // Create a blank frame
  }
}

void draw() {
  fill (0, 35);
  noStroke();
  rect (360, 240, 720, 480);
  if (mousePressed) {
    fill (mouseX, mouseY, mouseY);
    rect(mouseX, mouseY, 80, 80);
  } 
  {
  int currentTime = millis();
  if (currentTime > lastTime+30) {
    nextFrame();
    lastTime = currentTime;
  }
  else {
    stroke (mouseX, mouseY, 0);
    rect (mouseX, mouseY, 100, 100);
  }
  rectMode (CENTER);
  println ("x = " + mouseX + " Y = " + mouseY);
  if (keyPressed) {
    delay(120);
  }
  }
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


