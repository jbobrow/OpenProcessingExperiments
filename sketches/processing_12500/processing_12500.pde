
float r= 100;
float g= 150;
float b= 200;
float a= 200;

float diam= 20;
float x= 100;
float y= 100;

void setup () {
  size (500,500);
  background (0);
  smooth () ;
}

void draw () {
  // fill all varibles with random values
  r= random (255);
  g= random (255);
  b= random (255);
  a= random (255);
  diam= random (20);
  x= random (width);
  y= random (height);
  
  //use values to draw an ellipse
  noStroke ();
  fill (r,g,b,a);
  ellipse (x, y, diam, diam);
}

