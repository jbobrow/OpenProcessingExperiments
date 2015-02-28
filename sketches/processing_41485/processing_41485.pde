
//int b = 50;
//int a = 70;
 
 
void setup() {
  size (400,400);
  smooth();
  strokeWeight (1);
  ellipseMode (RADIUS);
}
 
void draw() {
 
  if (mousePressed) {
    fill (8, 201, 190);
  } else {
    fill (8, 96, 201);
  }
ellipse (pmouseX,pmouseY,pmouseX,pmouseY);
}
  

                
                
