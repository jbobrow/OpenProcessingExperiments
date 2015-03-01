
int currentFrame = 0;
PImage[] frames = new PImage[100];
int lastTime = 0;

void setup() 
{
  background (0,0,100);
  size(600, 600);
  colorMode(RGB,255);
  strokeWeight(5);
  smooth();
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); // Create a blank frame
  }
}

void draw() 
{
 
  stroke (random (255),random (255),random (255));
  int currentTime = millis();
  if (currentTime > lastTime+5) {
    nextFrame();
    lastTime = currentTime;
  }

  if (mousePressed == true) {
    
    strokeWeight (10);
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

void mousePressed() {
  
  colorMode(RGB,255);


}

