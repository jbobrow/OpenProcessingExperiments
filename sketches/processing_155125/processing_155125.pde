
/*
 * Creative Coding
 * Week 3, 02 - array with sin()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program demonstrates the use of arrays.
 * It creates three arrays that store the y-position, speed and phase of some oscillating circles.
 * You can change the number of circles by changing the value of num in setup()
 * You can change the background colour by holding the left mouse button and dragging.
 * 
 */

int     num;    // the number of items in the array (# of circles)
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle

float red = 120;
float green = 120;
float blue = 120;
float radi;
int b;


void setup() {
  size(500, 500);

  num = 5;
  b = 2;
  // allocate space for each array
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(5);
    phase[i] = random(TWO_PI);
  }
}


void draw() {
  background(red, green, blue);
  
  

  for (int i=0; i<num; i++) {
    
   
      // calculate the x-position of each ball based on the speed, phase and current frame
    float x = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 200;
    ellipse(x, y[i], 20, 20);
      
    radi = dist(mouseX, mouseY, x, y[i]);
    
    if (mousePressed && radi <= 70 && b%2==0){
      speed[i] = 0;
      b++;
      println("b is equal to: " + b);
    }
    else if(mousePressed && radi <= 70 && b%2==1){
        speed[i] = random(5);
        phase[i] = random(TWO_PI);
        b++; 
        println("bb is equal to: " + b);     
     }
    
}
}


// change the background colour if the mouse is dragged
void mouseDragged(){
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}


        


 



