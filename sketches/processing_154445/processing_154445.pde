
/*
 * Creative Coding
 * Week 2, 06 - Moving Patterns 2
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * Similar to the previous sketch, this sketch draws a grid of oscillating circles. Each circle has a "lifetime"
 * over which it grows and changes intensity and opacity. At the end of each lifetime the circle begins again.
 * Pressing the left and right arrow keys changes the lifetime of all the circles globally.
 * 
 * Another Variation, the cells are arranged in a spiral 
 * click canvas to change framerate
 * press space to pause / restart
 *
 * color is controlled through the x-mouse-position
 */

float angle = 0; 
float angleStep = 0.382;
float radiusMax, radius;
float radiusStep = 1;
float mx, my; 
float cellSize = 20; 
float sizeStep = 0.075;
int frame_rate_value;
boolean doLoop = true; 

void setup() {
  size(600, 600); 
  background(0); 
  smooth(); 
  colorMode(HSB, 360, 100, 100);

  frame_rate_value = 100;

  radiusMax = width;
  radius = 40;
  mx = width/2; 
  my = height/2;
}

void draw() {
  background(0); 
  
  if(mousePressed){
    frame_rate_value = (int) map(mouseX, 0, width, 2, 120);
    println("Current frame Rate is: " + frame_rate_value);
  }
  
  radius =  10; 
  angle = 0; 
  cellSize = 20; 
  int counter = 0;   

   while (radius < radiusMax) {
    float x = mx + radius * sin(angle);
    float y = my + radius * cos(angle);
    float size =  cellSize * abs(sqrt(1+atan(angle))) *  abs(sin(frameCount/20 * HALF_PI)); 
    movingCircle(x, y, size, counter,radius); 
    
    float x = mx + radius * sin(angle-PI/2);
    float y = my + radius * cos(angle+PI/2);
    float size =  cellSize * abs(sqrt(1+atan(angle))) *  abs(cos(frameCount/20 * HALF_PI)); 
    movingCircle(x, y, size, counter,radius); 
    
    float x = mx + radius * sin(angle-PI);
    float y = my + radius * cos(angle+PI);
    float size =  cellSize * abs(sqrt(1+atan(angle))) *  abs(sin(frameCount/20 * HALF_PI)); 
    movingCircle(x, y, size, counter, radius); 
    
    float x = mx + radius * sin(angle-3*PI/2);
    float y = my + radius * cos(angle+3*PI/2);
    float size =  cellSize * abs(sqrt(1+atan(angle))) *  abs(cos(frameCount/20 * HALF_PI)); 
    movingCircle(x, y, size, counter, radius); 
    angle += angleStep; 
    radius += radiusStep;
    cellSize += sizeStep;
    counter++;
   }
}

void movingCircle(float x, float y, float size, int offset, int radius) {
  float circleAge;
  float circlePeriod = (float)frame_rate_value;  

  // circleAge = (float) ((frameCount + offset) % (int)circlePeriod) / circlePeriod;


   strokeWeight(map(sqrt(size),0,sqrt(20),0,0.5) );
   //stroke(255, map(size,0,20,0,255)); //lerp(255, 0, circleAge)
//  float h = map(mouseX, 0, width, 0, 360);
float h=map(radius*size,0,width*25,0,360)
  //fill(h, lerp(50, 100, circleAge), lerp(50, 100, circleAge), lerp(200, 0, circleAge)); 
  fill(h, map(size,0,1,150,255), map(size,0,20,50,255),map(size,0,20,0,255))
  ellipse(x, y, size, size);
}

void keyReleased() {

  if( key == 's'){
    if(doLoop){
      doLoop = false; 
      noLoop(); 
    } else{
      doLoop = true; 
      loop(); 
    }
  }
}  


