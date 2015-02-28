
// imgSpeed
// uses the brightness of an image to control the speed of particles
// Code by C.Reas and B.Fry, Processing. page 340
// comments by N.Senske 2009
import processing.pdf.*;
  
boolean recording;
PGraphicsPDF pdf;


int num = 5000;  //number of particles in the scene
float[] x = new float[num];  // make an array to store their x coordinates
float[] y = new float[num];  // and one for their y coordinates
PImage img;

void setup(){
  size(500,700);
  img = loadImage("figure.jpeg");
  
  //seed the arrays with random x and y coordinates:
  for (int i = 0; i < num; i++){  
    x[i] = random(width);
    y[i] = random(height);
  }
   
}

void draw(){
  background(0);
  for (int i = 0; i < num; i++){
    color c = img.get(int(x[i]), int(y[i]));  // get the color from our image at a coordinate determined by the arrays
    float b = brightness(c) / 255.0;          // set b equal to a fraction from 0-1.0 based on the brightness of that color c
    float speed = pow(b,2) + 0.1;            // let speed be equal to b squared plus 0.05
    x[i] += speed;                            // move the particles using speed (the current x position + speed = new x position)
    
    if (x[i] > width) {                       // if the particles leave the window
      x[i] = random(0);                               // start them over on the left side...
      y[i] = random(height);                  // ...at a new, random height
    }
    
    rect(x[i], y[i],3,3);
    noStroke();
fill(255);    // draw the point to the screen
  }
}

void keyPressed() {
     
if((key=='s')||(key=='S')) {
    saveFrame("####.pdf");
  }
 

  
}

