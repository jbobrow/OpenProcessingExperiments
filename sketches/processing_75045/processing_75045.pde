
int currentFrame = 0;
PImage[] frames = new PImage[20];
int lastTime = 0;

void setup() {
  size(600, 600); // size of the actual window
  strokeWeight(40); // size of the stroke (the sphere being manipulated)
  stroke(160);
  background(600);
  
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); // creates a blank frame
  }
}

void draw() {
  int currentTime = millis(); // uses milliseconds for time
  if (currentTime > lastTime+1) {
    nextFrame(); // if time has passsed by 1 millisecond then next frame
    lastTime = currentTime; // recurses so that it's then the current frame
  }
  if (mousePressed == true) {
    line(pmouseX, pmouseY, mouseX, mouseY); // this just copies where my mouse is.
  }
  fill(255,0,0); 
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
