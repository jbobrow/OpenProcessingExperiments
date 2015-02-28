
//Code by Dharman Gersch 2013

//graphs the sine, cosine and tan functions scaled by the mouse

//------------------------------------------------imports
//import processing.opengl.*;
PFont fontA;
//------------------------------------------------global variables
int xRange = 900;
int YscaleFactor = 100;
float resolution = 0.2;

//------------------------------------------------setup
void setup() {


  size(900, 600, P2D);
  smooth();
  stroke(200); 
  strokeWeight(1);
  background(0);

  fontA = loadFont("ArialMT-48.vlw");
  textFont(fontA, 16);
}
//------------------------------------------------draw
void draw() {
  background(0);
  stroke(0);
  //formula for catenary (hyperbolic function)

  //graph sin function
  for (float i=0;i<xRange;i=i+resolution) {
    stroke(255, 0, 0);
    point(i, (mouseY*sin(i/mouseY))+(height/2));
  }

  //graph cos function 
  for (float j=0;j<xRange;j=j+resolution) {
    stroke(0, 255, 0);
    point(j, (mouseY*cos(j/mouseY))+(height/2));
  }
  //graph tan function
  for (float i=0;i<xRange;i=i+resolution) {

    stroke(0, 0, 255);
    point(i, (mouseY*tan(i/mouseY))+(height/2));
  }

  for (float i=0;i<xRange;i=i+resolution) {
    //graph acos function
    stroke(255, 255, 0);
    point(i, (mouseY*acos(i/mouseY))+(height/2));
  }


  //graph cosh function
  for (float i=0;i<xRange;i=i+resolution) {
    stroke(255, 0, 255);
    point(i, mouseX*(exp(i/mouseY) + exp(-i/mouseY))/2 );
  }
  
  
  fill(255, 0, 0); 
  text("sin", 5, 15);
  fill(0, 255, 0);
  text("cos", 5, 30);
  fill(0, 0, 255);
  text("tan", 5, 45);
  fill(255, 255, 0);
  text("acos", 5, 60);
  fill(255, 0, 266);
  text("cosh", 5, 75);

  //end draw
}
//------------------------------------------------additional functions


