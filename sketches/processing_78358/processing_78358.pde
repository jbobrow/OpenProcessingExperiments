
// I originally found This Sketch online when I was looking for guidance whith coding a complex spiral.
//this was EXACTLY what I had in mind for my project. I decided that i would take this sketch, disect it,
//  intensly modify it to better suite my project and Explain it as i went along to prove my understanding of it.
// This projection is used in my film, and is ideal for the message behind "paradise circus".
// http://www.openprocessing.org/sketch/65432

// Candice Ferreira
// 2nd Year New Media 2012


//Declaring Variables. Changed all variables names to better relate to my way of coding.
float a;
float b;
float c;
float theta; // theta = angel of rotation
int multi = 1;
float cirlce;

// Mouse movement related
// EX:	http://www.processing.org/reference/PGraphics.html

PGraphics pg;

void setup() {
  size(1600, 980, P2D);// Renderer. EX: http://www.processing.org/reference/size_.html
  strokeWeight(3);// changed strokeWeight
  frame.setBackground(new java.awt.Color(0, 0, 0)); // added this to my presentation so there would be no grey boarder
  noFill();
  noCursor();// added this to remove the presence of the cursor on screen
  smooth();
  background(0);
  frameRate(140);// changed framerate
  cirlce=30;
  //theta = angle of rotation
  theta=360*cirlce;
  pg =  createGraphics(1600, 980, P2D);// changed size
  pg.beginDraw();
  pg.background(0);
  pg.noFill();
  pg.smooth();
  pg.endDraw();
}


void draw() {

  pg.beginDraw();
  pg.strokeWeight(3);// changed stroke weight
  cirlce=.50+100*mouseX/width;

  pg.translate(width/2, height/2); // determines position of spiral. /2 = center

  for (int i =0; i< 200; i++) {
    theta=theta+ multi*1.29; // Shot back and forth between 1.29 & .29 for different spiral effect in film

    a = 360-theta/cirlce;


    if (theta < 0 || theta >360*cirlce) {
      multi = multi * -1; 
      break;
    }
    // Determin double stroke colours based on mouse position. changed colour
    if (multi > 0) {
      pg.stroke(127, 0, 0);
    }
    if (multi < 0) {
      pg.stroke(0, 0, 0);
    }


    b =a*cos(radians(theta)); 
    c =a*sin(radians(theta));


    pg.point (c, b);
  }
  pg.endDraw();
  translate(width/2, height/2); // center the spiral
  pushMatrix();
  rotate(radians(theta));

  image(pg, -width/2, -height/2); // image position& movement on screen


  popMatrix();
}


