
/* Source of
 * Creative Coding 
 * Week 3, 04 - spinning top: curved motion with sin() and cos() 
 * by Indae Hwang and Jon McCormack 
 * Copyright (c) 2014 Monash University 
 * I modified the original sketch in values of proximity,red,green and blue
 * It converted the image in geometry
*/
float[] x;      // position 
float[] y; 
float[] xInc;   // change per frame 
float[] yInc; 

int numArray;   // number of elements 

float proximity;  // if distance between elements < proximity then draw a line between them 
   
float red; 
float green; 
float blue; 
   
void setup() { 
  size(700, 700); 

  numArray = 50; 
  
  // allocate arrays 
  x= new float[numArray]; 
  y= new float[numArray]; 
  xInc= new float[numArray]; 
  yInc= new float[numArray]; 

  proximity = 800;   // influence distance 
     
  red = 0; 
  green = 0; 
  blue = 0; 

  // random starting position and direction 
  for (int i=0; i<numArray; i++) { 

    x[i] = random(width); 
    y[i] = random(height); 
    xInc[i] = random(-4, 4); 
    yInc[i] = random(-4, 4); 
  } 
  background (0); 
  strokeWeight(1); 
} 


void draw() {    
  // background(255); 

  // iterate over each point 
  for (int i=0; i<numArray; i++) { 

    x[i] += xInc[i]; 
    y[i] += yInc[i]; 
 

    // bounce off the sides of the window 
    if (x[i] > width || x[i] < 0) { 
      xInc[i] = xInc[i] > 0 ? -random(4) : random(4); 
    } 
   
    if (y[i] > height || y[i] < 0 ) { 
      yInc[i] = yInc[i] > 0 ? -random(4) : random(4); 
    } 
 
    // drawElement(x[i], y[i], xInc[i], yInc[i]); 

  } 

  for (int i=0; i<numArray; i++) { 
    for (int j=0; j<i; j++) { 
      red = map(x[i], 0, width, 0, 255); 
      green = map(y[i], 0, height, 0, 255); 
      blue = map(x[i]+y[i], 0, (width+height), 255, 0); 

      float distance = dist(x[i], y[i], x[j], y[j]  ); 

      if (distance < proximity) { 
        if (i%2 == 0 && j%2==0) { 
          stroke(red, green, blue, 1000); 
        } 
        else { 
          stroke(red, green, blue, 1000); 

        } 

        line(x[i], y[i], x[j], y[j]  ); 
      } 
    } 


  }

} 

