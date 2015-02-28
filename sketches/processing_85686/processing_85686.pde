
// width and height are built in.
int centerX = 600 / 2;
int centerY = 600 / 2;
 
void setup() {
  size(600, 600); // window
  background(255, 0, 40); // color
  
}
 
void draw() {
  background(0, 0, 0);
  
  strokeWeight(10);
  stroke( 255, 255, 255, 255);
  line(200, 0, 500, 400);
  line(400, 0, 500, 400);
  line(0, 100, 500, 400);
  line(0, 400, 500, 400);
  line(0, 700, 500, 400);
  line(0, 1100, 500, 400);
  line(100, 2000, 500, 400);
  
  stroke( 216, 255, 3, 255);
  fill( 216, 255, 3, 255);
  ellipse(500, 400, 55, 55);
  
  noSmooth();
point(400, 370);
point(400, 430);
point(410, 480);
point(430, 540);

stroke( 124, 31, 206);
fill( 124, 31, 206);
rect(370, 150, 55, 55, 7);


stroke( 13, 94, 252, 255);
fill( 13, 94, 252, 255);
triangle(200, 50, 300, 200, 150, 100);
}


