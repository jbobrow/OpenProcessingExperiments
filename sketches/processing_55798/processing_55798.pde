
int currentFrame = 0;
PImage[] frames = new PImage[24];
int lastTime = 0;
 

void setup() {
  size(600, 480);
  strokeWeight(12);
  smooth();
  background(255);
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); // Create a blank frame
  }
}

void draw() 
{
  {
 PFont font;
font = loadFont("AppleCasual-48.vlw"); 
textFont(font); 
fill(#252B39);
text("Draw!", 10, 50); 
  
  stroke(random(255), random(255), random(255));
  int currentTime = millis();
  if (currentTime > lastTime+100) {
    nextFrame();
    lastTime = currentTime;
  }
  if (mousePressed == true) {
    line(pmouseX, pmouseY, mouseX, mouseY);
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


