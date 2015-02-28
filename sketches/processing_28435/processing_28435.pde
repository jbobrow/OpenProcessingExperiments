
int abstand = 50;
float winkel = 0;
float a = 0;
float b = 0;

void setup () {
  size (500, 500, P3D);
  smooth ();
  frameRate (20);
  ellipseMode (CENTER);
}

void draw () {  
  if (mousePressed) {
    background (255);
    frameRate (20);
    a = a - 2;
  } else {
    background (0);
    frameRate (20);
  }
  for (float y = 0; y <= height; y = y + abstand) {
    for (float x = 0; x <= width; x = x + abstand) {
      pushMatrix();
      translate(x, y, 0);
      rotateY(a);
      rotateX(b);
      box(30);
      popMatrix();
      a = a + 1;
      b = b + 1;
      println (a);
      println (b);
    }
  }
}

