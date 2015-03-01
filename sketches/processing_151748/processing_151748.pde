
/*
 * Written for the FutureLearn Creative Coding Course of Monash University
 * Week 2, 04 - The Clocks
 * modified by Luvi, June 15th 2014
 *
 * This program draws a grid of alternately circular and square "clocks", whose hands move faster
 * the higher the clock number is.
 * The functions "movingCircle" and "movingCircle2" are used to draw each clock, 
 * using position, size and hand angle as arguments and depending on whether its number is even or odd.
 * Colors are set to change randomly for psychedelic effect.
 *
 */
 
 void setup() {
  size(600, 600);
  background(0);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(0);
  noStroke();
 
  int num = 5;
  int margin = 80;
 
  float gutter = 20; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
 
  int circleNumber = 0; // counter
 
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;
 
      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      
      if (circleNumber % 2 !=0 ){
         
      movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
    }
     
      else    
      movingCircle2(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
    }
     
  }
}//end of draw

void movingCircle(float x, float y, float size, float angle) {
 
  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);
 
  stroke(random(255),0,255);
  strokeWeight(10);
  fill(0,50,random(255),100);
  ellipse(x, y, size, size); // lilac circle
 
  stroke(random(255),120,200);
  line(x, y, tempX, tempY); // purple line
   
}
void movingCircle2(float x, float y, float size, float angle) {
  // calculate endpoint of the line
  float tempX = x - (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);
 
  stroke(0,0,random(255));
  strokeWeight(10);
  fill(140,255,255, 200);
  rect(x, y, size, size); // circle2 ie square
 
  stroke(0,0,random(255), 200);
  line(x, y, tempX, tempY); // white line
}
