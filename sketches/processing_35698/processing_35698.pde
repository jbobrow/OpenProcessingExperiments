
void setup() {
  size (700, 700);
  smooth ();
}

void draw() {

  background (255);

  ellipseMode (CORNERS);
  ellipse (100, 100, 200, 300);


  rectMode (CORNERS);
  rect (100, 300, 200, 500);

  line (200, 300, 300, 300);
  line (0, 300, 100, 300);
  line (200, 500, 200, 600);
  line (100, 500, 100, 600);

  point (175, 200);
  point (125, 200);
} 


