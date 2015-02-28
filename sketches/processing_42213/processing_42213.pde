
void setup() {
  size (500, 500);
}

void draw() {

  float y = 0;
  while (y<= 500) {
    fill (65, 210, 160);
    stroke (255, 255, 255);
    smooth ();
    rect (0, y, 500, y);
    y= y + 25 ;
  }

  float x= 0;
  while (x<= 500) {
    fill (148, 34, 124, 45);
    stroke (255, 255, 255, 45);
    rect (x, 0, x, 500);
    x= x+25;
  }

  stroke (255, 255, 255, 45);
  strokeWeight (10);
  noFill ();
  rect (0, 0, 500, 500, 35, 35);
}


