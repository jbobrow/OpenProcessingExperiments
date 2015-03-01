
/*=======================================
Crazy Lines - Vertical
Homework 2
Crazy Lines - LAB
 
Modified 2/3/2015
 
Sarah Hockman
hockman.25@osu.edu
hockman.25@gmail.com
 
Created for Art 3001 - Data Visualization
BFA in Art and Technology
The Ohio State University
http://www.openprocessing.org/classroom/4626
 
=======================================*/
 


//setup animation
void setup() {
  size(500,500);
  frameRate(200);
  strokeWeight(3);
}

//appearance
void draw(){
  background(0);
  stroke (random(100,255),random(100,255),random(100,255));
  line ( 200, (random(50,500)), 300, (random(50,500)) );
}
