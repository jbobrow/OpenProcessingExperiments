
void setup() {
  size(400, 400);
  background(0);
  stroke(255);
  strokeWeight(3);
}

float x = 0;
void draw() {
  //Motion Blur effect
  fill(0, 30);
  rect(0, 0 , width, height);
  
  //The main loop
  float y = 0;
  //width-50 adds margin to the right side
  while (y < width-50) {
    //draws a line every 9 steps.
    //sin function starts from the middle of the screen (height/2)
    ////adds 150 as max height (if this value was 200 it would reach the top of the screen)
    line(25 + y, height/2 + 150 * sin(x/50 + y/50), 25 + y, height/2);
    y = y + 9;
  }

  x = x + 1;
}

