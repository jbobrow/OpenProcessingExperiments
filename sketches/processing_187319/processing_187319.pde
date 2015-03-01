
int gridSizeX = 50;
int gridSizeY = 70;
void setup () {
  size(640, 360); 
  noStroke();
  frameRate (5);
  background (255, 227, 112);
}
void draw () {
  blinkingMouse ();
}

void blinkingMouse () {

  for (int x = gridSizeX; x <= width - gridSizeX; x += gridSizeX) {
    for (int y = gridSizeY; y <= height - gridSizeY; y += gridSizeY) {
      noStroke();
      mickeymouse();
      stroke(100, 0, 0);
      line(x, y, width/2, height/2);
    }
  }
}
void mickeymouse () {

  for (int x = gridSizeX; x <= width - gridSizeX; x += gridSizeX) {
    for (int y = gridSizeY; y <= height - gridSizeY; y += gridSizeY) {
   
      ellipse(x-1, y-1, 30, 30);
      ellipse(x-15, y-15, 15, 15);
      ellipse(x+15, y-15, 15, 15);
      fill(random (50, 255), random (0), random (0));
    }
  }
}



