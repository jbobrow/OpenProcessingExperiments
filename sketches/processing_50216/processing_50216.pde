
//Homework #3 :: 51-257 Sec A :: Michael Loffredo :: mlloffre 
//copyright michael loffredo 2012

float x; 
float r;
float g;
float b;
float a;

void setup () {
  size (400, 400); 
  background (0); 
  frameRate (40);
  smooth (); 
  x = 30;
  
}

void draw () {
  r = random (0, 50);
  g = random (255);
  b = random (255);
  a = random (0, 50);
  noStroke (); 
  fill (r, g, b, a);
  
  
  x = x + .5;


if (mousePressed) {
  ellipse (mouseX, mouseY, x, x);
}
}
  
  


