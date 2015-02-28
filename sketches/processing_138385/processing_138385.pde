

//import minim
import ddf.minim.*;

// falling man
//global variables
Minim minim;
AudioPlayer jumping;

// Declare a PImage variable type
PImage fractal;
 float x = 0.0;
 float a = 0.0;


void setup(){
  minim = new Minim(this);
  jumping = minim. loadFile("JUMPING.mp3");
  jumping.play();
  
   background(#FFFFFF);
 size(800,800);
   fractal = loadImage ("fractal.jpg.png");
 
  }
// draw

void draw() {
background(#FFFFFF);
 stroke(#AA8F03);
   strokeWeight(2.5);
 
 line(0,1,500,800);
line(1,0,1200,800);  
line(2,-1,1500,800);
line(3,-1,3800,800); 

  a = a - 0.0009;
   x = cos(a)*-6.3;
  scale(x);
 image(fractal,100,50);
   stroke(#AA8F03);
   strokeWeight(2.5);
 
   x = cos(a)*-6.3;
   line(0,1,500,800);
line(1,0,1200,800);  
line(2,-1,1500,800);
line(3,-1,3800,800);
}

