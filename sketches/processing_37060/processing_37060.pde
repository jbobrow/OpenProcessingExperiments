
//int b = 50; 
//int a = 70;


void setup() {
  size (360,480);
  smooth();
  strokeWeight (1);
  ellipseMode (RADIUS);
}

void draw() {

  if (mousePressed) {
    fill (200);
  } else {
    fill (100);
  }
ellipse (pmouseX,pmouseY,pmouseX,pmouseY);
}
  

