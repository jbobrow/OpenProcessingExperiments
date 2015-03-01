
void setup() {
  size(400, 400);
  background(0);
}
float edgeLength = 150;
  float middleLength = 50;
float x = 0;
void draw() {
  if (keyPressed) {
    if (key == 'z') {
      edgeLength += 10;
    }
    if (key == 'x') {
      edgeLength -= 10;
    }
    if (key == 'c') {
      middleLength += 10;
    }
    if (key == 'v') {
      middleLength -= 10;
    }
  }
  //Motion Blur effect
  noStroke();
  fill(0, 30);
  rect(0, 0 , width, height);
  
  //The main loop
  float y = 0;
  //width-50 adds margin to the right side
  strokeWeight(3);
  while (y < width-50) {
  y = y + 9;
  stroke(0, 100, height/2 + 150 * sin(x/50 + y/50)/3);
    //draws a line every 9 steps.
    //sin function starts from the middle of the screen (height/2)
    ////adds 150 as max height (if this value was 200 it would reach the top of the screen)
    line(25 + y, height/2 + edgeLength * sin(x/50 + y/50), 25 + y, height/2 + middleLength * sin(x/50 + y/50));
    //line(30+y, height/2 +150 * cos(x/30 + y/30), 30+y, height/2);
  }

  x = x + 1;
  filter(BLUR, 0.9);
}
