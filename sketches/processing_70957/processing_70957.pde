
//variables
float x;
float y;
float diam;
float r;
float g;
float b;
float w;

//setup 
void setup ( ) {
  size (500, 500);
  background (0);
  smooth ( );
  // frame rate
  frameRate (3);
  //part of background A and for loop
  stroke (255, 0, 0);
  fill (0, 255, 0);
  for (float diameter = 1000.0; diameter > 1.0; diameter -= 50.0 ) {
ellipse( 0, 0, diameter, diameter);
}
}
//background A and background B
void draw ( ) {
  x= random (500);
  y= random (500);
  diam= random (500);
  r= random (255);
  g= random (255);
  b= random (255);
  
  fill ( 0, g, b); 
  ellipseMode (CENTER);
  ellipse (x, y, diam, diam);
}

//press mouse to make triangles and rectangles appear
void mousePressed ( ) {
  r= random (255);
  g= random (255);
  b= random (255);
  noStroke ( ) ;
  fill (r, 0, 0);
  if (mouseX < width/2) {
  triangle (mouseX, mouseY, random (255), random (255), random (255), random (255));
}
  if (mouseX > width/2) {
  rectMode (CORNER);
  rect (mouseX, mouseY, random (255), random (255));
}
}

//clear background A and drawings with K. Starts background B.
void keyPressed ( ) {
  key = 70;
  keyCode = (5) ;
  background (255);

}
