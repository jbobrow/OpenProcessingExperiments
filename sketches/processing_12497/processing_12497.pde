
float diam=20;
float r=100;
float g=150;
float b=200;
float a=200;

void setup () {
  size (500,500); //size of screen
  background (0); //black background
  smooth ();
}

void draw () {
diam= random (100);
r= random (255);
g= random (255);
b= random (255);
a= random (255);

ellipse (pmouseX, pmouseY, diam, diam); //location of mouse
  fill (r,g,b,a); //colour of cirlce
  noStroke (); //no outline
  abs (mouseX-pmouseX); //the speed at which the mouse is moving
}

