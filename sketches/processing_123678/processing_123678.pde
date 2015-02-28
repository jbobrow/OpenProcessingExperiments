
PImage bg;
PImage hand;

int x = 0;

void setup() {
  size(500, 500);
  bg = loadImage("timer.jpg");
  hand = loadImage("hand.png");
  smooth();
  noStroke() ;
  frameRate(3.0);
}

void draw () {
  
  background(bg);


  if (frameCount % 1 == 0) {
    fill(255,116,84);
    pushMatrix();
    translate(250, 263);
    rotate(radians(frameCount * 2  % 360));
    rect(0, 0, 190, 5);
    popMatrix();
  }
}



