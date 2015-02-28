
// This sketch draws a red ball that follows the mouse when
// the mouse button is pressed, otherwise the ball falls to
// the bottom of the page.
void setup() {
  size(720, 720);
  background(255);
  smooth();
  noStroke();
}

//The first ball will appear in the center of the screen
float x = 360;
float y = 360;
float easing = 0.01;

void draw() {
  float targetX = mouseX;
  float targetY = mouseY;
  fill(255, 255, 255, 100);
  rect(0, 0, width, height);
  if (mousePressed) {
    y += (targetY - y) * easing;
  }
  else {
    // This IF statement prevents the ball from falling
    // infinitely off the page.
    if(y < 700){
      // Note that the targetY is replaced with height so
      // that the ball falls to the bottom of the page.
      // Also note that it is + y because the rate increases
      // to simulate gravity.
      y += (height + y) * easing;
    }
    else{
      y = 700;
    }
  }
  fill(255, 0, 0);
  x += (targetX - x) * easing;
  ellipse(x, y, 40, 40);
}


