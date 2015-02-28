
void setup() {
  size(400, 400);
  frameRate(3);
}
void draw() {
  background(random(0,255));
  drawMan(100, 150, arms(10, 8));
  drawMan(220, 150, arms(10, 6));
  drawMan(330, 150, arms(10, 4));
}

void drawMan(int xLocation, int yLocation, boolean armSticks) {
  //basic stick man code.
  line(xLocation, yLocation, xLocation, yLocation+50);
  line(xLocation, yLocation+50, xLocation-20, yLocation+90);
  line(xLocation, yLocation+50, xLocation+20, yLocation+90);
  ellipse(xLocation, yLocation-15, 30, 30);
  //this if statement checks if arms is true and makes the arms
  //go up, otherwise they stay down.
  if (armSticks) {
    line(xLocation, yLocation+20, xLocation-25, yLocation-40);
    line(xLocation, yLocation+20, xLocation+25, yLocation-40);
  }
  else {
    line(xLocation, yLocation+20, xLocation+20, yLocation+60);
    line(xLocation, yLocation+20, xLocation-20, yLocation+60);
  }
}

boolean arms (int framesLooping, int offset) {
  boolean armSticks;
  if ((frameCount+offset)% framesLooping==0) {
    armSticks=true;
    return armSticks;
  }
  else {
    armSticks=false;
    return armSticks;
  }
}

