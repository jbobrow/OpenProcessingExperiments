
int abstand = 50;

void setup () {
  size (500, 500, P3D);
  smooth ();
  frameRate (20);
}

void draw () {  
  background (255);
  for (int y = 0; y <= height; y = y + abstand) {
    for (int x = 0; x <= width; x = x + abstand) {
    rect (x, y, random (45, 50), random (45, 50));
    }
  }
  if (mousePressed) {
    background (255, 0, 0);
    for (int y = 0; y <= height; y = y + abstand) {
    for (int x = 0; x <= width; x = x + abstand) {
      fill (0, 0, 0);
      rect (x, y, random (45, 50), random (45, 50));
    }
    }
    } else {
      background (255);
      for (int y = 0; y <= height; y = y + abstand) {
      for (int x = 0; x <= width; x = x + abstand) {
        fill (255);
        rect (x, y, random (45, 50), random (45, 50));
        }
      }
    } 
}

