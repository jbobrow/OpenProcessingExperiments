
int size;
int xPos;
int yPos;
boolean falling = false;

void setup() {
  size(800, 600);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  background(360);
  
  // if the falling variable is true,
  // then increase the y position to move
  // toward the bottom of the screen
  if (falling) {
    yPos = yPos + 5;
  }
  
  ellipse(xPos, yPos, size, size);
}

void mousePressed() {
  // set color to red
  fill(0, 80, 80, 80);
  // when the mouse gets pressed, set falling to false
  falling = false;
  // set the position of the circle to where the mouse is
  xPos = mouseX;
  yPos = mouseY;
  // start at size 0
  size = 0;
}

void mouseDragged() {
  // set color to green
  fill(130, 80, 80, 80);
  // set size equal to how far the mouse is now compared
  // to where it was when we clicked
  size = int(dist(mouseX, mouseY, xPos, yPos));
}

void mouseReleased() {
  // set color to blue
  fill(230, 80, 80, 80);
  // set falling variable to true
  falling = true;
}
