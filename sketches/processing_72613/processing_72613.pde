
int currentFrame = 0;
PImage[] frames = new PImage[30];
int lastTime = 0;

void setup() {
  size(640, 360);
  strokeWeight(30);
  background(0);
  stroke(255);
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); // Create a blank frame
  }
}

void draw() {
  int currentTime = millis();
  if (currentTime > lastTime+30) {
    nextFrame();
    lastTime = currentTime;
  }
  if (mousePressed == true) {
    stroke(random(0,255),random(0,225),random(0,255));
    line(pmouseX, pmouseY, mouseX, mouseY);
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
