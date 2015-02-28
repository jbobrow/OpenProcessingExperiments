
int currentFrame = 0;
PImage[] frames = new PImage[24];
int lastTime = 0;

void setup() 
{
  size(800,500);
  strokeWeight(10);
  smooth();
  background(204);
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); // Create a blank frame
  }
}

void draw() 
{
  int currentTime = millis();
  if (currentTime > lastTime+30) {
    nextFrame();
    lastTime = currentTime;
  }
  if (mousePressed == true) {
    strokeWeight(2);
    fill(0);
    ellipse(mouseX,mouseY,80,80);
    fill(255);
    ellipse(pmouseX,15+pmouseY,10,10);
    ellipse(30+pmouseX,15+pmouseY,10,10);
  
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


