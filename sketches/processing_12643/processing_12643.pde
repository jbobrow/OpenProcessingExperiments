
int currentFrame = 0;
PImage[] frames = new PImage[24];
int lastTime = 0;

void setup() 
{
  size(600, 600);
  background(random (255), random (255), random(255));
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); // Create a blank frame
  }
}
void variableRect(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  fill (random(255),random (255),random(255),speed);
  stroke(speed);
  rect(x, y, speed, speed);
}


void draw() 
{
  int currentTime = millis();
  if (currentTime > lastTime+60) {
    nextFrame();
    lastTime = currentTime;
  }
  if (mousePressed == true) {
    variableRect(pmouseX, pmouseY, mouseX, mouseY);
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



