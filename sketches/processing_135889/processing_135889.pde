
/* Douglas Tran Feb 24 Creative Computing Rory Solomon */

int x = 0;
int xdirection = 5;
int y = 0;
int ydirection = 10;



void setup() {
  size (500, 500);
  smooth ();
}

void draw() {

  float color1;
  float color2;
  float color3;


  color1 = (random(0, 255));
  color2 = (random(0, 255));
  color3 = (random(0, 255));



  if (mouseY < 250) {
    background (0);
  } 
  else {
    background (255);
  }
  fill (color1, color2, color3);
  ellipse (0 +y, 50, 25, 25);
  ellipse (0+x, 150, 25, 25);
  ellipse (0+y, 250, 25, 25);
  ellipse (0+x, 350, 25, 25);
  ellipse (0+y, 450, 25, 25);

  if (mousePressed) {
    ellipse (mouseX, mouseY, 100, 100);
    ellipse (mouseY, mouseX, 100, 100);
    fill (color1, color2, color3);
    ellipse (50, 0 +x, 25, 25);
    ellipse (150, 0+y, 25, 25);
    ellipse (250, 0+x, 25, 25);
    ellipse (350, 0+y, 25, 25);
    ellipse (450, 0+x, 25, 25);
  }

  x = x + xdirection;
  y = y + ydirection;

  if (x>500) {
    xdirection = -5;
  } 
  else if ( x < 0) {
    xdirection = 5;
  }

  if (y>500) {
    ydirection = -10;
  } 
  else if ( y < 0) {
    ydirection = 10;
  }
}



