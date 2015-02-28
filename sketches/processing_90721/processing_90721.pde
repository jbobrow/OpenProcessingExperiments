
int currentFrame = 0;
PImage[] frames = new PImage[12];
int lastTime = 0;

void setup() {
  size(100, 100);
  noStroke();
  smooth();
  background(20);
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); // Create a blank frame
  }
}

void draw() {
  int currentTime = millis();
  if (currentTime > lastTime+100) {
    nextFrame();
    lastTime = currentTime;
  }
    fill(color(random(255), random(150), random(255)));
    triangle(pmouseX, pmouseY, mouseX, mouseY, mouseX+20, pmouseY-20);
  }
//}

void nextFrame() {
  frames[currentFrame] = get(); // Get the display window
  currentFrame++; // Increment to next frame
  if (currentFrame >= frames.length) {
    currentFrame = 0;
  }
 image(frames[currentFrame], 0, 0);
}


