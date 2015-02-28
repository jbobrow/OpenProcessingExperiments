


void setup() {
  size (500, 500);
}

void draw() {


  float y = 5;
  while (y<= mouseX) {
    stroke (mouseX, mouseY, y, 45);
    noFill ();
    smooth ();
    arc (mouseX, mouseY, y, y, 60, 90);
    y= y + 50 ;
  }

  float x= 5;
  while (x<= mouseY) {
    stroke (mouseX, mouseY, y, 45);
    smooth ();
    noFill ();
    line (mouseX, mouseY, x, x );
    x= x+ 50;
  }

  if (mousePressed) {
    background(mouseX);
  }
}


