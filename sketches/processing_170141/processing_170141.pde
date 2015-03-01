
int currentFrame = 0;
PImage[] frames = new PImage[12];
int lastTime = 0;

void setup() {
  size(500, 500);
  noStroke();
  background(50);
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); // Create a blank frame
  }
}

void draw() {
  fill(50,10);
  rect(0,0,500,500);
  int currentTime = millis();
  if (currentTime > lastTime+50) {
    nextFrame();
    lastTime = currentTime;
  }

  if (mousePressed == true) {
    fill(150,150,100,60);
    ellipse(pmouseX, pmouseY, mouseX-20, mouseX-20);
    fill(200,100,100,100);
    ellipse(pmouseX, pmouseY, (mouseX%11)*12, (mouseX%11)*12);
  }
}

void nextFrame() {
  frames[currentFrame] = get(); // Get the display window
  currentFrame++; // Increment to next frame
  if (currentFrame >= frames.length) {
    currentFrame = 0;
  }
  image(frames[currentFrame], 0, 0);
}


